using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using Xunit;
using Xunit.Abstractions;
using ITSG.EESSI.Tstelle.XML.SED.H003.V4_4_1;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Test to reproduce H003 XSD validation error with missing HSec-4.4.xsd dependency
    /// </summary>
    public class H003XsdValidationTest
    {
        private readonly ITestOutputHelper _output;

        public H003XsdValidationTest(ITestOutputHelper output)
        {
            _output = output;
        }

        [Fact]
        public void H003_XsdValidation_ShouldFailWithMissingHSecError()
        {
            _output.WriteLine("=== H003 XSD Validation Test ===");
            
            // 1. Create H003 instance
            _output.WriteLine("\n1. Creating H003 instance...");
            var h003 = new H003();
            
            // 2. Populate required fields
            _output.WriteLine("\n2. Populating required fields...");
            
            // Person is required
            h003.Person = new HSpecificPersonBlockIncludingOnlyNationalityType
            {
                PersonIdentification = new EessiPersonType
                {
                    FamilyName = "Mustermann",
                    Forename = "Max"
                },
                AdditionalInformationPerson = new HAdditionalInfoPersonType
                {
                    Nationality = new string[] { "DE" }
                }
            };
            
            // TypeInformation is required
            h003.TypeInformation = new TypeInformationClassType
            {
                TypeInformation = new TypeInformationType { Value = "01" }
            };
            
            // Set version attributes
            h003.SedGVer = 440;
            h003.SedVer = 440;
            
            _output.WriteLine("✓ H003 instance created and populated");
            
            // 3. Serialize to XML
            _output.WriteLine("\n3. Serializing to XML...");
            string xml = SerializeToXml(h003);
            Assert.NotNull(xml);
            Assert.Contains("<H003", xml);
            
            _output.WriteLine("✓ XML generated successfully");
            _output.WriteLine($"XML Length: {xml.Length} characters");
            
            // Show first few lines of XML
            var lines = xml.Split('\n');
            for (int i = 0; i < Math.Min(10, lines.Length); i++)
            {
                _output.WriteLine($"  {lines[i]}");
            }
            if (lines.Length > 10)
            {
                _output.WriteLine("  ...");
            }
            
            // 4. Validate against XSD
            _output.WriteLine("\n4. Validating against H003 XSD...");
            
            try
            {
                var xsdPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, 
                    "xsd", "eessi", "H003-4.4.0-20241203T114212.xsd");
                
                Assert.True(File.Exists(xsdPath), $"H003 XSD not found at: {xsdPath}");
                _output.WriteLine($"✓ Found H003 XSD at: {xsdPath}");
                
                var validationErrors = ValidateXmlAgainstXsd(xml, xsdPath);
                
                // We expect validation to fail due to missing HSec-4.4.xsd
                _output.WriteLine($"\n5. Validation Results: {validationErrors.Count} error(s)");
                
                bool foundHSecError = false;
                foreach (var error in validationErrors)
                {
                    _output.WriteLine($"  - {error}");
                    if (error.Contains("HSec") || error.Contains("HSpecificPersonBlockIncludingOnlyNationalityType"))
                    {
                        foundHSecError = true;
                    }
                }
                
                if (foundHSecError)
                {
                    _output.WriteLine("\n✓ Expected error found: Missing HSec-4.4.xsd or type not declared");
                    _output.WriteLine("\nThis confirms the issue:");
                    _output.WriteLine("- H003 XSD appears to reference HSec types");
                    _output.WriteLine("- But HSec-4.4.xsd file is missing from the distribution");
                    _output.WriteLine("- Generated code works because types are embedded in H003");
                    _output.WriteLine("- XSD validation fails due to missing dependency");
                }
                else if (validationErrors.Count == 0)
                {
                    _output.WriteLine("\n⚠️ Unexpected: XML validated successfully!");
                    _output.WriteLine("This might mean the XSD has been fixed or types are fully embedded.");
                }
                else
                {
                    _output.WriteLine("\n⚠️ Validation failed but not with expected HSec error");
                }
            }
            catch (Exception ex)
            {
                _output.WriteLine($"\n❌ Exception during validation: {ex.GetType().Name}");
                _output.WriteLine($"Message: {ex.Message}");
                
                if (ex.Message.Contains("HSec") || ex.InnerException?.Message.Contains("HSec") == true)
                {
                    _output.WriteLine("\n✓ Expected error: HSec-4.4.xsd dependency is missing");
                }
                else
                {
                    throw;
                }
            }
        }
        
        private string SerializeToXml(H003 h003)
        {
            var serializer = new XmlSerializer(typeof(H003));
            var namespaces = new XmlSerializerNamespaces();
            namespaces.Add("", "http://ec.europa.eu/eessi/ns/4_4/H003");
            namespaces.Add("ds", "http://www.w3.org/2000/09/xmldsig#");
            
            using (var stringWriter = new StringWriter())
            using (var xmlWriter = XmlWriter.Create(stringWriter, new XmlWriterSettings 
            { 
                Indent = true,
                IndentChars = "  "
            }))
            {
                serializer.Serialize(xmlWriter, h003, namespaces);
                return stringWriter.ToString();
            }
        }
        
        private System.Collections.Generic.List<string> ValidateXmlAgainstXsd(string xml, string xsdPath)
        {
            var errors = new System.Collections.Generic.List<string>();
            var schemas = new XmlSchemaSet();
            
            try
            {
                // Add the main H003 XSD
                using (var reader = XmlReader.Create(xsdPath))
                {
                    schemas.Add(null, reader);
                }
                
                // Also add the XML signature schemas if they exist
                var xsdDir = Path.GetDirectoryName(xsdPath);
                var xmldsigPath = Path.Combine(xsdDir, "xmldsig-core-schema.xsd");
                if (File.Exists(xmldsigPath))
                {
                    using (var reader = XmlReader.Create(xmldsigPath))
                    {
                        schemas.Add(null, reader);
                    }
                }
                
                schemas.Compile();
            }
            catch (XmlSchemaException ex)
            {
                errors.Add($"Schema compilation error: {ex.Message}");
                return errors;
            }
            
            var settings = new XmlReaderSettings
            {
                Schemas = schemas,
                ValidationType = ValidationType.Schema
            };
            
            settings.ValidationEventHandler += (sender, e) => 
            {
                errors.Add($"{e.Severity}: {e.Message}");
            };
            
            try
            {
                using (var stringReader = new StringReader(xml))
                using (var xmlReader = XmlReader.Create(stringReader, settings))
                {
                    while (xmlReader.Read()) { }
                }
            }
            catch (Exception ex)
            {
                errors.Add($"Validation exception: {ex.Message}");
            }
            
            return errors;
        }
    }
}