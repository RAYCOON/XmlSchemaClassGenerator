using System;
using System.Collections.Generic;
using System.IO;
using XmlSchemaClassGenerator;

/// <summary>
/// Beispiel für die erweiterte XsdTypeNavigator Funktionalität mit Array-Index-Unterstützung
/// Zeigt Property-Pfade wie "S071.Person[0].Name" für Lesen und Schreiben
/// </summary>
class ArrayIndexNavigationExample
{
    static void Main()
    {
        Console.WriteLine("=== XsdTypeNavigator Array-Index Navigation Beispiel ===\n");

        // 1. Erstelle Test-Schema mit Arrays
        string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://test.example.com""
           xmlns:tns=""http://test.example.com"">
    
    <xs:complexType name=""S071Type"">
        <xs:sequence>
            <xs:element name=""Person"" type=""tns:PersonType"" maxOccurs=""unbounded""/>
            <xs:element name=""Orders"" type=""tns:OrderType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
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
        </xs:sequence>
    </xs:complexType>
    
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

        // 2. Erstelle temporäre XSD-Datei
        string tempXsdFile = Path.GetTempFileName() + ".xsd";
        File.WriteAllText(tempXsdFile, xsdContent);

        try
        {
            // 3. Erstelle Navigator und generiere Assembly
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(tempXsdFile);

            Console.WriteLine("🔧 Schema geladen und Navigator erstellt");

            // Namespace-Mapping für Assembly-Generierung
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

            var assembly = Compiler.GenerateFiles("ArrayExample", new[] { tempXsdFile }, generator);
            var s071Type = assembly.GetTypes().First(t => t.Name == "S071Type");

            // 4. Erstelle S071-Instanz mit Datenstruktur
            var s071Instance = Activator.CreateInstance(s071Type);
            Console.WriteLine("📦 S071 Instanz erstellt");

            // Person-Collection befüllen
            var personCollectionProperty = s071Type.GetProperty("Person");
            var personCollection = personCollectionProperty.GetValue(s071Instance);
            
            // Erste Person hinzufügen
            var personType = assembly.GetTypes().First(t => t.Name == "PersonType");
            var person1 = Activator.CreateInstance(personType);
            
            // Person-Properties setzen (traditionell)
            var nameProperty = personType.GetProperty("Name");
            nameProperty.SetValue(person1, "Max Mustermann");
            
            var ageProperty = personType.GetProperty("Age");
            ageProperty.SetValue(person1, 30);

            // Address erstellen
            var addressType = assembly.GetTypes().First(t => t.Name == "AddressType");
            var address = Activator.CreateInstance(addressType);
            var streetProperty = addressType.GetProperty("Street");
            streetProperty.SetValue(address, "Hauptstraße 123");
            var cityProperty = addressType.GetProperty("City");
            cityProperty.SetValue(address, "Berlin");
            
            var addressProperty = personType.GetProperty("Address");
            addressProperty.SetValue(person1, address);

            // Person zur Collection hinzufügen
            var addMethod = personCollection.GetType().GetMethod("Add");
            addMethod.Invoke(personCollection, new[] { person1 });

            Console.WriteLine("👤 Person[0] traditionell erstellt und hinzugefügt");

            // === NEUE ARRAY-INDEX NAVIGATION ===
            Console.WriteLine("\n🆕 === NEUE ARRAY-INDEX NAVIGATION ===");

            // 5. Property-Werte mit Array-Index-Pfaden LESEN
            Console.WriteLine("\n📖 LESEN mit Array-Index-Pfaden:");
            
            var name = navigator.GetPropertyValue(s071Instance, "Person[0].Name");
            Console.WriteLine($"✓ Person[0].Name = '{name}'");

            var age = navigator.GetPropertyValue(s071Instance, "Person[0].Age");
            Console.WriteLine($"✓ Person[0].Age = {age}");

            var street = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");
            Console.WriteLine($"✓ Person[0].Address.Street = '{street}'");

            var city = navigator.GetPropertyValue(s071Instance, "Person[0].Address.City");
            Console.WriteLine($"✓ Person[0].Address.City = '{city}'");

            // 6. Property-Werte mit Array-Index-Pfaden SCHREIBEN
            Console.WriteLine("\n✏️ SCHREIBEN mit Array-Index-Pfaden:");

            bool success1 = navigator.SetPropertyValue(s071Instance, "Person[0].Name", "John Doe (via Array-Index)");
            Console.WriteLine($"✓ SetPropertyValue('Person[0].Name', 'John Doe (via Array-Index)') = {success1}");

            bool success2 = navigator.SetPropertyValue(s071Instance, "Person[0].Age", 35);
            Console.WriteLine($"✓ SetPropertyValue('Person[0].Age', 35) = {success2}");

            bool success3 = navigator.SetPropertyValue(s071Instance, "Person[0].Address.Street", "Navigator Straße 456");
            Console.WriteLine($"✓ SetPropertyValue('Person[0].Address.Street', 'Navigator Straße 456') = {success3}");

            bool success4 = navigator.SetPropertyValue(s071Instance, "Person[0].Address.City", "München");
            Console.WriteLine($"✓ SetPropertyValue('Person[0].Address.City', 'München') = {success4}");

            // 7. Änderungen verifizieren
            Console.WriteLine("\n🔍 VERIFIZIERUNG - Änderungen lesen:");
            
            var updatedName = navigator.GetPropertyValue(s071Instance, "Person[0].Name");
            Console.WriteLine($"✓ Person[0].Name = '{updatedName}'");

            var updatedAge = navigator.GetPropertyValue(s071Instance, "Person[0].Age");
            Console.WriteLine($"✓ Person[0].Age = {updatedAge}");

            var updatedStreet = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");
            Console.WriteLine($"✓ Person[0].Address.Street = '{updatedStreet}'");

            var updatedCity = navigator.GetPropertyValue(s071Instance, "Person[0].Address.City");
            Console.WriteLine($"✓ Person[0].Address.City = '{updatedCity}'");

            // 8. Out-of-bounds Test
            Console.WriteLine("\n❌ OUT-OF-BOUNDS Tests:");
            
            var outOfBounds = navigator.GetPropertyValue(s071Instance, "Person[999].Name");
            Console.WriteLine($"✓ Person[999].Name (out of bounds) = {outOfBounds ?? "null"}");

            var setOutOfBounds = navigator.SetPropertyValue(s071Instance, "Person[999].Name", "Should Fail");
            Console.WriteLine($"✓ SetPropertyValue('Person[999].Name', 'Should Fail') = {setOutOfBounds}");

            // 9. Syntax-Vergleich
            Console.WriteLine("\n📋 === SYNTAX-VERGLEICH ===");
            Console.WriteLine("TRADITIONELL:");
            Console.WriteLine("  var personCollection = s071Instance.Person;");
            Console.WriteLine("  var person = personCollection[0];");
            Console.WriteLine("  var name = person.Name;");
            Console.WriteLine("  person.Name = \"New Name\";");
            Console.WriteLine("");
            Console.WriteLine("MIT ARRAY-INDEX NAVIGATION:");
            Console.WriteLine("  var name = navigator.GetPropertyValue(s071Instance, \"Person[0].Name\");");
            Console.WriteLine("  navigator.SetPropertyValue(s071Instance, \"Person[0].Name\", \"New Name\");");
            Console.WriteLine("");
            Console.WriteLine("UNTERSTÜTZTE SYNTAX:");
            Console.WriteLine("  ✓ S071.Person[0].Name");
            Console.WriteLine("  ✓ S071.Person[0].Address.Street");
            Console.WriteLine("  ✓ S071.Orders[2].Items[1].ProductName");
            Console.WriteLine("  ✓ Customer.Orders[0].Items[5].Quantity");

            Console.WriteLine("\n🎉 === ARRAY-INDEX NAVIGATION ERFOLGREICH DEMONSTRIERT ===");
        }
        finally
        {
            // Cleanup
            if (File.Exists(tempXsdFile))
            {
                File.Delete(tempXsdFile);
            }
        }
    }
}