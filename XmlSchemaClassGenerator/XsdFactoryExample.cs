using System;
using System.IO;
using System.Linq;

namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Beispiel für die Verwendung der neuen XsdToCSharpFactory mit XsdTypeNavigator
    /// </summary>
    public class XsdFactoryExample
    {
        public static void Main()
        {
            // Beispiel 1: Einfache Verwendung mit TypeNavigator
            SimpleExample();
            
            // Beispiel 2: Verwendung mit angepasster Konfiguration
            AdvancedExample();
            
            // Beispiel 3: XPath-ähnliche Navigation
            NavigationExample();
        }

        private static void SimpleExample()
        {
            Console.WriteLine("=== Einfaches Beispiel mit XsdTypeNavigator ===");
            
            // Factory erstellen
            var factory = new XsdToCSharpFactory();
            
            // XSD-Schema definieren
            const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";
            
            // Temporäre XSD-Datei erstellen
            var tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);
            
            try
            {
                // TypeNavigator aus XSD generieren
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);
                
                // Alle verfügbaren Typen anzeigen
                var typeNames = navigator.GetAllTypeNames();
                Console.WriteLine($"Gefundene Typen: {string.Join(", ", typeNames)}");
                
                // Typ auswählen und Properties anzeigen
                var personType = navigator.SelectType("PersonType");
                if (personType != null)
                {
                    var properties = navigator.SelectProperties("PersonType");
                    Console.WriteLine($"PersonType Properties: {string.Join(", ", properties.Select(p => p.Name))}");
                }
            }
            finally
            {
                // Temporäre Datei löschen
                if (File.Exists(tempXsdFile))
                    File.Delete(tempXsdFile);
            }
        }

        private static void AdvancedExample()
        {
            Console.WriteLine("\n=== Erweiterte Konfiguration ===");
            
            // Angepasste Konfiguration
            var config = new GeneratorConfiguration
            {
                GenerateNullables = true,
                NamespacePrefix = "Generated",
                DataAnnotationMode = DataAnnotationMode.All
            };
            
            var factory = new XsdToCSharpFactory(config);
            
            // Komplexeres XSD-Schema
            const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://example.com""
           xmlns:tns=""http://example.com"">
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Address"" type=""tns:AddressType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";
            
            var tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);
            
            try
            {
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);
                
                // Typ-Metadaten abrufen
                var customerMetadata = navigator.GetTypeMetadata("CustomerType");
                Console.WriteLine($"Customer Typ: {customerMetadata?.Name} (Namespace: {customerMetadata?.XmlNamespace})");
                
                // Instance erstellen und verwenden
                var customerInstance = navigator.CreateInstance("CustomerType");
                customerInstance.SetProperty("Name", "Max Mustermann");
                
                var name = customerInstance.GetProperty("Name");
                Console.WriteLine($"Kunde: {name}");
            }
            finally
            {
                if (File.Exists(tempXsdFile))
                    File.Delete(tempXsdFile);
            }
        }

        private static void NavigationExample()
        {
            Console.WriteLine("\n=== XPath-ähnliche Navigation ===");
            
            var factory = new XsdToCSharpFactory();
            
            const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""Customer"" type=""CustomerType""/>
            <xs:element name=""Items"" type=""ItemListType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""CustomerName"" type=""xs:string""/>
            <xs:element name=""CustomerEmail"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemListType"">
        <xs:sequence>
            <xs:element name=""Item"" type=""ItemType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ItemType"">
        <xs:sequence>
            <xs:element name=""ItemName"" type=""xs:string""/>
            <xs:element name=""ItemPrice"" type=""xs:decimal""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";
            
            var tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);
            
            try
            {
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);
                
                // Pattern-basierte Suche
                Console.WriteLine("Alle Email-Properties:");
                var emailProps = navigator.SelectProperties("*", "*Email");
                foreach (var prop in emailProps)
                {
                    Console.WriteLine($"  {prop.OwningType?.Name}.{prop.Name}");
                }
                
                Console.WriteLine("\nAlle Name-Properties:");
                var nameProps = navigator.SelectProperties("*", "*Name");
                foreach (var prop in nameProps)
                {
                    Console.WriteLine($"  {prop.OwningType?.Name}.{prop.Name}");
                }
                
                // Deep property navigation
                var customerNameProp = navigator.SelectProperty("CustomerType/CustomerName");
                Console.WriteLine($"\nDirect property access: {customerNameProp?.Name} in {customerNameProp?.OwningType?.Name}");
                
                // Instance manipulation
                var orderInstance = navigator.CreateInstance("OrderType");
                orderInstance.SetProperty("OrderNumber", "ORD-2024-001");
                
                var orderNumber = orderInstance.GetProperty("OrderNumber");
                Console.WriteLine($"Order Number: {orderNumber}");
                
                // Validation
                var validation = orderInstance.Validate();
                Console.WriteLine($"Validation: {(validation.IsValid ? "Valid" : "Invalid")}");
                if (!validation.IsValid)
                {
                    foreach (var error in validation.Errors)
                    {
                        Console.WriteLine($"  Error: {error}");
                    }
                }
            }
            finally
            {
                if (File.Exists(tempXsdFile))
                    File.Delete(tempXsdFile);
            }
        }
    }
}