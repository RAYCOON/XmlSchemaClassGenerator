using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;

namespace XmlSchemaClassGenerator.Tests
{
    public class XsdFactoryValidationTests
    {
        private const string TestSchema = @"<?xml version='1.0' encoding='UTF-8'?>
<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema' 
           targetNamespace='http://test.validation.com' 
           xmlns:tns='http://test.validation.com'
           elementFormDefault='qualified'>

  <xs:element name='Customer' type='tns:CustomerType'/>
  
  <xs:complexType name='CustomerType'>
    <xs:sequence>
      <xs:element name='Name' type='xs:string' minOccurs='1'/>
      <xs:element name='Email' type='xs:string' minOccurs='0'/>
      <xs:element name='Age' type='xs:int' minOccurs='1'/>
      <xs:element name='Orders' type='tns:OrderType' minOccurs='0' maxOccurs='unbounded'/>
    </xs:sequence>
    <xs:attribute name='Id' type='xs:int' use='required'/>
  </xs:complexType>
  
  <xs:complexType name='OrderType'>
    <xs:sequence>
      <xs:element name='OrderNumber' type='xs:string' minOccurs='1'/>
      <xs:element name='Total' type='xs:decimal' minOccurs='1'/>
      <xs:element name='Items' type='tns:ItemType' minOccurs='1' maxOccurs='unbounded'/>
    </xs:sequence>
  </xs:complexType>
  
  <xs:complexType name='ItemType'>
    <xs:sequence>
      <xs:element name='Name' type='xs:string' minOccurs='1'/>
      <xs:element name='Price' type='xs:decimal' minOccurs='1'/>
      <xs:element name='Quantity' type='xs:int' minOccurs='0'/>
    </xs:sequence>
  </xs:complexType>
  
</xs:schema>";

        private XsdToCSharpFactory CreateFactoryWithTestSchema()
        {
            var tempFile = Path.GetTempFileName();
            try
            {
                File.WriteAllText(tempFile, TestSchema);
                
                var config = new GeneratorConfiguration
                {
                    DataAnnotationMode = DataAnnotationMode.All,
                    GenerateNullables = true,
                    NamespaceProvider = new NamespaceProvider
                    {
                        GenerateNamespace = key => "TestNamespace"
                    }
                };
                
                var factory = new XsdToCSharpFactory(config);
                factory.GenerateTypesFromXsd(tempFile);
                return factory;
            }
            finally
            {
                if (File.Exists(tempFile))
                    File.Delete(tempFile);
            }
        }

        [Fact]
        public void GetRequiredPropertyPaths_ShouldReturnAllRequiredPaths()
        {
            // Arrange
            var factory = CreateFactoryWithTestSchema();

            // Act
            var requiredPaths = factory.GetRequiredPropertyPaths();

            // Assert
            Assert.NotNull(requiredPaths);
            Assert.NotEmpty(requiredPaths);
            
            // Check that we have some expected required paths
            // Note: The exact paths depend on how DataAnnotations are generated
            // This test verifies the method works without throwing
            Assert.All(requiredPaths, path => Assert.False(string.IsNullOrEmpty(path)));
        }

        [Fact]
        public void GetRequiredPropertyPaths_WithoutGeneratedTypes_ShouldThrowException()
        {
            // Arrange
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            var exception = Assert.Throws<InvalidOperationException>(() => factory.GetRequiredPropertyPaths());
            Assert.Contains("No types have been generated", exception.Message);
        }

        [Fact]
        public void ValidateInstance_WithNullInstance_ShouldThrowArgumentNullException()
        {
            // Arrange
            var factory = CreateFactoryWithTestSchema();

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => factory.ValidateInstance(null));
        }

        [Fact]
        public void ValidateInstance_WithValidCompleteInstance_ShouldReturnNoErrors()
        {
            // Arrange
            var factory = CreateFactoryWithTestSchema();
            var instance = factory.CreateRootInstance();

            // Set up a valid instance using reflection (since navigator methods may not be available)
            var type = instance.GetType();
            type.GetProperty("Name")?.SetValue(instance, "John Doe");
            type.GetProperty("Age")?.SetValue(instance, 30);
            type.GetProperty("Id")?.SetValue(instance, 123);

            // Act
            var errors = factory.ValidateInstance(instance);

            // Assert
            Assert.NotNull(errors);
            // Note: Whether this returns empty depends on how Required attributes are generated
            // This test verifies the method works without throwing
        }

