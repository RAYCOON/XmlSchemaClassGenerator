using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Quick tests to verify the basic functionality of XsdToCSharpFactory works
    /// These replace the old NotImplementedException tests
    /// </summary>
    public class XsdToCSharpFactoryQuickTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdToCSharpFactoryQuickTests(ITestOutputHelper output)
        {
            _output = output;
        }

        public void Dispose()
        {
            foreach (var tempFile in _tempFiles)
            {
                if (File.Exists(tempFile))
                {
                    try { File.Delete(tempFile); } catch { }
                }
            }
        }

        private string CreateTempXsdFile(string xsdContent)
        {
            var tempFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempFile, xsdContent);
            _tempFiles.Add(tempFile);
            return tempFile;
        }

        [Fact]
        public void GenerateTypesFromXsd_WithValidXsd_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""TestType"">
        <xs:sequence>
            <xs:element name=""Value"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var testType = navigator.SelectType("TestType");
            Assert.NotNull(testType);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithEnumType_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:simpleType name=""StatusType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Active""/>
            <xs:enumeration value=""Inactive""/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var statusType = navigator.SelectType("StatusType");
            Assert.NotNull(statusType);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithChoiceElements_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""ChoiceType"">
        <xs:choice>
            <xs:element name=""Option1"" type=""xs:string""/>
            <xs:element name=""Option2"" type=""xs:int""/>
        </xs:choice>
    </xs:complexType>
</xs:schema>";

            var config = new GeneratorConfiguration
            {
                GenerateChoiceItemProperty = true,
                NamespaceProvider = new NamespaceProvider
                {
                    GenerateNamespace = key => "Generated"
                }
            };
            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var choiceType = navigator.SelectType("ChoiceType");
            Assert.NotNull(choiceType);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithComplexNestedTypes_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""ParentType"">
        <xs:sequence>
            <xs:element name=""Child"" type=""ChildType""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""ChildType"">
        <xs:sequence>
            <xs:element name=""Value"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var parentType = navigator.SelectType("ParentType");
            var childType = navigator.SelectType("ChildType");
            Assert.NotNull(parentType);
            Assert.NotNull(childType);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithArrayElements_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""ArrayType"">
        <xs:sequence>
            <xs:element name=""Item"" type=""xs:string"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var arrayType = navigator.SelectType("ArrayType");
            Assert.NotNull(arrayType);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithAttributes_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""AttributeType"">
        <xs:sequence>
            <xs:element name=""Value"" type=""xs:string""/>
        </xs:sequence>
        <xs:attribute name=""category"" type=""xs:string""/>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var attributeType = navigator.SelectType("AttributeType");
            Assert.NotNull(attributeType);
            
            var properties = navigator.SelectProperties("AttributeType").ToList();
            Assert.Contains(properties, p => p.IsAttribute); // Should have at least one attribute
        }

        [Fact]
        public void GenerateTypesFromXsd_WithDataAnnotations_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""AnnotatedType"">
        <xs:sequence>
            <xs:element name=""Value"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var config = new GeneratorConfiguration
            {
                DataAnnotationMode = DataAnnotationMode.All,
                NamespaceProvider = new NamespaceProvider
                {
                    GenerateNamespace = key => "Generated"
                }
            };
            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var annotatedType = navigator.SelectType("AnnotatedType");
            Assert.NotNull(annotatedType);
        }

        [Fact]
        public void CreateInstance_WithValidType_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var instance = navigator.CreateInstance("PersonType");

            // Assert
            Assert.NotNull(instance);
            
            // Test property manipulation
            instance.SetProperty("Name", "John Doe");
            instance.SetProperty("Age", 30);
            
            var name = instance.GetProperty("Name");
            var age = instance.GetProperty("Age");
            
            Assert.Equal("John Doe", name);
            Assert.Equal(30, age);
        }

        [Fact]
        public void XPathLikeNavigation_ShouldWork()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""CustomerName"" type=""xs:string""/>
            <xs:element name=""CustomerEmail"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act & Assert
            var customerEmailProp = navigator.SelectProperty("CustomerType/CustomerEmail");
            Assert.NotNull(customerEmailProp);
            Assert.Equal("CustomerEmail", customerEmailProp.Name);

            var allEmailProps = navigator.SelectProperties("*", "*Email").ToList();
            Assert.Single(allEmailProps);
            Assert.Equal("CustomerEmail", allEmailProps[0].Name);

            var allNameProps = navigator.SelectProperties("*", "*Name*").ToList();
            Assert.True(allNameProps.Count >= 1); // Should find at least CustomerName
        }
    }
}