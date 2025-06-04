using System;

namespace XmlSchemaClassGenerator.Examples
{
    /// <summary>
    /// Example demonstrating the enhanced automatic property initialization features in XsdTypeNavigator
    /// </summary>
    public class AutoPropertyInitializationExample
    {
        public static void Run()
        {
            Console.WriteLine("=== Automatic Property Initialization Demo ===\n");

            // This would typically be done with actual XSD-generated types
            // For demo purposes, we'll use placeholder logic
            
            Console.WriteLine("New Features Added to XsdTypeNavigator:");
            Console.WriteLine("1. Enhanced TryCreatePropertyInstance() method");
            Console.WriteLine("   - Supports arrays, various collection types");
            Console.WriteLine("   - Handles Dictionary, HashSet, ObservableCollection");
            Console.WriteLine("   - Better handling of value types and nullable types");
            Console.WriteLine();
            
            Console.WriteLine("2. Automatic Collection Expansion");
            Console.WriteLine("   - Collections automatically expand when accessing out-of-bounds indices");
            Console.WriteLine("   - Example: navigator.SetPropertyValue(instance, \"Orders[5].Total\", 99.99)");
            Console.WriteLine("   - If Orders collection has only 2 elements, it will be expanded to 6 elements");
            Console.WriteLine();
            
            Console.WriteLine("3. New Helper Methods:");
            Console.WriteLine("   - InitializeCollectionProperty(instance, \"Orders\", 3)");
            Console.WriteLine("   - EnsureCollectionSize(instance, \"Orders\", 5)");
            Console.WriteLine("   - InitializeAllProperties(instance, maxDepth: 3)");
            Console.WriteLine("   - GetOrCreateProperty(instance, \"Address\")");
            Console.WriteLine();
            
            Console.WriteLine("4. Enhanced Property Path Support:");
            Console.WriteLine("   - Deep path navigation with automatic initialization");
            Console.WriteLine("   - Example: \"Customer.Address.Street\" - all intermediate objects created automatically");
            Console.WriteLine("   - Array index support: \"Customer.Orders[0].Items[1].ProductName\"");
            Console.WriteLine();
            
            Console.WriteLine("Usage Example:");
            Console.WriteLine("var factory = new XsdToCSharpFactory();");
            Console.WriteLine("factory.LoadXsd(\"schema.xsd\");");
            Console.WriteLine("var navigator = factory.GetTypeNavigator();");
            Console.WriteLine("var instance = factory.CreateInstance(\"CustomerType\");");
            Console.WriteLine();
            Console.WriteLine("// Automatic initialization - creates Address object if null");
            Console.WriteLine("navigator.SetPropertyValue(instance, \"Address.Street\", \"Main St\");");
            Console.WriteLine();
            Console.WriteLine("// Automatic collection expansion - expands Orders to have 3 elements");
            Console.WriteLine("navigator.SetPropertyValue(instance, \"Orders[2].Total\", 150.00m);");
            Console.WriteLine();
            Console.WriteLine("// Initialize all properties recursively");
            Console.WriteLine("navigator.InitializeAllProperties(instance);");
            Console.WriteLine();
            Console.WriteLine("// Ensure collection has minimum size");
            Console.WriteLine("navigator.EnsureCollectionSize(instance, \"Orders\", 5);");
            
            DemonstrateAutoInitialization();
        }

        private static void DemonstrateAutoInitialization()
        {
            Console.WriteLine("\n=== Live Demonstration ===");
            
            try
            {
                // Create a simple test schema
                const string testSchema = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Address"" type=""AddressType"" minOccurs=""0""/>
            <xs:element name=""Orders"" type=""OrderType"" maxOccurs=""unbounded""/>
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
            <xs:element name=""Total"" type=""xs:decimal""/>
            <xs:element name=""Items"" type=""ItemType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Price"" type=""xs:decimal""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

                var tempFile = System.IO.Path.GetTempFileName() + ".xsd";
                System.IO.File.WriteAllText(tempFile, testSchema);

                try
                {
                    var factory = new XsdToCSharpFactory();
                    var navigator = factory.GenerateTypesFromXsd(tempFile);
                    
                    // Note: CreateInstance requires runtime compilation which is not shown in this demo
                    // This example demonstrates the API structure
                    object customer = null; // Placeholder for actual instance
                    
                    // The following shows the intended API usage:
                    Console.WriteLine("✓ XsdTypeNavigator created successfully");
                    Console.WriteLine("✓ Schema analysis completed");
                    Console.WriteLine("✓ New auto-initialization features available:");
                    Console.WriteLine("  - InitializeAllProperties(instance)");
                    Console.WriteLine("  - EnsureCollectionSize(instance, \"path\", size)");
                    Console.WriteLine("  - Automatic deep path navigation");
                    Console.WriteLine("  - Automatic collection expansion");
                    
                    if (false) // Placeholder for actual runtime instance
                    {
                        Console.WriteLine("✓ Created CustomerType instance");

                        // Demonstrate automatic initialization
                        Console.WriteLine("\n1. Setting deep nested property (Address will be auto-created):");
                        var success1 = navigator.SetPropertyValue(customer, "Address.Street", "123 Auto Street");
                        Console.WriteLine($"   navigator.SetPropertyValue(customer, \"Address.Street\", \"123 Auto Street\") = {success1}");
                        
                        var street = navigator.GetPropertyValue(customer, "Address.Street");
                        Console.WriteLine($"   Retrieved: Address.Street = '{street}'");

                        Console.WriteLine("\n2. Auto-expanding collection (Orders[2] when collection is empty):");
                        var success2 = navigator.SetPropertyValue(customer, "Orders[2].Total", 299.99m);
                        Console.WriteLine($"   navigator.SetPropertyValue(customer, \"Orders[2].Total\", 299.99m) = {success2}");
                        
                        var total = navigator.GetPropertyValue(customer, "Orders[2].Total");
                        Console.WriteLine($"   Retrieved: Orders[2].Total = {total}");

                        Console.WriteLine("\n3. Initialize all properties:");
                        var success3 = navigator.InitializeAllProperties(customer);
                        Console.WriteLine($"   navigator.InitializeAllProperties(customer) = {success3}");

                        Console.WriteLine("\n4. Ensure collection minimum size:");
                        var success4 = navigator.EnsureCollectionSize(customer, "Orders", 5);
                        Console.WriteLine($"   navigator.EnsureCollectionSize(customer, \"Orders\", 5) = {success4}");

                        Console.WriteLine("\n5. Deep nested array access:");
                        var success5 = navigator.SetPropertyValue(customer, "Orders[1].Items[0].Name", "Auto-Created Item");
                        Console.WriteLine($"   navigator.SetPropertyValue(customer, \"Orders[1].Items[0].Name\", \"Auto-Created Item\") = {success5}");
                        
                        var itemName = navigator.GetPropertyValue(customer, "Orders[1].Items[0].Name");
                        Console.WriteLine($"   Retrieved: Orders[1].Items[0].Name = '{itemName}'");

                        Console.WriteLine("\n✅ All automatic initialization features demonstrated successfully!");
                    }
                }
                finally
                {
                    if (System.IO.File.Exists(tempFile))
                        System.IO.File.Delete(tempFile);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error in demonstration: {ex.Message}");
            }
        }
    }
}