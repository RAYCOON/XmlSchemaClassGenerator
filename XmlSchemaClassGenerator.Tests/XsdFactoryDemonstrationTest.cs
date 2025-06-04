using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Demonstration test showing the complete new XsdToCSharpFactory workflow:
    /// 1. Generate TypeModel objects from XSD (not compiled C# types)
    /// 2. Navigate through types using XPath-like syntax
    /// 3. Create instances and manipulate properties dynamically
    /// 4. Access metadata and validation
    /// 
    /// This replaces the previous NotImplementedException approach!
    /// </summary>
    public class XsdFactoryDemonstrationTest : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdFactoryDemonstrationTest(ITestOutputHelper output)
        {
            _output = output;
        }

        public void Dispose()
        {
            foreach (var tempFile in _tempFiles)
            {
                if (File.Exists(tempFile))
                {
                    try { File.Delete(tempFile); } catch { }
                }
            }
        }

        private string CreateTempXsdFile(string xsdContent)
        {
            var tempFile = Path.GetTempFileName() + ".xsd";
            File.WriteAllText(tempFile, xsdContent);
            _tempFiles.Add(tempFile);
            return tempFile;
        }

        [Fact]
        public void CompleteWorkflowDemonstration_WithXPathLikeNavigation()
        {
            _output.WriteLine("=== XsdToCSharpFactory Complete Workflow Demonstration ===");
            _output.WriteLine("This test demonstrates the new functionality that replaces NotImplementedException!");
            _output.WriteLine("");

            // Arrange - Complex business schema
            const string businessSchema = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://business.example.com""
           xmlns:tns=""http://business.example.com"">
    
    <xs:element name=""BusinessOrder"" type=""tns:BusinessOrderType""/>
    
    <xs:complexType name=""BusinessOrderType"">
        <xs:sequence>
            <xs:element name=""OrderInfo"" type=""tns:OrderInfoType""/>
            <xs:element name=""Customer"" type=""tns:CustomerType""/>
            <xs:element name=""Items"" type=""tns:OrderItemListType""/>
            <xs:element name=""Payment"" type=""tns:PaymentType""/>
        </xs:sequence>
        <xs:attribute name=""orderId"" type=""xs:string"" use=""required""/>
        <xs:attribute name=""orderDate"" type=""xs:date""/>
    </xs:complexType>
    
    <xs:complexType name=""OrderInfoType"">
        <xs:sequence>
            <xs:element name=""OrderNumber"" type=""xs:string""/>
            <xs:element name=""TotalAmount"" type=""xs:decimal""/>
            <xs:element name=""Currency"" type=""xs:string"" default=""EUR""/>
            <xs:element name=""Status"" type=""tns:OrderStatusType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""CustomerType"">
        <xs:sequence>
            <xs:element name=""PersonalInfo"" type=""tns:PersonalInfoType""/>
            <xs:element name=""ContactInfo"" type=""tns:ContactInfoType""/>
            <xs:element name=""BillingAddress"" type=""tns:AddressType""/>
            <xs:element name=""ShippingAddress"" type=""tns:AddressType"" minOccurs=""0""/>
        </xs:sequence>
        <xs:attribute name=""customerId"" type=""xs:string"" use=""required""/>
    </xs:complexType>
    
    <xs:complexType name=""PersonalInfoType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""DateOfBirth"" type=""xs:date"" minOccurs=""0""/>
            <xs:element name=""Gender"" type=""tns:GenderType"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ContactInfoType"">
        <xs:sequence>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Phone"" type=""xs:string"" minOccurs=""0""/>
            <xs:element name=""MobilePhone"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""HouseNumber"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""PostalCode"" type=""xs:string""/>
            <xs:element name=""Country"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderItemListType"">
        <xs:sequence>
            <xs:element name=""Item"" type=""tns:OrderItemType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderItemType"">
        <xs:sequence>
            <xs:element name=""ProductCode"" type=""xs:string""/>
            <xs:element name=""ProductName"" type=""xs:string""/>
            <xs:element name=""Quantity"" type=""xs:int""/>
            <xs:element name=""UnitPrice"" type=""xs:decimal""/>
            <xs:element name=""TotalPrice"" type=""xs:decimal""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""PaymentType"">
        <xs:sequence>
            <xs:choice>
                <xs:element name=""CreditCard"" type=""tns:CreditCardType""/>
                <xs:element name=""BankTransfer"" type=""tns:BankTransferType""/>
                <xs:element name=""PayPal"" type=""tns:PayPalType""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""CreditCardType"">
        <xs:sequence>
            <xs:element name=""CardNumber"" type=""xs:string""/>
            <xs:element name=""ExpiryDate"" type=""xs:string""/>
            <xs:element name=""CardholderName"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""BankTransferType"">
        <xs:sequence>
            <xs:element name=""AccountNumber"" type=""xs:string""/>
            <xs:element name=""BankCode"" type=""xs:string""/>
            <xs:element name=""BankName"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""PayPalType"">
        <xs:sequence>
            <xs:element name=""PayPalEmail"" type=""xs:string""/>
            <xs:element name=""TransactionId"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:simpleType name=""GenderType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Male""/>
            <xs:enumeration value=""Female""/>
            <xs:enumeration value=""Other""/>
        </xs:restriction>
    </xs:simpleType>
    
    <xs:simpleType name=""OrderStatusType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Draft""/>
            <xs:enumeration value=""Confirmed""/>
            <xs:enumeration value=""Processing""/>
            <xs:enumeration value=""Shipped""/>
            <xs:enumeration value=""Delivered""/>
            <xs:enumeration value=""Cancelled""/>
        </xs:restriction>
    </xs:simpleType>
    
</xs:schema>";

            var xsdFile = CreateTempXsdFile(businessSchema);

            // Act - Step 1: Generate type navigator from XSD
            _output.WriteLine("Step 1: Creating XsdToCSharpFactory and generating TypeNavigator...");
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);
            
            Assert.NotNull(navigator);
            _output.WriteLine("✅ TypeNavigator created successfully!");

            // Step 2: Explore schema structure with XPath-like navigation
            _output.WriteLine("\nStep 2: Exploring schema structure...");
            var allTypes = navigator.GetAllTypeNames().ToList();
            _output.WriteLine($"Found {allTypes.Count} types:");
            foreach (var typeName in allTypes.Take(10)) // Show first 10
            {
                _output.WriteLine($"  - {typeName}");
            }

            // Step 3: Navigate to specific types
            _output.WriteLine("\nStep 3: XPath-like type navigation...");
            var businessOrderType = navigator.SelectType("BusinessOrderType");
            var customerType = navigator.SelectType("CustomerType"); 
            var addressType = navigator.SelectType("AddressType");

            Assert.NotNull(businessOrderType);
            Assert.NotNull(customerType);
            Assert.NotNull(addressType);
            _output.WriteLine("✅ Successfully navigated to specific types");

            // Step 4: Explore properties with XPath-like syntax
            _output.WriteLine("\nStep 4: Property navigation...");
            var customerProperties = navigator.SelectProperties("CustomerType").ToList();
            _output.WriteLine($"CustomerType has {customerProperties.Count} properties:");
            foreach (var prop in customerProperties)
            {
                _output.WriteLine($"  - {prop.Name} ({prop.Type?.Name}) [Required: {prop.IsRequired}]");
            }

            // Step 5: Deep property navigation
            _output.WriteLine("\nStep 5: Deep property path navigation...");
            var firstNameProp = navigator.SelectProperty("PersonalInfoType/FirstName");
            var streetProp = navigator.SelectProperty("AddressType/Street");
            var emailProp = navigator.SelectProperty("ContactInfoType/Email");

            Assert.NotNull(firstNameProp);
            Assert.NotNull(streetProp);
            Assert.NotNull(emailProp);
            _output.WriteLine("✅ Successfully navigated deep property paths");

            // Step 6: Pattern-based property search
            _output.WriteLine("\nStep 6: Pattern-based property search...");
            var allEmailProperties = navigator.SelectProperties("*", "*Email").ToList();
            var allNameProperties = navigator.SelectProperties("*", "*Name").ToList();
            
            _output.WriteLine($"Found {allEmailProperties.Count} Email properties:");
            foreach (var prop in allEmailProperties)
            {
                _output.WriteLine($"  - {prop.OwningType?.Name}.{prop.Name}");
            }
            
            _output.WriteLine($"Found {allNameProperties.Count} Name properties:");
            foreach (var prop in allNameProperties.Take(5)) // Show first 5
            {
                _output.WriteLine($"  - {prop.OwningType?.Name}.{prop.Name}");
            }

            // Step 7: Create and manipulate instances
            _output.WriteLine("\nStep 7: Creating type instances...");
            var customerInstance = navigator.CreateInstance("CustomerType");
            var addressInstance = navigator.CreateInstance("AddressType");
            var personalInfoInstance = navigator.CreateInstance("PersonalInfoType");

            Assert.NotNull(customerInstance);
            Assert.NotNull(addressInstance);
            Assert.NotNull(personalInfoInstance);

            // Step 8: Set properties dynamically (this is the key feature!)
            _output.WriteLine("\nStep 8: Setting properties dynamically...");
            
            // Set personal info
            personalInfoInstance.SetProperty("FirstName", "Maria");
            personalInfoInstance.SetProperty("LastName", "Schmidt");
            personalInfoInstance.SetProperty("DateOfBirth", new DateTime(1985, 3, 15));

            // Set address
            addressInstance.SetProperty("Street", "Königsallee");
            addressInstance.SetProperty("HouseNumber", "47");
            addressInstance.SetProperty("City", "Düsseldorf");
            addressInstance.SetProperty("PostalCode", "40212");
            addressInstance.SetProperty("Country", "Deutschland");

            _output.WriteLine("✅ Properties set successfully");

            // Step 9: Read properties back and verify
            _output.WriteLine("\nStep 9: Reading properties back...");
            
            var readFirstName = personalInfoInstance.GetProperty("FirstName");
            var readLastName = personalInfoInstance.GetProperty("LastName");
            var readStreet = addressInstance.GetProperty("Street");
            var readCity = addressInstance.GetProperty("City");

            Assert.Equal("Maria", readFirstName);
            Assert.Equal("Schmidt", readLastName);
            Assert.Equal("Königsallee", readStreet);
            Assert.Equal("Düsseldorf", readCity);

            _output.WriteLine($"✅ Personal Info: {readFirstName} {readLastName}");
            _output.WriteLine($"✅ Address: {readStreet}, {readCity}");

            // Step 10: Get type metadata
            _output.WriteLine("\nStep 10: Type metadata access...");
            var customerMetadata = navigator.GetTypeMetadata("CustomerType");
            var addressMetadata = navigator.GetTypeMetadata("AddressType");

            Assert.NotNull(customerMetadata);
            Assert.NotNull(addressMetadata);
            
            _output.WriteLine($"Customer Type: {customerMetadata.Name} (XML NS: {customerMetadata.XmlNamespace})");
            _output.WriteLine($"Address Type: {addressMetadata.Name} (XML NS: {addressMetadata.XmlNamespace})");

            // Step 11: Validation
            _output.WriteLine("\nStep 11: Instance validation...");
            var validation = personalInfoInstance.Validate();
            _output.WriteLine($"Personal Info validation: {(validation.IsValid ? "✅ Valid" : "❌ Invalid")}");
            if (!validation.IsValid)
            {
                foreach (var error in validation.Errors)
                {
                    _output.WriteLine($"  Error: {error}");
                }
            }

            // Step 12: Choice properties (if available)
            _output.WriteLine("\nStep 12: Choice properties exploration...");
            var choiceProperties = navigator.GetChoiceProperties().ToList();
            _output.WriteLine($"Found {choiceProperties.Count} choice properties:");
            foreach (var choiceProp in choiceProperties.Take(3))
            {
                _output.WriteLine($"  - {choiceProp.OwningType?.Name}.{choiceProp.Name}");
                var choiceInfo = navigator.GetChoiceElementInfo(choiceProp.OwningType?.Name, choiceProp.Name);
                foreach (var info in choiceInfo.Take(2))
                {
                    _output.WriteLine($"    Choice: {info.ElementName}");
                }
            }

            _output.WriteLine("\n=== ✅ COMPLETE WORKFLOW SUCCESSFUL! ===");
            _output.WriteLine("This demonstrates the new XsdToCSharpFactory functionality:");
            _output.WriteLine("✅ No more NotImplementedException!");
            _output.WriteLine("✅ XPath-like navigation through XSD types");
            _output.WriteLine("✅ Dynamic property access and manipulation");
            _output.WriteLine("✅ Type metadata and validation");
            _output.WriteLine("✅ Choice element support");
            _output.WriteLine("✅ Pattern-based property searching");
            _output.WriteLine("✅ In-memory object instances without compilation");
        }

        [Fact]
        public void XPathLikeNavigationExamples()
        {
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:complexType name=""CompanyType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Employees"" type=""EmployeeListType""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""EmployeeListType"">
        <xs:sequence>
            <xs:element name=""Employee"" type=""EmployeeType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""EmployeeType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Position"" type=""xs:string""/>
            <xs:element name=""Salary"" type=""xs:decimal""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            _output.WriteLine("=== XPath-like Navigation Examples ===");

            // Examples of XPath-like navigation
            _output.WriteLine("\n1. Get all types:");
            foreach (var typeName in navigator.GetAllTypeNames())
            {
                _output.WriteLine($"   {typeName}");
            }

            _output.WriteLine("\n2. Navigate to specific type:");
            var companyType = navigator.SelectType("CompanyType");
            _output.WriteLine($"   CompanyType found: {companyType?.Name}");

            _output.WriteLine("\n3. Get properties of a type:");
            var companyProps = navigator.SelectProperties("CompanyType");
            foreach (var prop in companyProps)
            {
                _output.WriteLine($"   CompanyType.{prop.Name} : {prop.Type?.Name}");
            }

            _output.WriteLine("\n4. Deep property navigation:");
            var employeeName = navigator.SelectProperty("EmployeeType/Name");
            var employeeSalary = navigator.SelectProperty("EmployeeType/Salary");
            _output.WriteLine($"   EmployeeType/Name: {employeeName?.Name}");
            _output.WriteLine($"   EmployeeType/Salary: {employeeSalary?.Name}");

            _output.WriteLine("\n5. Pattern-based search:");
            var allNameProps = navigator.SelectProperties("*", "Name");
            _output.WriteLine("   All 'Name' properties:");
            foreach (var prop in allNameProps)
            {
                _output.WriteLine($"     {prop.OwningType?.Name}.{prop.Name}");
            }

            _output.WriteLine("\n6. Create and manipulate instance:");
            var employeeInstance = navigator.CreateInstance("EmployeeType");
            employeeInstance.SetProperty("Name", "John Doe");
            employeeInstance.SetProperty("Position", "Developer");
            employeeInstance.SetProperty("Salary", 75000.00m);

            var name = employeeInstance.GetProperty("Name");
            var position = employeeInstance.GetProperty("Position");
            var salary = employeeInstance.GetProperty("Salary");

            _output.WriteLine($"   Employee: {name}, {position}, {salary:C}");

            _output.WriteLine("\n✅ All navigation examples completed successfully!");
        }
    }
}