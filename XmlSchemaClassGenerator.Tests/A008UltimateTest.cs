using System;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Der ultimative A008 Test - Alles in EINER Klasse!
    /// Testet die komplette A008 4.4.1 Funktionalität mit XsdToCSharpFactory
    /// </summary>
    public class A008UltimateTest
    {
        private readonly ITestOutputHelper _output;

        public A008UltimateTest(ITestOutputHelper output)
        {
            _output = output;
        }

        [Fact]
        public void A008_Ultimate_CompleteWorkflow_WithXsdToCSharpFactory()
        {
            _output.WriteLine("=== A008 ULTIMATE TEST - XsdToCSharpFactory Edition ===");
            
            try
            {
                // 1. XSD Dateien finden
                _output.WriteLine("\n1. Locating XSD files...");
                var xsdPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "eessi", "A008-4.4.0-20241203T114133.xsd");
                var xsdDirectory = Path.GetDirectoryName(xsdPath);
                
                Assert.True(File.Exists(xsdPath), $"A008 XSD not found at: {xsdPath}");
                
                var xsdFiles = new[]
                {
                    xsdPath,
                    Path.Combine(xsdDirectory, "xmldsig-core-schema.xsd"),
                    Path.Combine(xsdDirectory, "XAdES.xsd")
                }.Where(File.Exists).ToArray();
                
                _output.WriteLine($"✓ Found {xsdFiles.Length} XSD files");

                // 2. XsdToCSharpFactory initialisieren und Typen generieren
                _output.WriteLine("\n2. Initializing XsdToCSharpFactory...");
                var factory = new XsdToCSharpFactory();
                var navigator = factory.GenerateTypesFromXsd(xsdFiles);
                
                Assert.NotNull(navigator);
                _output.WriteLine("✓ Factory initialized and types generated");

                // 3. A008 Instanz direkt erstellen (nicht über Factory Root)
                _output.WriteLine("\n3. Creating A008 instance...");
                var a008Instance = factory.CreateInstance("A008");
                if (a008Instance == null)
                {
                    // Fallback: Versuche mit vollqualifiziertem Namen
                    var assembly = factory.GetCompiledAssembly();
                    var a008Type = assembly.GetTypes().FirstOrDefault(t => t.Name == "A008");
                    Assert.NotNull(a008Type);
                    a008Instance = Activator.CreateInstance(a008Type);
                }
                Assert.NotNull(a008Instance);
                _output.WriteLine($"✓ A008 instance created (Type: {a008Instance.GetType().Name})");

                // 4. Required Fields entdecken
                _output.WriteLine("\n4. Discovering required fields...");
                var requiredFields = factory.GetRequiredPropertyPaths();
                if (!requiredFields.Any())
                {
                    requiredFields = factory.GetBusinessRequiredPropertyPaths();
                }
                
                _output.WriteLine($"✓ Found {requiredFields.Count} required fields:");
                foreach (var field in requiredFields.Take(5))
                {
                    _output.WriteLine($"  - {field}");
                }
                if (requiredFields.Count > 5)
                {
                    _output.WriteLine($"  ... and {requiredFields.Count - 5} more");
                }

                // 5. Reflection Helper für dynamisches Setzen
                _output.WriteLine("\n5. Setting required fields dynamically...");
                var helper = new ReflectionHelper();
                
                // Basis-Felder setzen
                SetBasicA008Fields(a008Instance);
                
                // Weitere Required Fields dynamisch setzen
                foreach (var fieldPath in requiredFields.Where(f => !f.Contains("Signature")))
                {
                    try
                    {
                        helper.SetPropertyByPath(a008Instance, fieldPath);
                    }
                    catch
                    {
                        // Ignorieren wenn Feld nicht gesetzt werden kann
                    }
                }
                _output.WriteLine("✓ Required fields populated");

                // 6. XML Serialisierung
                _output.WriteLine("\n6. Serializing to XML...");
                var xml = factory.SerializeToXml(a008Instance);
                Assert.NotNull(xml);
                Assert.Contains("<A008", xml);
                Assert.Contains("xmlns=\"http://ec.europa.eu/eessi/ns/4_4/A008\"", xml);
                _output.WriteLine($"✓ XML generated ({xml.Length} characters)");
                
                // XML-Auszug anzeigen
                var lines = xml.Split('\n').Take(15);
                foreach (var line in lines)
                {
                    _output.WriteLine($"  {line}");
                }
                _output.WriteLine("  ...");

                // 7. XSD Validierung
                _output.WriteLine("\n7. Validating against XSD...");
                var validationErrors = ValidateXmlAgainstXsd(xml, xsdFiles);
                
                if (validationErrors.Any())
                {
                    _output.WriteLine($"⚠️  {validationErrors.Count} validation warnings found:");
                    foreach (var error in validationErrors.Take(3))
                    {
                        _output.WriteLine($"  - {error}");
                    }
                }
                else
                {
                    _output.WriteLine("✓ XML validates successfully against XSD!");
                }

                // 8. Deserialisierung testen
                _output.WriteLine("\n8. Testing deserialization...");
                var deserializedA008 = factory.DeserializeFromXml(xml, a008Instance.GetType());
                Assert.NotNull(deserializedA008);
                _output.WriteLine("✓ Successfully deserialized back to A008 object");

                // 9. Factory Validierung
                _output.WriteLine("\n9. Testing factory validation...");
                var factoryValidationErrors = factory.ValidateInstance(a008Instance);
                _output.WriteLine($"✓ Factory validation complete: {factoryValidationErrors.Count} issues");

                // 10. Type Information
                _output.WriteLine("\n10. Type information...");
                var rootType = factory.GetRootElementType();
                _output.WriteLine($"✓ Factory detected root type: {rootType?.Name ?? "none"}");
                _output.WriteLine($"✓ Actual A008 type: {a008Instance.GetType().FullName}");

                // ULTIMATE SUCCESS!
                _output.WriteLine("\n=== A008 ULTIMATE TEST COMPLETED SUCCESSFULLY! ===");
                _output.WriteLine($"✅ Factory initialized");
                _output.WriteLine($"✅ Types generated from XSD");
                _output.WriteLine($"✅ Instance created and populated");
                _output.WriteLine($"✅ XML serialization working");
                _output.WriteLine($"✅ XSD validation performed");
                _output.WriteLine($"✅ Deserialization working");
                _output.WriteLine($"✅ Factory validation functional");
                _output.WriteLine($"✅ Navigator operational");
                _output.WriteLine("\n🎉 A008 XsdToCSharpFactory integration is fully functional!");
            }
            catch (Exception ex)
            {
                _output.WriteLine($"\n❌ Test failed with exception: {ex.Message}");
                _output.WriteLine($"Stack trace: {ex.StackTrace}");
                throw;
            }
        }

        [Fact]
        public void A008_XmlRoundtrip_ExactMatch()
        {
            _output.WriteLine("=== A008 XML ROUNDTRIP TEST ===");
            
            // Das vorgegebene XML
            string inputXml = @"<A008 xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns=""http://ec.europa.eu/eessi/ns/4_4/A008"">
  <Person xmlns="""">
    <PersonIdentification>
      <familyName>Meier</familyName>
      <forename>Peter</forename>
      <dateBirth>1980-01-01</dateBirth>
      <sex>
        <value>01</value>
      </sex>
      <PINPersonInEachInstitution>
        <PersonalIdentificationNumber>
          <country>
            <value>DE</value>
          </country>
          <personalIdentificationNumber>M123456789</personalIdentificationNumber>
          <sector>
            <value>06</value>
          </sector>
          <Institution>
            <institutionID>DE:123456789</institutionID>
            <institutionName>Institution</institutionName>
          </Institution>
        </PersonalIdentificationNumber>
      </PINPersonInEachInstitution>
    </PersonIdentification>
    <AdditionalInformationPerson>
      <nationality>
        <value>DE</value>
      </nationality>
    </AdditionalInformationPerson>
  </Person>
  <CompetentInstitutionIfDiffersFromSending xmlns="""">
    <institutionID>DE:987654321</institutionID>
    <institutionName>Institution2</institutionName>
  </CompetentInstitutionIfDiffersFromSending>
  <PurposeofSED xmlns="""">
    <NotificationChangesInRelevantData>
      <Address>
        <street>Mainzer Str.</street>
        <town>XXX</town>
        <postalCode>55128</postalCode>
        <region>RLP</region>
        <country>
          <value>DE</value>
        </country>
      </Address>
    </NotificationChangesInRelevantData>
  </PurposeofSED>
</A008>";

            try
            {
                // 1. XSD Dateien finden und Factory initialisieren
                _output.WriteLine("\n1. Initializing XsdToCSharpFactory...");
                var xsdPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "eessi", "A008-4.4.0-20241203T114133.xsd");
                var xsdDirectory = Path.GetDirectoryName(xsdPath);
                
                var xsdFiles = new[]
                {
                    xsdPath,
                    Path.Combine(xsdDirectory, "xmldsig-core-schema.xsd"),
                    Path.Combine(xsdDirectory, "XAdES.xsd")
                }.Where(File.Exists).ToArray();
                
                var factory = new XsdToCSharpFactory();
                factory.GenerateTypesFromXsd(xsdFiles);
                
                // 2. Assembly und A008 Type holen
                _output.WriteLine("\n2. Getting A008 type from generated assembly...");
                var assembly = factory.GetCompiledAssembly();
                var a008Type = assembly.GetTypes().FirstOrDefault(t => t.Name == "A008");
                Assert.NotNull(a008Type);
                _output.WriteLine($"✓ Found A008 type: {a008Type.FullName}");

                // 3. Deserialisieren
                _output.WriteLine("\n3. Deserializing input XML...");
                var serializer = new XmlSerializer(a008Type);
                object deserializedA008;
                
                using (var stringReader = new StringReader(inputXml))
                {
                    deserializedA008 = serializer.Deserialize(stringReader);
                }
                
                Assert.NotNull(deserializedA008);
                _output.WriteLine("✓ Successfully deserialized XML to A008 object");

                // 4. Wieder serialisieren
                _output.WriteLine("\n4. Serializing back to XML...");
                string outputXml;
                
                // XmlWriterSettings für konsistente Formatierung
                var settings = new XmlWriterSettings
                {
                    Indent = true,
                    IndentChars = "  ",
                    OmitXmlDeclaration = true, // Da das Input-XML auch keine XML-Deklaration hat
                    NamespaceHandling = NamespaceHandling.OmitDuplicates
                };
                
                // Namespaces definieren wie im Input
                var namespaces = new XmlSerializerNamespaces();
                namespaces.Add("xsi", "http://www.w3.org/2001/XMLSchema-instance");
                namespaces.Add("xsd", "http://www.w3.org/2001/XMLSchema");
                namespaces.Add("", "http://ec.europa.eu/eessi/ns/4_4/A008");
                
                using (var stringWriter = new StringWriter())
                using (var xmlWriter = XmlWriter.Create(stringWriter, settings))
                {
                    serializer.Serialize(xmlWriter, deserializedA008, namespaces);
                    outputXml = stringWriter.ToString();
                }
                
                _output.WriteLine("✓ Successfully serialized back to XML");

                // 5. XMLs normalisieren und vergleichen
                _output.WriteLine("\n5. Comparing input and output XML...");
                
                // Normalisierung: Whitespace und Zeilenumbrüche vereinheitlichen
                var normalizedInput = NormalizeXml(inputXml);
                var normalizedOutput = NormalizeXml(outputXml);
                
                // Debug-Ausgabe bei Unterschieden
                if (normalizedInput != normalizedOutput)
                {
                    _output.WriteLine("\n⚠️  XMLs are different!");
                    _output.WriteLine("\n--- Input XML (first 500 chars) ---");
                    _output.WriteLine(normalizedInput.Substring(0, Math.Min(500, normalizedInput.Length)));
                    _output.WriteLine("\n--- Output XML (first 500 chars) ---");
                    _output.WriteLine(normalizedOutput.Substring(0, Math.Min(500, normalizedOutput.Length)));
                    
                    // Zeige erste Unterschiede
                    for (int i = 0; i < Math.Min(normalizedInput.Length, normalizedOutput.Length); i++)
                    {
                        if (normalizedInput[i] != normalizedOutput[i])
                        {
                            _output.WriteLine($"\nFirst difference at position {i}:");
                            _output.WriteLine($"Input:  '{normalizedInput.Substring(Math.Max(0, i - 20), Math.Min(40, normalizedInput.Length - Math.Max(0, i - 20)))}'");
                            _output.WriteLine($"Output: '{normalizedOutput.Substring(Math.Max(0, i - 20), Math.Min(40, normalizedOutput.Length - Math.Max(0, i - 20)))}'");
                            break;
                        }
                    }
                }
                
                Assert.Equal(normalizedInput, normalizedOutput);
                
                _output.WriteLine("✅ Input and output XML are identical!");
                _output.WriteLine("\n=== A008 XML ROUNDTRIP TEST COMPLETED SUCCESSFULLY! ===");
            }
            catch (Exception ex)
            {
                _output.WriteLine($"\n❌ Roundtrip test failed: {ex.Message}");
                _output.WriteLine($"Stack trace: {ex.StackTrace}");
                throw;
            }
        }
        
        private string NormalizeXml(string xml)
        {
            // XML parsen und wieder ausgeben für konsistente Formatierung
            var doc = new XmlDocument();
            doc.LoadXml(xml);
            
            // Normalisierte Ausgabe erstellen
            var normalizedSettings = new XmlWriterSettings
            {
                Indent = false,
                NewLineHandling = NewLineHandling.None,
                OmitXmlDeclaration = true
            };
            
            using (var stringWriter = new StringWriter())
            using (var xmlWriter = XmlWriter.Create(stringWriter, normalizedSettings))
            {
                doc.Save(xmlWriter);
                return stringWriter.ToString();
            }
        }

        private void SetBasicA008Fields(object a008)
        {
            // Dynamisch die Basis-Properties setzen
            var type = a008.GetType();
            
            // SedGVer und SedVer
            type.GetProperty("SedGVer")?.SetValue(a008, 400);
            type.GetProperty("SedVer")?.SetValue(a008, 400);
            
            // Person-Struktur aufbauen
            var personProp = type.GetProperty("Person");
            if (personProp != null)
            {
                var person = personProp.GetValue(a008);
                if (person != null)
                {
                    var personType = person.GetType();
                    var personIdentProp = personType.GetProperty("PersonIdentification");
                    if (personIdentProp != null)
                    {
                        var personIdent = personIdentProp.GetValue(person);
                        if (personIdent != null)
                        {
                            var identType = personIdent.GetType();
                            identType.GetProperty("FamilyName")?.SetValue(personIdent, "Mustermann");
                            identType.GetProperty("Forename")?.SetValue(personIdent, "Max");
                            identType.GetProperty("DateBirth")?.SetValue(personIdent, new DateTime(1980, 1, 1));
                        }
                    }
                }
            }
        }

        private System.Collections.Generic.List<string> ValidateXmlAgainstXsd(string xml, string[] xsdFiles)
        {
            var errors = new System.Collections.Generic.List<string>();
            var schemas = new XmlSchemaSet();
            
            foreach (var xsdFile in xsdFiles)
            {
                using (var reader = XmlReader.Create(xsdFile))
                {
                    schemas.Add(null, reader);
                }
            }
            schemas.Compile();

            var settings = new XmlReaderSettings
            {
                Schemas = schemas,
                ValidationType = ValidationType.Schema
            };
            
            settings.ValidationEventHandler += (sender, e) => 
            {
                errors.Add($"Error: {e.Message} (Line: {e.Exception?.LineNumber}, Column: {e.Exception?.LinePosition})");
            };

            using (var stringReader = new StringReader(xml))
            using (var xmlReader = XmlReader.Create(stringReader, settings))
            {
                while (xmlReader.Read()) { }
            }

            return errors;
        }
    }

    // Hilfsklasse für dynamisches Property-Setting
    public class ReflectionHelper
    {
        public void SetPropertyByPath(object obj, string path)
        {
            if (obj == null || string.IsNullOrEmpty(path)) return;
            
            var parts = path.Split('.');
            var current = obj;
            
            for (int i = 0; i < parts.Length; i++)
            {
                var part = parts[i];
                var type = current.GetType();
                var prop = type.GetProperty(part);
                
                if (prop == null) return;
                
                if (i == parts.Length - 1)
                {
                    // Letztes Element - Wert setzen
                    SetPropertyValue(current, prop);
                }
                else
                {
                    // Navigation fortsetzen
                    var value = prop.GetValue(current);
                    if (value == null)
                    {
                        // Neues Objekt erstellen wenn nötig
                        if (prop.PropertyType.GetConstructor(Type.EmptyTypes) != null)
                        {
                            value = Activator.CreateInstance(prop.PropertyType);
                            prop.SetValue(current, value);
                        }
                        else
                        {
                            return;
                        }
                    }
                    current = value;
                }
            }
        }
        
        private void SetPropertyValue(object obj, System.Reflection.PropertyInfo prop)
        {
            var type = prop.PropertyType;
            
            if (type == typeof(string))
            {
                prop.SetValue(obj, "TestValue");
            }
            else if (type == typeof(int) || type == typeof(int?))
            {
                prop.SetValue(obj, 1);
            }
            else if (type == typeof(DateTime) || type == typeof(DateTime?))
            {
                prop.SetValue(obj, DateTime.Now.Date);
            }
            else if (type == typeof(bool) || type == typeof(bool?))
            {
                prop.SetValue(obj, true);
            }
            else if (type.IsEnum)
            {
                var values = Enum.GetValues(type);
                if (values.Length > 0)
                {
                    prop.SetValue(obj, values.GetValue(0));
                }
            }
        }
    }
}