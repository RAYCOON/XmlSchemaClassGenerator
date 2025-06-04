using System;
using XmlSchemaClassGenerator;

// DEMO: Neue XsdToCSharpFactory API mit automatischer Root-Element-Erkennung

public class FactoryDemoExample
{
    public static void Main()
    {
        // 1. Factory konfigurieren
        var configuration = new GeneratorConfiguration
        {
            GenerateNullables = true,
            NamingScheme = NamingScheme.PascalCase,
            DataAnnotationMode = DataAnnotationMode.All
        };

        // 2. Factory erstellen und XSD verarbeiten
        var factory = new XsdToCSharpFactory(configuration);
        var navigator = factory.GenerateTypesFromXsd("path/to/schema.xsd");

        // 3. Root-Element automatisch erkennen (KEINE manuellen Type-Namen!)
        var rootTypeName = factory.GetRootElementTypeName();  // z.B. "S071"
        var rootInstance = factory.CreateRootInstance();     // Automatisch S071-Instanz!

        Console.WriteLine($"✅ Root-Element automatisch erkannt: {rootTypeName}");

        // 4. Properties mit XPath-Navigation setzen
        navigator.SetPropertyValue(rootInstance, "Person.Name", "Max Mustermann");
        navigator.SetPropertyValue(rootInstance, "Address.Street", "Hauptstraße 123");

        // 5. XML generieren
        var xml = navigator.SerializeToXml(rootInstance);
        Console.WriteLine($"Generated XML: {xml}");

        // ALTE API (umständlich):
        // var assembly = Compiler.GenerateFiles("name", files, generator);
        // var type = assembly.GetTypes().First(t => t.Name == "S071");  // Manual!
        // var instance = Activator.CreateInstance(type);               // Manual!

        // NEUE API (automatisch):
        // factory.CreateRootInstance();  // Automatisch das richtige Root-Element!
    }
}