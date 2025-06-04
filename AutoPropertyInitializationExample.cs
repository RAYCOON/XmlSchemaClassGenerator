using System;
using XmlSchemaClassGenerator;

namespace AutoPropertyInitializationExample
{
    /// <summary>
    /// Demonstrates the enhanced automatic property initialization features in XsdTypeNavigator
    /// </summary>
    class Program
    {
        static void Main(string[] args)
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
        }
    }
}