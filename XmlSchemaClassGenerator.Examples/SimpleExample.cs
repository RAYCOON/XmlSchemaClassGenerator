using System;
using System.IO;
using System.Linq;

namespace XmlSchemaClassGenerator.Examples
{
    /// <summary>
    /// Simple example demonstrating basic XsdToCSharpFactory functionality
    /// </summary>
    public class SimpleExample
    {
        public static void Run()
        {
            Console.WriteLine("=== Simple XsdToCSharpFactory Example ===\n");

            // Create a simple XSD schema
            const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
            <xs:element name=""Email"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:element name=""Person"" type=""PersonType""/>
</xs:schema>";

            // Create temporary XSD file
            var tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);

            try
            {
                // Create factory and generate navigator
                var factory = new XsdToCSharpFactory();
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);

                Console.WriteLine("✓ Schema loaded and TypeNavigator created");

                // Explore the schema
                var typeNames = navigator.GetAllTypeNames();
                Console.WriteLine($"✓ Found types: {string.Join(", ", typeNames)}");

                // Get type properties
                var personProperties = navigator.SelectProperties("PersonType");
                Console.WriteLine($"✓ PersonType properties:");
                foreach (var prop in personProperties)
                {
                    Console.WriteLine($"  - {prop.Name}: {prop.Type?.Name} (Required: {prop.IsRequired})");
                }

                // Get type metadata
                var metadata = navigator.GetTypeMetadata("PersonType");
                if (metadata != null)
                {
                    Console.WriteLine($"✓ PersonType metadata:");
                    Console.WriteLine($"  - Name: {metadata.Name}");
                    Console.WriteLine($"  - Namespace: {metadata.Namespace ?? "Default"}");
                    Console.WriteLine($"  - XML Schema Name: {metadata.XmlSchemaName}");
                    Console.WriteLine($"  - Is Abstract: {metadata.IsAbstract}");
                }

                // Search for properties
                var nameProperties = navigator.SelectProperties("*", "*Name*");
                Console.WriteLine($"✓ Properties containing 'Name': {nameProperties.Count()}");
                foreach (var prop in nameProperties)
                {
                    Console.WriteLine($"  - {prop.Type?.Name}.{prop.Name}");
                }

                Console.WriteLine("\n✅ Simple example completed successfully!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error: {ex.Message}");
            }
            finally
            {
                if (File.Exists(tempXsdFile))
                    File.Delete(tempXsdFile);
            }
        }
    }
}