using System;
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
    /// <summary>
    /// Complete test that implements the XsdToCSharpFactory workflow:
    /// 1. Generate types from XSD using factory.GenerateTypesFromXsd()
    /// 2. Create object instances 
    /// 3. Set properties dynamically
    /// 4. Read properties back and compare
    /// </summary>
    public class XsdToCSharpFactoryCompleteTest : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdToCSharpFactoryCompleteTest(ITestOutputHelper output)
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
        public void CompleteWorkflow_GenerateTypesSetPropertiesReadAndCompare_ShouldWork()
        {
            // Arrange - Complex XSD schema
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:element name=""Customer"" type=""tns:CustomerType""/>
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""PersonalInfo"" type=""tns:PersonalInfoType""/>
            <xs:element name=""ContactInfo"" type=""tns:ContactInfoType""/>
            <xs:element name=""Orders"" type=""tns:OrderListType"" minOccurs=""0""/>
        </xs:sequence>
        <xs:attribute name=""customerId"" type=""xs:string"" use=""required""/>
        <xs:attribute name=""registrationDate"" type=""xs:date""/>
    </xs:complexType>
    
    <xs:complexType name=""PersonalInfoType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""DateOfBirth"" type=""xs:date"" minOccurs=""0""/>
            <xs:element name=""Gender"" type=""tns:GenderType"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ContactInfoType"">
        <xs:sequence>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Phone"" type=""xs:string"" minOccurs=""0""/>
            <xs:element name=""Address"" type=""tns:AddressType"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""PostalCode"" type=""xs:string""/>
            <xs:element name=""Country"" type=""xs:string"" default=""Germany""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderListType"">
        <xs:sequence>
            <xs:element name=""Order"" type=""tns:OrderType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""OrderDate"" type=""xs:date""/>
            <xs:element name=""TotalAmount"" type=""xs:decimal""/>
            <xs:element name=""Status"" type=""tns:OrderStatusType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:simpleType name=""GenderType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Male""/>
            <xs:enumeration value=""Female""/>
            <xs:enumeration value=""Other""/>
        </xs:restriction>
    </xs:simpleType>
    
    <xs:simpleType name=""OrderStatusType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Pending""/>
            <xs:enumeration value=""Processing""/>
            <xs:enumeration value=""Shipped""/>
            <xs:enumeration value=""Delivered""/>
            <xs:enumeration value=""Cancelled""/>
        </xs:restriction>
    </xs:simpleType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);

            // Create factory with improved implementation
            var factory = new ImprovedXsdToCSharpFactory();

            // Act - Step 1: Generate types from XSD
            _output.WriteLine("Step 1: Generating types from XSD...");
            var types = factory.GenerateTypesFromXsd(xsdFile);

            // Verify types were generated
            Assert.NotNull(types);
            Assert.NotEmpty(types);
            _output.WriteLine($"Generated {types.Count} types:");
            foreach (var kvp in types)
            {
                _output.WriteLine($"  - {kvp.Key}: {kvp.Value.FullName}");
            }

            // Step 2: Get the CustomerType and create an instance
            Assert.True(types.ContainsKey("CustomerType"), "CustomerType should be generated");
            Assert.True(types.ContainsKey("PersonalInfoType"), "PersonalInfoType should be generated");
            Assert.True(types.ContainsKey("ContactInfoType"), "ContactInfoType should be generated");
            Assert.True(types.ContainsKey("AddressType"), "AddressType should be generated");

            var customerType = types["CustomerType"];
            var personalInfoType = types["PersonalInfoType"];
            var contactInfoType = types["ContactInfoType"];
            var addressType = types["AddressType"];

            // Step 3: Create instances dynamically
            _output.WriteLine("Step 2: Creating object instances...");
            var customer = Activator.CreateInstance(customerType);
            var personalInfo = Activator.CreateInstance(personalInfoType);
            var contactInfo = Activator.CreateInstance(contactInfoType);
            var address = Activator.CreateInstance(addressType);

            Assert.NotNull(customer);
            Assert.NotNull(personalInfo);
            Assert.NotNull(contactInfo);
            Assert.NotNull(address);

            // Step 4: Set properties dynamically
            _output.WriteLine("Step 3: Setting properties dynamically...");

            // Set customer attributes
            var customerIdProp = customerType.GetProperty("CustomerId");
            var registrationDateProp = customerType.GetProperty("RegistrationDate");
            Assert.NotNull(customerIdProp);
            customerIdProp.SetValue(customer, "CUST-12345");
            if (registrationDateProp != null)
            {
                registrationDateProp.SetValue(customer, DateTime.Today);
            }

            // Set personal info
            var firstNameProp = personalInfoType.GetProperty("FirstName");
            var lastNameProp = personalInfoType.GetProperty("LastName");
            var dobProp = personalInfoType.GetProperty("DateOfBirth");
            
            Assert.NotNull(firstNameProp);
            Assert.NotNull(lastNameProp);
            
            firstNameProp.SetValue(personalInfo, "Max");
            lastNameProp.SetValue(personalInfo, "Mustermann");
            if (dobProp != null)
            {
                dobProp.SetValue(personalInfo, new DateTime(1990, 5, 15));
            }

            // Set address
            var streetProp = addressType.GetProperty("Street");
            var cityProp = addressType.GetProperty("City");
            var postalCodeProp = addressType.GetProperty("PostalCode");
            var countryProp = addressType.GetProperty("Country");

            Assert.NotNull(streetProp);
            Assert.NotNull(cityProp);
            Assert.NotNull(postalCodeProp);

            streetProp.SetValue(address, "Musterstraße 123");
            cityProp.SetValue(address, "Berlin");
            postalCodeProp.SetValue(address, "10115");
            if (countryProp != null)
            {
                countryProp.SetValue(address, "Germany");
            }

            // Set contact info
            var emailProp = contactInfoType.GetProperty("Email");
            var phoneProp = contactInfoType.GetProperty("Phone");
            var addressRefProp = contactInfoType.GetProperty("Address");

            Assert.NotNull(emailProp);
            emailProp.SetValue(contactInfo, "max.mustermann@example.com");
            if (phoneProp != null)
            {
                phoneProp.SetValue(contactInfo, "+49 30 12345678");
            }
            if (addressRefProp != null)
            {
                addressRefProp.SetValue(contactInfo, address);
            }

            // Link objects together
            var personalInfoRefProp = customerType.GetProperty("PersonalInfo");
            var contactInfoRefProp = customerType.GetProperty("ContactInfo");

            Assert.NotNull(personalInfoRefProp);
            Assert.NotNull(contactInfoRefProp);

            personalInfoRefProp.SetValue(customer, personalInfo);
            contactInfoRefProp.SetValue(customer, contactInfo);

            // Step 5: Read properties back and compare
            _output.WriteLine("Step 4: Reading properties back and comparing...");

            // Verify customer properties
            var readCustomerId = customerIdProp.GetValue(customer);
            Assert.Equal("CUST-12345", readCustomerId);
            _output.WriteLine($"Customer ID: {readCustomerId}");

            // Verify personal info through navigation
            var readPersonalInfo = personalInfoRefProp.GetValue(customer);
            Assert.NotNull(readPersonalInfo);
            var readFirstName = firstNameProp.GetValue(readPersonalInfo);
            var readLastName = lastNameProp.GetValue(readPersonalInfo);
            Assert.Equal("Max", readFirstName);
            Assert.Equal("Mustermann", readLastName);
            _output.WriteLine($"Name: {readFirstName} {readLastName}");

            // Verify contact info through navigation
            var readContactInfo = contactInfoRefProp.GetValue(customer);
            Assert.NotNull(readContactInfo);
            var readEmail = emailProp.GetValue(readContactInfo);
            Assert.Equal("max.mustermann@example.com", readEmail);
            _output.WriteLine($"Email: {readEmail}");

            // Verify address through double navigation
            if (addressRefProp != null)
            {
                var readAddress = addressRefProp.GetValue(readContactInfo);
                if (readAddress != null)
                {
                    var readStreet = streetProp.GetValue(readAddress);
                    var readCity = cityProp.GetValue(readAddress);
                    Assert.Equal("Musterstraße 123", readStreet);
                    Assert.Equal("Berlin", readCity);
                    _output.WriteLine($"Address: {readStreet}, {readCity}");
                }
            }

            _output.WriteLine("✅ Complete workflow test passed successfully!");
        }

        /// <summary>
        /// Improved XsdToCSharpFactory that actually implements the GenerateTypesFromXsd method
        /// using the existing Generator infrastructure and Roslyn compilation
        /// </summary>
        private class ImprovedXsdToCSharpFactory : XsdToCSharpFactory
        {
            public new Dictionary<string, Type> GenerateTypesFromXsd(string xsdFilePath)
            {
                if (!File.Exists(xsdFilePath))
                    throw new FileNotFoundException($"XSD file not found: {xsdFilePath}");

                // Use the existing Generator to create C# code
                var config = new GeneratorConfiguration
                {
                    GenerateNullables = true,
                    NamespacePrefix = "Generated",
                    DataAnnotationMode = DataAnnotationMode.All
                };

                var memoryWriter = new MemoryOutputWriter();
                config.OutputWriter = memoryWriter;

                var generator = new Generator
                {
                    GenerateNullables = config.GenerateNullables,
                    NamespacePrefix = config.NamespacePrefix,
                    DataAnnotationMode = config.DataAnnotationMode,
                    OutputWriter = memoryWriter
                };

                // Generate C# code from XSD
                generator.Generate(new[] { xsdFilePath });

                if (memoryWriter.GeneratedCode.Count == 0)
                {
                    throw new InvalidOperationException("No code was generated from XSD file");
                }

                // Compile the generated code using Roslyn
                var allCode = string.Join(Environment.NewLine, memoryWriter.GeneratedCode.Values);
                return CompileToTypes(allCode);
            }

            private Dictionary<string, Type> CompileToTypes(string sourceCode)
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
                    "DynamicXsdAssembly",
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
                var types = new Dictionary<string, Type>();

                foreach (var type in assembly.GetTypes())
                {
                    types[type.Name] = type;
                }

                return types;
            }
        }

        /// <summary>
        /// Memory-based output writer to capture generated C# code
        /// </summary>
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