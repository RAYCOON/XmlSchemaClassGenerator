using System;
using System.IO;
using System.Linq;

namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Beispiel für dynamischen Zugriff auf XSD-Typen mit der neuen XsdTypeNavigator-API
    /// </summary>
    public class DynamicAccessExample
    {
        public static void Main()
        {
            Console.WriteLine("=== Dynamisches Zugriffs-Beispiel ===");
            
            var factory = new XsdToCSharpFactory();
            
            // Erstelle ein XSD mit verschiedenen Typen
            const string xsdContent = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://company.example.com""
           xmlns:tns=""http://company.example.com"">
    
    <xs:complexType name=""CompanyType"">
        <xs:sequence>
            <xs:element name=""CompanyName"" type=""xs:string""/>
            <xs:element name=""Employees"" type=""tns:EmployeeListType""/>
            <xs:element name=""Headquarters"" type=""tns:AddressType""/>
        </xs:sequence>
        <xs:attribute name=""founded"" type=""xs:int""/>
    </xs:complexType>
    
    <xs:complexType name=""EmployeeListType"">
        <xs:sequence>
            <xs:element name=""Employee"" type=""tns:EmployeeType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""EmployeeType"">
        <xs:sequence>
            <xs:element name=""PersonalInfo"" type=""tns:PersonType""/>
            <xs:element name=""Position"" type=""xs:string""/>
            <xs:element name=""Salary"" type=""xs:decimal""/>
            <xs:element name=""Department"" type=""tns:DepartmentType""/>
        </xs:sequence>
        <xs:attribute name=""employeeId"" type=""xs:string"" use=""required""/>
    </xs:complexType>
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Phone"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""Country"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:simpleType name=""DepartmentType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""IT""/>
            <xs:enumeration value=""HR""/>
            <xs:enumeration value=""Finance""/>
            <xs:enumeration value=""Marketing""/>
        </xs:restriction>
    </xs:simpleType>
    
</xs:schema>";
            
            // Temporäre XSD-Datei erstellen
            var tempXsdFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempXsdFile, xsdContent);
            
            try
            {
                // TypeNavigator generieren
                var navigator = factory.GenerateTypesFromXsd(tempXsdFile);
                
                // 1. Schema-Exploration
                ExploreSchema(navigator);
                
                // 2. Dynamische Property-Suche
                DynamicPropertySearch(navigator);
                
                // 3. Instance-Manipulation
                InstanceManipulation(navigator);
                
                // 4. Validierung
                ValidationExample(navigator);
            }
            finally
            {
                // Cleanup
                if (File.Exists(tempXsdFile))
                    File.Delete(tempXsdFile);
            }
        }
        
        private static void ExploreSchema(XsdTypeNavigator navigator)
        {
            Console.WriteLine("\n--- Schema-Exploration ---");
            
            // Alle Typen auflisten
            var allTypes = navigator.GetAllTypeNames().ToList();
            Console.WriteLine($"Gefundene Typen ({allTypes.Count}):");
            foreach (var typeName in allTypes)
            {
                Console.WriteLine($"  - {typeName}");
            }
            
            // Typen nach Namespace gruppieren
            var typesByNamespace = navigator.GetTypesByNamespace();
            Console.WriteLine($"\nTypen nach Namespace ({typesByNamespace.Count} Namespaces):");
            foreach (var ns in typesByNamespace)
            {
                Console.WriteLine($"  Namespace: {ns.Key}");
                foreach (var type in ns.Value)
                {
                    Console.WriteLine($"    - {type.Name}");
                }
            }
        }
        
        private static void DynamicPropertySearch(XsdTypeNavigator navigator)
        {
            Console.WriteLine("\n--- Dynamische Property-Suche ---");
            
            // Alle Email-Properties finden
            var emailProperties = navigator.SelectProperties("*", "*Email").ToList();
            Console.WriteLine($"Email-Properties ({emailProperties.Count}):");
            foreach (var prop in emailProperties)
            {
                Console.WriteLine($"  {prop.OwningType?.Name}.{prop.Name}");
            }
            
            // Alle Name-Properties finden
            var nameProperties = navigator.SelectProperties("*", "*Name").ToList();
            Console.WriteLine($"\nName-Properties ({nameProperties.Count}):");
            foreach (var prop in nameProperties)
            {
                Console.WriteLine($"  {prop.OwningType?.Name}.{prop.Name}");
            }
            
            // Properties eines spezifischen Typs
            var employeeProperties = navigator.SelectProperties("EmployeeType").ToList();
            Console.WriteLine($"\nEmployeeType Properties ({employeeProperties.Count}):");
            foreach (var prop in employeeProperties)
            {
                Console.WriteLine($"  {prop.Name} ({prop.Type?.Name}) [Required: {prop.IsRequired}, Attribute: {prop.IsAttribute}]");
            }
        }
        
        private static void InstanceManipulation(XsdTypeNavigator navigator)
        {
            Console.WriteLine("\n--- Instance-Manipulation ---");
            
            // Employee-Instance erstellen
            var employeeInstance = navigator.CreateInstance("EmployeeType");
            
            // Properties setzen
            employeeInstance.SetProperty("EmployeeId", "EMP001");
            employeeInstance.SetProperty("Position", "Senior Developer");
            employeeInstance.SetProperty("Salary", 85000.00m);
            employeeInstance.SetProperty("Department", "IT");
            
            // Properties lesen
            var employeeId = employeeInstance.GetProperty("EmployeeId");
            var position = employeeInstance.GetProperty("Position");
            var salary = employeeInstance.GetProperty("Salary");
            var department = employeeInstance.GetProperty("Department");
            
            Console.WriteLine($"Employee: {employeeId}");
            Console.WriteLine($"Position: {position}");
            Console.WriteLine($"Salary: {salary:C}");
            Console.WriteLine($"Department: {department}");
            
            // Person-Instance für verschachtelte Struktur
            var personInstance = navigator.CreateInstance("PersonType");
            personInstance.SetProperty("FirstName", "Anna");
            personInstance.SetProperty("LastName", "Schmidt");
            personInstance.SetProperty("Email", "anna.schmidt@company.com");
            personInstance.SetProperty("Phone", "+49 89 12345678");
            
            var firstName = personInstance.GetProperty("FirstName");
            var lastName = personInstance.GetProperty("LastName");
            var email = personInstance.GetProperty("Email");
            
            Console.WriteLine($"\nPerson: {firstName} {lastName}");
            Console.WriteLine($"Email: {email}");
            
            // Alle Properties einer Instance anzeigen
            var allProperties = employeeInstance.GetAllProperties();
            Console.WriteLine($"\nAlle Employee Properties ({allProperties.Count}):");
            foreach (var prop in allProperties)
            {
                Console.WriteLine($"  {prop.Key} = {prop.Value}");
            }
        }
        
        private static void ValidationExample(XsdTypeNavigator navigator)
        {
            Console.WriteLine("\n--- Validierung ---");
            
            // Valide Instance
            var validEmployee = navigator.CreateInstance("EmployeeType");
            validEmployee.SetProperty("EmployeeId", "EMP002");
            validEmployee.SetProperty("Position", "Manager");
            validEmployee.SetProperty("Salary", 95000.00m);
            validEmployee.SetProperty("Department", "HR");
            
            var validResult = validEmployee.Validate();
            Console.WriteLine($"Valide Employee: {(validResult.IsValid ? "✓ Valid" : "✗ Invalid")}");
            
            // Invalide Instance (fehlende Required Properties)
            var invalidEmployee = navigator.CreateInstance("EmployeeType");
            invalidEmployee.SetProperty("Position", "Developer");
            // EmployeeId fehlt (Required)
            
            var invalidResult = invalidEmployee.Validate();
            Console.WriteLine($"Invalide Employee: {(invalidResult.IsValid ? "✓ Valid" : "✗ Invalid")}");
            
            if (!invalidResult.IsValid)
            {
                Console.WriteLine("Validation Errors:");
                foreach (var error in invalidResult.Errors)
                {
                    Console.WriteLine($"  - {error}");
                }
            }
            
            // Type-Metadaten anzeigen
            var employeeMetadata = navigator.GetTypeMetadata("EmployeeType");
            if (employeeMetadata != null)
            {
                Console.WriteLine($"\nEmployee Type Metadata:");
                Console.WriteLine($"  Name: {employeeMetadata.Name}");
                Console.WriteLine($"  XML Namespace: {employeeMetadata.XmlNamespace}");
                Console.WriteLine($"  Is Abstract: {employeeMetadata.IsAbstract}");
                Console.WriteLine($"  Base Type: {employeeMetadata.BaseTypeName ?? "None"}");
            }
        }
    }
}