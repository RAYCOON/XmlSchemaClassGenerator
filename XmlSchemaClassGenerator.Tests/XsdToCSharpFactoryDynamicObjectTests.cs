using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    public class XsdToCSharpFactoryDynamicObjectTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdToCSharpFactoryDynamicObjectTests(ITestOutputHelper output)
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
        public void DynamicObjectTest_CreateSetReadCompare_ShouldWorkCorrectly()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    <xs:element name=""TestObject"" type=""tns:TestObjectType""/>
    <xs:complexType name=""TestObjectType"">
        <xs:sequence>
            <xs:element name=""StringProperty"" type=""xs:string""/>
            <xs:element name=""IntProperty"" type=""xs:int""/>
            <xs:element name=""BoolProperty"" type=""xs:boolean""/>
            <xs:element name=""DecimalProperty"" type=""xs:decimal""/>
        </xs:sequence>
        <xs:attribute name=""Id"" type=""xs:string"" use=""required""/>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);

            // Generate C# code using the existing Generator
            var config = new GeneratorConfiguration
            {
                GenerateNullables = true,
                NamespacePrefix = "TestNamespace"
            };

            var memoryWriter = new MemoryOutputWriter();
            config.OutputWriter = memoryWriter;

            var generator = new Generator
            {
                GenerateNullables = config.GenerateNullables,
                NamespacePrefix = config.NamespacePrefix,
                OutputWriter = memoryWriter
            };

            generator.Generate(new[] { xsdFile });

            // Debug: Check if any code was generated
            _output.WriteLine($"Generated {memoryWriter.GeneratedCode.Count} code units");
            foreach (var kvp in memoryWriter.GeneratedCode)
            {
                _output.WriteLine($"Namespace: {kvp.Key}");
                _output.WriteLine($"Code length: {kvp.Value.Length}");
            }

            if (memoryWriter.GeneratedCode.Count == 0)
            {
                throw new InvalidOperationException("No code was generated from XSD");
            }

            // Compile the generated C# code
            var generatedCode = memoryWriter.GeneratedCode.Values.First();
            _output.WriteLine("Generated C# code:");
            _output.WriteLine(generatedCode);

            var compiledTypes = CompileCode(generatedCode);
            var testObjectType = compiledTypes.First(t => t.Name == "TestObjectType");

            // Act - Create dynamic object and set properties
            var dynamicObject = Activator.CreateInstance(testObjectType);

            // Set properties dynamically
            var stringProperty = testObjectType.GetProperty("StringProperty");
            var intProperty = testObjectType.GetProperty("IntProperty");
            var boolProperty = testObjectType.GetProperty("BoolProperty");
            var decimalProperty = testObjectType.GetProperty("DecimalProperty");
            var idProperty = testObjectType.GetProperty("Id");

            Assert.NotNull(stringProperty);
            Assert.NotNull(intProperty);
            Assert.NotNull(boolProperty);
            Assert.NotNull(decimalProperty);
            Assert.NotNull(idProperty);

            // Set test values
            const string expectedString = "Test String Value";
            const int expectedInt = 42;
            const bool expectedBool = true;
            const decimal expectedDecimal = 123.45m;
            const string expectedId = "TEST-ID-001";

            stringProperty.SetValue(dynamicObject, expectedString);
            intProperty.SetValue(dynamicObject, expectedInt);
            boolProperty.SetValue(dynamicObject, expectedBool);
            decimalProperty.SetValue(dynamicObject, expectedDecimal);
            idProperty.SetValue(dynamicObject, expectedId);

            // Read properties back dynamically
            var actualString = stringProperty.GetValue(dynamicObject);
            var actualInt = intProperty.GetValue(dynamicObject);
            var actualBool = boolProperty.GetValue(dynamicObject);
            var actualDecimal = decimalProperty.GetValue(dynamicObject);
            var actualId = idProperty.GetValue(dynamicObject);

            // Assert - Compare values
            Assert.Equal(expectedString, actualString);
            Assert.Equal(expectedInt, actualInt);
            Assert.Equal(expectedBool, actualBool);
            Assert.Equal(expectedDecimal, actualDecimal);
            Assert.Equal(expectedId, actualId);

            _output.WriteLine($"Successfully set and retrieved properties:");
            _output.WriteLine($"StringProperty: {actualString}");
            _output.WriteLine($"IntProperty: {actualInt}");
            _output.WriteLine($"BoolProperty: {actualBool}");
            _output.WriteLine($"DecimalProperty: {actualDecimal}");
            _output.WriteLine($"Id: {actualId}");
        }

        [Fact]
        public void DynamicObjectTest_WithComplexTypes_ShouldWorkCorrectly()
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
            <xs:element name=""Address"" type=""tns:AddressType""/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""ZipCode"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);

            var config = new GeneratorConfiguration
            {
                GenerateNullables = true,
                NamespacePrefix = "TestNamespace"
            };

            var memoryWriter = new MemoryOutputWriter();
            config.OutputWriter = memoryWriter;
            
            var generator = new Generator
            {
                GenerateNullables = config.GenerateNullables,
                NamespacePrefix = config.NamespacePrefix,
                OutputWriter = memoryWriter
            };

            generator.Generate(new[] { xsdFile });

            var generatedCode = memoryWriter.GeneratedCode.Values.First();
            var compiledTypes = CompileCode(generatedCode);
            
            var personType = compiledTypes.First(t => t.Name == "PersonType");
            var addressType = compiledTypes.First(t => t.Name == "AddressType");

            // Act - Create and manipulate complex nested objects
            var person = Activator.CreateInstance(personType);
            var address = Activator.CreateInstance(addressType);

            // Set address properties
            var streetProperty = addressType.GetProperty("Street");
            var cityProperty = addressType.GetProperty("City");
            var zipProperty = addressType.GetProperty("ZipCode");

            streetProperty.SetValue(address, "123 Main Street");
            cityProperty.SetValue(address, "San Francisco");
            zipProperty.SetValue(address, "94105");

            // Set person properties
            var nameProperty = personType.GetProperty("Name");
            var ageProperty = personType.GetProperty("Age");
            var addressProperty = personType.GetProperty("Address");

            nameProperty.SetValue(person, "John Doe");
            ageProperty.SetValue(person, 30);
            addressProperty.SetValue(person, address);

            // Read back and verify
            var actualName = nameProperty.GetValue(person);
            var actualAge = ageProperty.GetValue(person);
            var actualAddress = addressProperty.GetValue(person);

            Assert.Equal("John Doe", actualName);
            Assert.Equal(30, actualAge);
            Assert.NotNull(actualAddress);

            // Verify nested address properties
            var actualStreet = streetProperty.GetValue(actualAddress);
            var actualCity = cityProperty.GetValue(actualAddress);
            var actualZip = zipProperty.GetValue(actualAddress);

            Assert.Equal("123 Main Street", actualStreet);
            Assert.Equal("San Francisco", actualCity);
            Assert.Equal("94105", actualZip);

            _output.WriteLine($"Person: {actualName}, Age: {actualAge}");
            _output.WriteLine($"Address: {actualStreet}, {actualCity} {actualZip}");
        }

        private Type[] CompileCode(string sourceCode)
        {
            var syntaxTree = CSharpSyntaxTree.ParseText(sourceCode);

            var references = new List<MetadataReference>
            {
                MetadataReference.CreateFromFile(typeof(object).Assembly.Location),
                MetadataReference.CreateFromFile(typeof(System.Xml.XmlDocument).Assembly.Location),
                MetadataReference.CreateFromFile(typeof(System.Xml.Serialization.XmlSerializer).Assembly.Location),
                MetadataReference.CreateFromFile(typeof(System.ComponentModel.DataAnnotations.RequiredAttribute).Assembly.Location),
                MetadataReference.CreateFromFile(Assembly.Load("System.Runtime").Location),
                MetadataReference.CreateFromFile(Assembly.Load("System.Collections").Location),
                MetadataReference.CreateFromFile(typeof(System.ComponentModel.DesignerCategoryAttribute).Assembly.Location)
            };

            // Try to add additional references
            try
            {
                references.Add(MetadataReference.CreateFromFile(Assembly.Load("netstandard").Location));
                references.Add(MetadataReference.CreateFromFile(Assembly.Load("System.ComponentModel.Primitives").Location));
            }
            catch
            {
                // Not available, continue without them
            }

            var compilation = CSharpCompilation.Create(
                "DynamicTestAssembly",
                new[] { syntaxTree },
                references,
                new CSharpCompilationOptions(OutputKind.DynamicallyLinkedLibrary));

            using var ms = new MemoryStream();
            var result = compilation.Emit(ms);

            if (!result.Success)
            {
                var errors = string.Join(Environment.NewLine,
                    result.Diagnostics
                        .Where(d => d.Severity == DiagnosticSeverity.Error)
                        .Select(d => $"{d.Id}: {d.GetMessage()}"));

                throw new InvalidOperationException($"Failed to compile generated code: {errors}");
            }

            ms.Seek(0, SeekOrigin.Begin);
            var assembly = Assembly.Load(ms.ToArray());
            return assembly.GetTypes();
        }

        private class MemoryOutputWriter : OutputWriter
        {
            public Dictionary<string, string> GeneratedCode { get; } = new Dictionary<string, string>();

            public override void Write(System.CodeDom.CodeNamespace codeNamespace)
            {
                using var writer = new StringWriter();
                var cu = new System.CodeDom.CodeCompileUnit();
                cu.Namespaces.Add(codeNamespace);
                
                // Use the base class Write method which handles semicolon removal
                Write(writer, cu);

                var namespaceName = string.IsNullOrEmpty(codeNamespace.Name) ? "Generated" : codeNamespace.Name;
                GeneratedCode[namespaceName] = writer.ToString();
            }
        }
    }
}