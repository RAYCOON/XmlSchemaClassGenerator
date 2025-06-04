using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Tests for the new XsdTypeNavigator functionality that provides XPath-like navigation
    /// through XSD-derived TypeModel objects without requiring runtime compilation
    /// </summary>
    public class XsdTypeNavigatorTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdTypeNavigatorTests(ITestOutputHelper output)
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
        public void GenerateTypesFromXsd_SimpleSchema_ShouldCreateNavigator()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:element name=""Person"" type=""tns:PersonType""/>
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
            <xs:element name=""Email"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            
            var typeNames = navigator.GetAllTypeNames().ToList();
            _output.WriteLine($"Found {typeNames.Count} types: {string.Join(", ", typeNames)}");
            
            Assert.Contains("PersonType", typeNames);
        }

        [Fact]
        public void SelectType_ExistingType_ShouldReturnTypeModel()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""ContactInfo"" type=""tns:ContactInfoType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ContactInfoType"">
        <xs:sequence>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Phone"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var customerType = navigator.SelectType("CustomerType");
            var contactInfoType = navigator.SelectType("ContactInfoType");

            // Assert
            Assert.NotNull(customerType);
            Assert.Equal("CustomerType", customerType.Name);
            
            Assert.NotNull(contactInfoType);
            Assert.Equal("ContactInfoType", contactInfoType.Name);
        }

        [Fact]
        public void SelectProperties_TypeWithProperties_ShouldReturnProperties()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""ProductType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Price"" type=""xs:decimal""/>
            <xs:element name=""Description"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
        <xs:attribute name=""id"" type=""xs:string"" use=""required""/>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var properties = navigator.SelectProperties("ProductType").ToList();

            // Assert
            Assert.NotEmpty(properties);
            _output.WriteLine($"Found {properties.Count} properties:");
            
            foreach (var prop in properties)
            {
                _output.WriteLine($"  - {prop.Name} ({prop.Type?.Name}) [Required: {prop.IsRequired}, Attribute: {prop.IsAttribute}]");
            }

            Assert.Contains(properties, p => p.Name == "Name");
            Assert.Contains(properties, p => p.Name == "Price");
            Assert.Contains(properties, p => p.Name == "Description");
            Assert.Contains(properties, p => p.Name == "Id" && p.IsAttribute);
        }

        [Fact]
        public void SelectProperty_NestedPropertyPath_ShouldReturnCorrectProperty()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""Customer"" type=""tns:CustomerType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Address"" type=""tns:AddressType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var orderNumberProp = navigator.SelectProperty("OrderType/OrderNumber");
            var customerNameProp = navigator.SelectProperty("CustomerType/Name");
            var addressStreetProp = navigator.SelectProperty("AddressType/Street");

            // Assert
            Assert.NotNull(orderNumberProp);
            Assert.Equal("OrderNumber", orderNumberProp.Name);
            
            Assert.NotNull(customerNameProp);
            Assert.Equal("Name", customerNameProp.Name);
            
            Assert.NotNull(addressStreetProp);
            Assert.Equal("Street", addressStreetProp.Name);
        }

        [Fact]
        public void CreateInstance_ValidType_ShouldCreateInstanceNavigator()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
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
            
            // Test property setting and getting
            instance.SetProperty("FirstName", "John");
            instance.SetProperty("LastName", "Doe");
            instance.SetProperty("Age", 30);

            var firstName = instance.GetProperty("FirstName");
            var lastName = instance.GetProperty("LastName");
            var age = instance.GetProperty("Age");

            Assert.Equal("John", firstName);
            Assert.Equal("Doe", lastName);
            Assert.Equal(30, age);

            _output.WriteLine($"Created instance with: FirstName={firstName}, LastName={lastName}, Age={age}");
        }

        [Fact]
        public void GetTypeMetadata_ValidType_ShouldReturnMetadata()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""DocumentType"">
        <xs:annotation>
            <xs:documentation>A document type for testing</xs:documentation>
        </xs:annotation>
        <xs:sequence>
            <xs:element name=""Title"" type=""xs:string""/>
            <xs:element name=""Content"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var metadata = navigator.GetTypeMetadata("DocumentType");

            // Assert
            Assert.NotNull(metadata);
            Assert.Equal("DocumentType", metadata.Name);
            Assert.Equal("http://test.example.com", metadata.XmlNamespace);
            Assert.False(metadata.IsAnonymous);

            _output.WriteLine($"Type: {metadata.Name}");
            _output.WriteLine($"XML Namespace: {metadata.XmlNamespace}");
            _output.WriteLine($"Is Anonymous: {metadata.IsAnonymous}");
        }

        [Fact]
        public void SelectPropertiesWithPatterns_ShouldFilterCorrectly()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""CustomerName"" type=""xs:string""/>
            <xs:element name=""CustomerEmail"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""OrderEmail"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var allEmailProperties = navigator.SelectProperties("*", "*Email").ToList();
            var customerProperties = navigator.SelectProperties("Customer*", "*").ToList();

            // Assert
            Assert.Equal(2, allEmailProperties.Count);
            Assert.Contains(allEmailProperties, p => p.Name == "CustomerEmail");
            Assert.Contains(allEmailProperties, p => p.Name == "OrderEmail");

            Assert.Equal(2, customerProperties.Count);
            Assert.All(customerProperties, p => Assert.Contains("Customer", p.Name));

            _output.WriteLine($"Email properties: {string.Join(", ", allEmailProperties.Select(p => p.Name))}");
            _output.WriteLine($"Customer properties: {string.Join(", ", customerProperties.Select(p => p.Name))}");
        }

        [Fact]
        public void InstanceValidation_MissingRequiredProperty_ShouldReportError()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""Email"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);
            var instance = navigator.CreateInstance("PersonType");

            // Act - only set FirstName, leave required LastName missing
            instance.SetProperty("FirstName", "John");
            instance.SetProperty("Email", "john@example.com");

            var validation = instance.Validate();

            // Assert
            Assert.False(validation.IsValid);
            Assert.Contains(validation.Errors, error => error.Contains("LastName"));
            Assert.DoesNotContain(validation.Errors, error => error.Contains("Email")); // Email is optional

            _output.WriteLine($"Validation errors: {string.Join(", ", validation.Errors)}");
        }

        [Fact]
        public void GetTypeHierarchy_InheritanceChain_ShouldReturnChain()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""BaseType"">
        <xs:sequence>
            <xs:element name=""Id"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""DerivedType"">
        <xs:complexContent>
            <xs:extension base=""tns:BaseType"">
                <xs:sequence>
                    <xs:element name=""Name"" type=""xs:string""/>
                </xs:sequence>
            </xs:extension>
        </xs:complexContent>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act
            var hierarchy = navigator.GetTypeHierarchy("DerivedType").ToList();

            // Assert
            Assert.NotEmpty(hierarchy);
            Assert.Equal("DerivedType", hierarchy.First().Name);
            
            if (hierarchy.Count > 1)
            {
                Assert.Equal("BaseType", hierarchy[1].Name);
            }

            _output.WriteLine($"Type hierarchy: {string.Join(" -> ", hierarchy.Select(t => t.Name))}");
        }
    }
}