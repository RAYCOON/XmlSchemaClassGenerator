using System;
using System.IO;
using XmlSchemaClassGenerator;

namespace NavigationExample
{
    /// <summary>
    /// Kleines Beispiel für XPath-ähnliche Schema-Navigation mit XsdTypeNavigator
    /// </summary>
    class XPathNavigationExample
    {
        static void Main()
        {
            // 1. Erstelle ein einfaches XSD Schema
            string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://example.com/order""
           xmlns:tns=""http://example.com/order"">
    
    <xs:element name=""Order"" type=""tns:OrderType""/>
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""Customer"" type=""tns:CustomerType""/>
            <xs:element name=""Items"" type=""tns:ItemListType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Address"" type=""tns:AddressType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""PostalCode"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemListType"">
        <xs:sequence>
            <xs:element name=""Item"" type=""tns:ItemType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemType"">
        <xs:sequence>
            <xs:element name=""ProductName"" type=""xs:string""/>
            <xs:element name=""Quantity"" type=""xs:int""/>
            <xs:element name=""Price"" type=""xs:decimal""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            // 2. Schreibe XSD in temporäre Datei
            string tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);

            try
            {
                // 3. Erstelle XsdTypeNavigator
                var factory = new XsdToCSharpFactory();
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);

                Console.WriteLine("=== XPath-ähnliche Schema-Navigation Beispiel ===\n");

                // 4. Grundlegende Type-Navigation
                Console.WriteLine("📁 Alle verfügbaren Typen:");
                foreach (var typeName in navigator.GetAllTypeNames())
                {
                    Console.WriteLine($"   - {typeName}");
                }

                Console.WriteLine("\n🔍 Direkter Type-Zugriff:");
                var orderType = navigator.SelectType("OrderType");
                Console.WriteLine($"   navigator.SelectType(\"OrderType\") → {orderType?.Name}");

                var customerType = navigator.SelectType("CustomerType");
                Console.WriteLine($"   navigator.SelectType(\"CustomerType\") → {customerType?.Name}");

                // 5. XPath-ähnliche Property-Navigation
                Console.WriteLine("\n🧭 XPath-ähnliche Property-Navigation:");
                
                // Einfache Property-Pfade
                var orderNumber = navigator.SelectProperty("OrderType/OrderNumber");
                Console.WriteLine($"   navigator.SelectProperty(\"OrderType/OrderNumber\") → {orderNumber?.Name}");

                var customerName = navigator.SelectProperty("CustomerType/Name");
                Console.WriteLine($"   navigator.SelectProperty(\"CustomerType/Name\") → {customerName?.Name}");

                // Verschachtelte Pfade (wie XPath)
                var street = navigator.SelectProperty("AddressType/Street");
                Console.WriteLine($"   navigator.SelectProperty(\"AddressType/Street\") → {street?.Name}");

                var city = navigator.SelectProperty("AddressType/City");
                Console.WriteLine($"   navigator.SelectProperty(\"AddressType/City\") → {city?.Name}");

                // 6. Wildcard-Suche (wie XPath //*[@name])
                Console.WriteLine("\n🔎 Wildcard-Pattern-Suche (XPath-ähnlich):");
                
                // Alle Properties mit "Name" im Namen
                var allNameProperties = navigator.SelectProperties("*", "*Name*");
                Console.WriteLine($"   navigator.SelectProperties(\"*\", \"*Name*\") → Gefunden {allNameProperties.Count()} Properties:");
                foreach (var prop in allNameProperties)
                {
                    Console.WriteLine($"      - {prop.OwningType.Name}.{prop.Name}");
                }

                // Alle Properties in Customer-Types
                var customerProperties = navigator.SelectProperties("Customer*", "*");
                Console.WriteLine($"\n   navigator.SelectProperties(\"Customer*\", \"*\") → Gefunden {customerProperties.Count()} Properties:");
                foreach (var prop in customerProperties)
                {
                    Console.WriteLine($"      - {prop.OwningType.Name}.{prop.Name} : {prop.Type.Name}");
                }

                // 7. Virtuelle Instanz-Navigation und Manipulation
                Console.WriteLine("\n🏗️ Virtuelle Instanz-Navigation:");
                var orderInstance = navigator.CreateInstance("OrderType");
                
                // XPath-ähnliche Property-Setzung
                orderInstance.SetProperty("OrderNumber", "ORD-12345");
                Console.WriteLine($"   orderInstance.SetProperty(\"OrderNumber\", \"ORD-12345\")");
                
                var retrievedOrderNumber = orderInstance.GetProperty("OrderNumber");
                Console.WriteLine($"   orderInstance.GetProperty(\"OrderNumber\") → \"{retrievedOrderNumber}\"");

                // Customer-Instanz erstellen und manipulieren
                var customerInstance = navigator.CreateInstance("CustomerType");
                customerInstance.SetProperty("Name", "Max Mustermann");
                customerInstance.SetProperty("Email", "max@example.com");
                
                Console.WriteLine($"   customerInstance.SetProperty(\"Name\", \"Max Mustermann\")");
                Console.WriteLine($"   customerInstance.GetProperty(\"Name\") → \"{customerInstance.GetProperty("Name")}\"");

                // 8. Validierung (XSD-Constraint-basiert)
                Console.WriteLine("\n✅ XSD-Constraint-Validierung:");
                var validation = customerInstance.Validate();
                Console.WriteLine($"   customerInstance.Validate() → IsValid: {validation.IsValid}");
                if (!validation.IsValid)
                {
                    foreach (var error in validation.Errors)
                    {
                        Console.WriteLine($"      ❌ {error}");
                    }
                }

                Console.WriteLine("\n🎯 Navigation-Zusammenfassung:");
                Console.WriteLine("   ✓ Direct Type Access:     navigator.SelectType(\"TypeName\")");
                Console.WriteLine("   ✓ XPath-like Properties:  navigator.SelectProperty(\"Type/Property\")");
                Console.WriteLine("   ✓ Wildcard Search:        navigator.SelectProperties(\"Type*\", \"*Property*\")");
                Console.WriteLine("   ✓ Virtual Instances:      navigator.CreateInstance(\"TypeName\")");
                Console.WriteLine("   ✓ Schema Validation:      instance.Validate()");
                Console.WriteLine("   ✓ Type Hierarchies:       navigator.GetTypeHierarchy(\"TypeName\")");
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
}