using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using XmlSchemaClassGenerator;

/// <summary>
/// Demo für den gewünschten Workflow:
/// 1. XSD Schema → Assembly mit Types
/// 2. XML-Datei deserialisieren zu Type
/// 3. Properties aus Type mit Array-Index-Navigation lesen
/// </summary>
class XmlDeserializationDemo
{
    static void Main()
    {
        Console.WriteLine("=== XSD → XML Deserialization → Property Navigation Demo ===\n");

        try
        {
            // Step 1: XSD Schema definieren
            string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://demo.example.com""
           xmlns:tns=""http://demo.example.com"">
    
    <xs:element name=""PersonDocument"" type=""tns:PersonDocumentType""/>
    
    <xs:complexType name=""PersonDocumentType"">
        <xs:sequence>
            <xs:element name=""DocumentId"" type=""xs:string""/>
            <xs:element name=""Persons"" type=""tns:PersonType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""PersonId"" type=""xs:string""/>
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

            // Step 2: XML-Daten vorbereiten
            string xmlData = @"<?xml version=""1.0"" encoding=""utf-8""?>
<PersonDocument xmlns=""http://demo.example.com"">
  <DocumentId>DOC-123</DocumentId>
  <Persons>
    <PersonId>P001</PersonId>
    <Name>Max Mustermann</Name>
    <Age>30</Age>
    <Address>
      <Street>Hauptstraße 123</Street>
      <City>Berlin</City>
    </Address>
  </Persons>
  <Persons>
    <PersonId>P002</PersonId>
    <Name>Anna Schmidt</Name>
    <Age>25</Age>
    <Address>
      <Street>Münchener Straße 45</Street>
      <City>München</City>
    </Address>
  </Persons>
</PersonDocument>";

            // Step 3: Temporäre XSD-Datei erstellen
            string tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);
            Console.WriteLine($"✓ XSD-Datei erstellt: {Path.GetFileName(tempXsdFile)}");

            // Step 4: XSD → Assembly mit Navigator
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(tempXsdFile);
            Console.WriteLine("✓ XsdTypeNavigator aus XSD erstellt");

            // Step 5: Assembly generieren
            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "Demo" },
                { new NamespaceKey("http://demo.example.com"), "Demo" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            };

            var assembly = Compiler.GenerateFiles("PersonDemo", new[] { tempXsdFile }, generator);
            var personDocumentType = assembly.GetTypes().First(t => t.Name == "PersonDocumentType");
            Console.WriteLine($"✓ Assembly generiert, PersonDocumentType gefunden: {personDocumentType.Name}");

            // Step 6: XML zu Type deserialisieren
            var deserializedDocument = navigator.DeserializeFromXml(xmlData, personDocumentType);
            if (deserializedDocument == null)
            {
                Console.WriteLine("❌ XML Deserialisierung fehlgeschlagen");
                return;
            }
            Console.WriteLine("✓ XML erfolgreich zu PersonDocumentType deserialisiert");

            // Step 7: Properties mit Array-Index-Navigation lesen
            Console.WriteLine("\n📖 === PROPERTIES MIT ARRAY-INDEX-NAVIGATION LESEN ===");

            // Document-Level Property
            var documentId = navigator.GetPropertyValue(deserializedDocument, "DocumentId");
            Console.WriteLine($"✓ DocumentId: '{documentId}'");

            // Array-Properties: Persons[0] und Persons[1]
            var person1Id = navigator.GetPropertyValue(deserializedDocument, "Persons[0].PersonId");
            var person1Name = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Name");
            var person1Age = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Age");

            Console.WriteLine($"✓ Persons[0].PersonId: '{person1Id}'");
            Console.WriteLine($"✓ Persons[0].Name: '{person1Name}'");
            Console.WriteLine($"✓ Persons[0].Age: {person1Age}");

            // Verschachtelte Properties: Address in Person[0]
            var person1Street = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Address.Street");
            var person1City = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Address.City");

            Console.WriteLine($"✓ Persons[0].Address.Street: '{person1Street}'");
            Console.WriteLine($"✓ Persons[0].Address.City: '{person1City}'");

            // Zweite Person
            var person2Name = navigator.GetPropertyValue(deserializedDocument, "Persons[1].Name");
            var person2Age = navigator.GetPropertyValue(deserializedDocument, "Persons[1].Age");
            var person2City = navigator.GetPropertyValue(deserializedDocument, "Persons[1].Address.City");

            Console.WriteLine($"✓ Persons[1].Name: '{person2Name}'");
            Console.WriteLine($"✓ Persons[1].Age: {person2Age}");
            Console.WriteLine($"✓ Persons[1].Address.City: '{person2City}'");

            // Step 8: Workflow-Zusammenfassung
            Console.WriteLine("\n🎉 === VOLLSTÄNDIGER WORKFLOW ERFOLGREICH ===");
            Console.WriteLine("1. XSD Schema → XsdTypeNavigator ✅");
            Console.WriteLine("2. XML-String → Type deserialisiert ✅");
            Console.WriteLine("3. Properties mit Array-Index-Pfaden gelesen ✅");
            Console.WriteLine("\nUnter
            return;
            Console.WriteLine("\n🆕 === IHR GEWÜNSCHTER ANWENDUNGSFALL ===");
            Console.WriteLine("✅ XSD laden");
            Console.WriteLine("✅ Aus XSD Assembly mit Types erstellen");
            Console.WriteLine("✅ XML-Datei in den generierten Type deserialisieren");
            Console.WriteLine("✅ Properties aus dem Type mit navigator.GetPropertyValue() lesen");
            Console.WriteLine("✅ Array-Index-Navigation: \"Persons[0].Address.City\"");

            // Cleanup
            File.Delete(tempXsdFile);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Fehler: {ex.Message}");
            Console.WriteLine($"Details: {ex}");
        }
    }
}