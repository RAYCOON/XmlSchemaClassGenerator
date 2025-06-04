using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Tests for the extended XsdTypeNavigator functionality with array index support
    /// Testing property paths like "S071.Person[0].Name"
    /// </summary>
    public class XsdTypeNavigatorArrayIndexTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdTypeNavigatorArrayIndexTests(ITestOutputHelper output)
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
        public void SelectPropertyWithPath_SimpleArrayPath_ShouldParseCorrectly()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""Items"" type=""tns:ItemType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemType"">
        <xs:sequence>
            <xs:element name=""ProductName"" type=""xs:string""/>
            <xs:element name=""Quantity"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            // Act & Assert - Test path parsing
            var itemProperty = navigator.SelectPropertyWithPath("OrderType.Items");
            Assert.NotNull(itemProperty);
            Assert.Equal("Items", itemProperty.Name);

            var productNameProperty = navigator.SelectPropertyWithPath("ItemType.ProductName");
            Assert.NotNull(productNameProperty);
            Assert.Equal("ProductName", productNameProperty.Name);

            _output.WriteLine("✓ Basic property path navigation works");
        }

        [Fact]
        public void GetSetPropertyValue_WithArrayIndex_ShouldWork()
        {
            // Arrange - Create test schema with arrays
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""S071Type"">
        <xs:sequence>
            <xs:element name=""Person"" type=""tns:PersonType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
            <xs:element name=""Address"" type=""tns:AddressType"" minOccurs=""0""/>
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

            // Generate assembly to get actual types
            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "Test" },
                { new NamespaceKey("http://test.example.com"), "Test" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            };

            var assembly = Compiler.GenerateFiles("ArrayIndexTest", new[] { xsdFile }, generator);
            var s071Type = assembly.GetTypes().First(t => t.Name == "S071Type");
            var personType = assembly.GetTypes().First(t => t.Name == "PersonType");
            var addressType = assembly.GetTypes().First(t => t.Name == "AddressType");

            // Act - Create S071 instance and setup data structure
            var s071Instance = Activator.CreateInstance(s071Type);
            
            // Get Person collection property and add persons
            var personCollectionProperty = s071Type.GetProperty("Person");
            Assert.NotNull(personCollectionProperty);
            
            var personCollection = personCollectionProperty.GetValue(s071Instance);
            Assert.NotNull(personCollection);

            // Add first person
            var person1 = Activator.CreateInstance(personType);
            var nameProperty = personType.GetProperty("Name");
            nameProperty.SetValue(person1, "Initial Name");
            
            // Add person to collection
            var addMethod = personCollection.GetType().GetMethod("Add");
            addMethod.Invoke(personCollection, new[] { person1 });

            // Test: Get property value using array index path
            var retrievedName = navigator.GetPropertyValue(s071Instance, "Person[0].Name");
            Assert.Equal("Initial Name", retrievedName);
            _output.WriteLine($"✓ GetPropertyValue('Person[0].Name') = '{retrievedName}'");

            // Test: Set property value using array index path
            var success = navigator.SetPropertyValue(s071Instance, "Person[0].Name", "John Doe via Array Index");
            Assert.True(success);
            _output.WriteLine("✓ SetPropertyValue('Person[0].Name', 'John Doe via Array Index') succeeded");

            // Verify the change
            var updatedName = navigator.GetPropertyValue(s071Instance, "Person[0].Name");
            Assert.Equal("John Doe via Array Index", updatedName);
            _output.WriteLine($"✓ Verified: GetPropertyValue('Person[0].Name') = '{updatedName}'");

            // Test: Deep nested path with array index
            var address = Activator.CreateInstance(addressType);
            var streetProperty = addressType.GetProperty("Street");
            streetProperty.SetValue(address, "Main Street");
            
            var addressProperty = personType.GetProperty("Address");
            addressProperty.SetValue(person1, address);

            var street = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");
            Assert.Equal("Main Street", street);
            _output.WriteLine($"✓ Deep nested path: GetPropertyValue('Person[0].Address.Street') = '{street}'");

            // Test: Set deep nested property
            var setStreetSuccess = navigator.SetPropertyValue(s071Instance, "Person[0].Address.Street", "Navigator Avenue");
            Assert.True(setStreetSuccess);
            
            var newStreet = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");
            Assert.Equal("Navigator Avenue", newStreet);
            _output.WriteLine($"✓ Deep nested set: GetPropertyValue('Person[0].Address.Street') = '{newStreet}'");
        }

        [Fact]
        public void PropertyPathParsing_VariousFormats_ShouldParseCorrectly()
        {
            // Arrange
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(CreateTempXsdFile(@"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""TestType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>"));

            // Act & Assert - Test path parsing using reflection to access private method
            var parseMethod = typeof(XsdTypeNavigator).GetMethod("ParsePropertyPath", 
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            
            // Test simple path
            var simplePath = (PropertyPathInfo)parseMethod.Invoke(navigator, new[] { "S071.Person.Name" });
            Assert.Equal(3, simplePath.PathSegments.Count);
            Assert.Equal("S071", simplePath.PathSegments[0].PropertyName);
            Assert.False(simplePath.PathSegments[0].IsArray);
            Assert.Equal("Person", simplePath.PathSegments[1].PropertyName);
            Assert.Equal("Name", simplePath.PathSegments[2].PropertyName);

            // Test array path
            var arrayPath = (PropertyPathInfo)parseMethod.Invoke(navigator, new[] { "S071.Person[0].Name" });
            Assert.Equal(3, arrayPath.PathSegments.Count);
            Assert.Equal("S071", arrayPath.PathSegments[0].PropertyName);
            Assert.Equal("Person", arrayPath.PathSegments[1].PropertyName);
            Assert.True(arrayPath.PathSegments[1].IsArray);
            Assert.Equal(0, arrayPath.PathSegments[1].ArrayIndex);
            Assert.Equal("Name", arrayPath.PathSegments[2].PropertyName);

            // Test multiple array indices
            var multiArrayPath = (PropertyPathInfo)parseMethod.Invoke(navigator, new[] { "Order.Items[2].SubItems[1].Name" });
            Assert.Equal(4, multiArrayPath.PathSegments.Count);
            Assert.Equal("Order", multiArrayPath.PathSegments[0].PropertyName);
            Assert.Equal("Items", multiArrayPath.PathSegments[1].PropertyName);
            Assert.True(multiArrayPath.PathSegments[1].IsArray);
            Assert.Equal(2, multiArrayPath.PathSegments[1].ArrayIndex);
            Assert.Equal("SubItems", multiArrayPath.PathSegments[2].PropertyName);
            Assert.True(multiArrayPath.PathSegments[2].IsArray);
            Assert.Equal(1, multiArrayPath.PathSegments[2].ArrayIndex);
            Assert.Equal("Name", multiArrayPath.PathSegments[3].PropertyName);

            _output.WriteLine("✓ All path parsing formats work correctly:");
            _output.WriteLine($"  Simple: {simplePath}");
            _output.WriteLine($"  Array: {arrayPath}");
            _output.WriteLine($"  Multi-Array: {multiArrayPath}");
        }

        [Fact]
        public void ArrayIndexNavigation_OutOfBounds_ShouldReturnNull()
        {
            // Arrange - Use EESSI schema for real-world testing
            var xsdPath = Path.Combine(Directory.GetCurrentDirectory(), "xsd", "eessi", "S071-4.4.xsd");
            if (!File.Exists(xsdPath))
            {
                _output.WriteLine("EESSI schema not found, skipping real-world test");
                return;
            }

            var eessiDir = Path.GetDirectoryName(xsdPath);
            var allXsdFiles = new List<string> { xsdPath };
            
            var xadesFile = Path.Combine(eessiDir, "XAdES.xsd");
            var xmldsigFile = Path.Combine(eessiDir, "xmldsig-core-schema.xsd");
            
            if (File.Exists(xadesFile)) allXsdFiles.Add(xadesFile);
            if (File.Exists(xmldsigFile)) allXsdFiles.Add(xmldsigFile);

            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "Eessi" },
                { new NamespaceKey("http://ec.europa.eu/eessi/ns/4_4/S071"), "Eessi" },
                { new NamespaceKey("http://www.w3.org/2000/09/xmldsig#"), "Eessi.XmlDSig" },
                { new NamespaceKey("http://uri.etsi.org/01903/v1.3.2#"), "Eessi.XAdES" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                NamespaceProvider = namespaceMap.ToNamespaceProvider(),
                DataAnnotationMode = DataAnnotationMode.All,
                EmitOrder = false,
                NamingScheme = NamingScheme.PascalCase
            };

            var assembly = Compiler.GenerateFiles("EessiArrayIndexTest", allXsdFiles, generator);
            var factory = new XsdToCSharpFactory(new GeneratorConfiguration
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                EmitOrder = false,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            });
            
            var navigator = factory.GenerateTypesFromXsd(allXsdFiles);
            var types = assembly.GetTypes();
            var s071Type = types.First(t => t.Name == "S071");
            var s071Instance = Activator.CreateInstance(s071Type);

            // Act & Assert - Test out of bounds access
            var result = navigator.GetPropertyValue(s071Instance, "Person[999].Name");
            Assert.Null(result);
            _output.WriteLine("✓ Out of bounds array access returns null");

            // Test setting out of bounds
            var setResult = navigator.SetPropertyValue(s071Instance, "Person[999].Name", "Should Fail");
            Assert.False(setResult);
            _output.WriteLine("✓ Out of bounds array set returns false");
        }
    }
}