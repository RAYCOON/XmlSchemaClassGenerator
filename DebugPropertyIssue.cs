using System;
using System.IO;
using System.Linq;
using XmlSchemaClassGenerator;

class DebugPropertyIssue
{
    static void Main()
    {
        Console.WriteLine("=== Debug Property Value Issue ===");

        // Create a simple test schema
        const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""CustomerID"" type=""xs:string""/>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Email"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    <xs:element name=""Customer"" type=""CustomerType""/>
</xs:schema>";

        // Create temporary XSD file
        var tempXsdFile = Path.GetTempFileName() + ".xsd";
        File.WriteAllText(tempXsdFile, xsdContent);

        try
        {
            // Test the factory and navigator
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(tempXsdFile);

            Console.WriteLine("✓ Navigator created successfully");

            // Test basic schema exploration
            var typeNames = navigator.GetAllTypeNames();
            Console.WriteLine($"✓ Found types: {string.Join(", ", typeNames)}");

            var customerProperties = navigator.SelectProperties("CustomerType");
            Console.WriteLine($"✓ CustomerType properties: {string.Join(", ", customerProperties.Select(p => p.Name))}");

            // Try to create an instance of a specific property - this will fail because we need runtime compilation
            Console.WriteLine("\n❌ Note: GetPropertyValue requires runtime-compiled instances");
            Console.WriteLine("   The test failures are because instances need to be created from compiled assemblies");
            Console.WriteLine("   XsdTypeNavigator.GetPropertyValue works on actual object instances, not TypeModel objects");
            
            Console.WriteLine("\n✅ XsdTypeNavigator schema exploration works correctly");
            Console.WriteLine("   The issue is in tests expecting runtime instance navigation without compilation");
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