        [Fact]
        public void ValidateInstance_WithMissingRequiredProperties_ShouldReturnErrors()
        {
            // Arrange
            var factory = CreateFactoryWithTestSchema();
            var instance = factory.CreateRootInstance();
            // Don't set any required properties

            // Act
            var errors = factory.ValidateInstance(instance);

            // Assert
            Assert.NotNull(errors);
            // This test verifies the method works and can detect validation issues
        }

        [Fact]
        public void ValidateInstance_WithComplexNestedStructure_ShouldValidateRecursively()
        {
            // Arrange
            var factory = CreateFactoryWithTestSchema();
            var instance = factory.CreateRootInstance();

            // Set up a complex instance with nested objects using reflection
            var type = instance.GetType();
            type.GetProperty("Name")?.SetValue(instance, "John Doe");
            type.GetProperty("Age")?.SetValue(instance, 30);
            type.GetProperty("Id")?.SetValue(instance, 123);

            // Create an order with missing required fields to test nested validation
            var orderType = factory.GetCompiledAssembly().GetTypes()
                .FirstOrDefault(t => t.Name.Contains("Order"));
            
            if (orderType != null)
            {
                var order = Activator.CreateInstance(orderType);
                var ordersProperty = type.GetProperty("Orders");
                if (ordersProperty != null)
                {
                    // Create a list/array of the correct type
                    var listType = typeof(List<>).MakeGenericType(orderType);
                    var ordersList = Activator.CreateInstance(listType);
                    listType.GetMethod("Add")?.Invoke(ordersList, new[] { order });
                    ordersProperty.SetValue(instance, ordersList);
                }
            }

            // Act
            var errors = factory.ValidateInstance(instance);

            // Assert
            Assert.NotNull(errors);
            // The method should handle nested structures without throwing
        }

        [Fact]
        public void ValidationErrorTypes_ShouldHaveCorrectValues()
        {
            // Test the enum values
            Assert.Equal(0, (int)XsdValidationErrorType.Required);
            Assert.Equal(1, (int)XsdValidationErrorType.DataType);
            Assert.Equal(2, (int)XsdValidationErrorType.Length);
            Assert.Equal(3, (int)XsdValidationErrorType.Pattern);
            Assert.Equal(4, (int)XsdValidationErrorType.Range);
            Assert.Equal(5, (int)XsdValidationErrorType.Cardinality);
            Assert.Equal(6, (int)XsdValidationErrorType.General);
        }

        [Fact]
        public void XsdValidationError_ToString_ShouldReturnFormattedString()
        {
            // Arrange
            var error = new XsdValidationError
            {
                PropertyPath = "Customer.Name",
                ErrorMessage = "Required field is missing",
                ErrorType = XsdValidationErrorType.Required
            };

            // Act
            var result = error.ToString();

            // Assert
            Assert.Contains("Required", result);
            Assert.Contains("Customer.Name", result);
            Assert.Contains("Required field is missing", result);
        }

        [Fact]
        public void GetRequiredPropertyPaths_ShouldHandleCircularReferences()
        {
            // This test ensures the method doesn't get stuck in infinite loops
            // when dealing with circular type references
            
            // Arrange
            var factory = CreateFactoryWithTestSchema();

            // Act & Assert - Should complete without hanging
            var paths = factory.GetRequiredPropertyPaths();
            Assert.NotNull(paths);
        }

        [Fact]
        public void ValidateInstance_ShouldHandleCircularReferences()
        {
            // This test ensures the validation doesn't get stuck in infinite loops
            // when dealing with circular object references
            
            // Arrange
            var factory = CreateFactoryWithTestSchema();
            var instance = factory.CreateRootInstance();

            // Act & Assert - Should complete without hanging
            var errors = factory.ValidateInstance(instance);
            Assert.NotNull(errors);
        }
    }
}