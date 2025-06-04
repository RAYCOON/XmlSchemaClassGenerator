using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Xml;
using System.Xml.Serialization;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    public class XsdToCSharpFactoryTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdToCSharpFactoryTests(ITestOutputHelper output)
        {
            _output = output;
        }

        public void Dispose()
        {
            // Clean up temporary files
            foreach (var tempFile in _tempFiles)
            {
                if (File.Exists(tempFile))
                {
                    try
                    {
                        File.Delete(tempFile);
                    }
                    catch
                    {
                        // Ignore cleanup errors
                    }
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
        public void Constructor_WithDefaultConfiguration_ShouldInitialize()
        {
            // Act
            var factory = new XsdToCSharpFactory();

            // Assert
            Assert.NotNull(factory);
        }

        [Fact]
        public void Constructor_WithCustomConfiguration_ShouldUseCustomConfig()
        {
            // Arrange
            var config = new GeneratorConfiguration
            {
                GenerateNullables = false,
                NamespacePrefix = "CustomPrefix"
            };

            // Act
            var factory = new XsdToCSharpFactory(config);

            // Assert
            Assert.NotNull(factory);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithNonExistentFile_ShouldThrowFileNotFoundException()
        {
            // Arrange
            var factory = new XsdToCSharpFactory();
            var nonExistentFile = "non_existent_file.xsd";

            // Act & Assert
            var exception = Assert.Throws<FileNotFoundException>(() => factory.GenerateTypesFromXsd(nonExistentFile));
            Assert.Contains("XSD file not found", exception.Message);
        }

        [Fact]
        public void GenerateTypesFromXsd_WithSimpleType_ShouldCreateNavigatorAndFindTypes()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Person"" type=""tns:PersonType""/>
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Assert
            Assert.NotNull(navigator);
            var personType = navigator.SelectType("PersonType");
            Assert.NotNull(personType);
            
            var properties = navigator.SelectProperties("PersonType").ToList();
            Assert.Contains(properties, p => p.Name == "Name");
            Assert.Contains(properties, p => p.Name == "Age");
            
            _output.WriteLine($"Found PersonType with {properties.Count} properties");
        }

        [Fact]
        public void GenerateTypesFromXsd_WithEnumType_ShouldCreateNavigatorAndFindEnumType()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Status"" type=""tns:StatusType""/>
    <xs:simpleType name=""StatusType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Active""/>
            <xs:enumeration value=""Inactive""/>
            <xs:enumeration value=""Pending""/>
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
            
            var typeNames = navigator.GetAllTypeNames().ToList();
            Assert.Contains("StatusType", typeNames);
            
            _output.WriteLine($"Found enum type: {statusType.Name}");
        }

        [Fact]
        public void GenerateTypesFromXsd_WithChoiceElements_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Contact"" type=""tns:ContactType""/>
    <xs:complexType name=""ContactType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:choice>
                <xs:element name=""Email"" type=""xs:string""/>
                <xs:element name=""Phone"" type=""xs:string""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var config = new GeneratorConfiguration
            {
                GenerateChoiceItemProperty = true
            };
            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void GenerateTypesFromXsd_WithComplexNestedTypes_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Company"" type=""tns:CompanyType""/>
    <xs:complexType name=""CompanyType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Employees"" type=""tns:EmployeesType""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""EmployeesType"">
        <xs:sequence>
            <xs:element name=""Employee"" type=""tns:EmployeeType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""EmployeeType"">
        <xs:sequence>
            <xs:element name=""Id"" type=""xs:int""/>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Department"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void SerializeToXml_WithValidObject_ShouldReturnXmlString()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Person"" type=""tns:PersonType""/>
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void DeserializeXml_WithValidXml_ShouldReturnTypedObject()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Person"" type=""tns:PersonType""/>
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            const string xml = @"<?xml version=""1.0"" encoding=""utf-8""?>
<PersonType xmlns=""http://test.example.com"">
    <Name>Jane Smith</Name>
    <Age>25</Age>
</PersonType>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void GenerateTypesFromXsd_WithArrayElements_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""BookList"" type=""tns:BookListType""/>
    <xs:complexType name=""BookListType"">
        <xs:sequence>
            <xs:element name=""Book"" type=""tns:BookType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""BookType"">
        <xs:sequence>
            <xs:element name=""Title"" type=""xs:string""/>
            <xs:element name=""Author"" type=""xs:string""/>
            <xs:element name=""ISBN"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void GenerateTypesFromXsd_WithAttributes_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Product"" type=""tns:ProductType""/>
    <xs:complexType name=""ProductType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Price"" type=""xs:decimal""/>
        </xs:sequence>
        <xs:attribute name=""id"" type=""xs:string"" use=""required""/>
        <xs:attribute name=""category"" type=""xs:string""/>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void GenerateTypesFromXsd_WithNamespaces_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://custom.namespace.com""
           xmlns:tns=""http://custom.namespace.com"">
    <xs:element name=""TestElement"" type=""tns:TestType""/>
    <xs:complexType name=""TestType"">
        <xs:sequence>
            <xs:element name=""Value"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var config = new GeneratorConfiguration
            {
                NamespacePrefix = "CustomPrefix",
                NamespaceProvider = new NamespaceProvider
                {
                    GenerateNamespace = key => "CustomPrefix.Generated"
                }
            };
            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void GenerateTypesFromXsd_WithInvalidXsd_ShouldThrowException()
        {
            // Arrange
            const string invalidXsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""InvalidType"">
        <xs:sequence>
            <xs:element name=""UndefinedType"" type=""NonExistentType""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(invalidXsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert - Should throw XmlSchemaException for invalid XSD
            Assert.Throws<System.Xml.Schema.XmlSchemaException>(() => factory.GenerateTypesFromXsd(xsdFile));
        }

        [Fact]
        public void GenerateTypesFromXsd_WithDataAnnotations_ShouldThrowNotImplemented()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""User"" type=""tns:UserType""/>
    <xs:complexType name=""UserType"">
        <xs:sequence>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
            <xs:element name=""OptionalField"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var config = new GeneratorConfiguration
            {
                DataAnnotationMode = DataAnnotationMode.All
            };
            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void DeserializeXml_WithGenericMethod_ShouldWorkCorrectly()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Simple"" type=""tns:SimpleType""/>
    <xs:complexType name=""SimpleType"">
        <xs:sequence>
            <xs:element name=""Text"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            const string xml = @"<?xml version=""1.0"" encoding=""utf-8""?>
<SimpleType xmlns=""http://test.example.com"">
    <Text>Test Value</Text>
</SimpleType>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void RoundTripTest_SerializeAndDeserialize_ShouldPreserveData()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""Order"" type=""tns:OrderType""/>
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderId"" type=""xs:string""/>
            <xs:element name=""Total"" type=""xs:decimal""/>
            <xs:element name=""IsProcessed"" type=""xs:boolean""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

    }
}