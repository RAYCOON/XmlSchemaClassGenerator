using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    /// <summary>
    /// Tests specifically for the workflow: XSD → Assembly → XML-File Deserialization → Property Reading
    /// This tests the exact use case: Load XSD, deserialize XML file to generated type, read properties with navigator
    /// </summary>
    public class XsdTypeNavigatorXmlDeserializationTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdTypeNavigatorXmlDeserializationTests(ITestOutputHelper output)
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
        public void XsdToType_DeserializeXml_ReadPropertiesWithNavigator_ShouldWork()
        {
            // Arrange - Step 1: XSD Schema definieren
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://person.example.com""
           xmlns:tns=""http://person.example.com"">
    
    <xs:element name=""PersonDocument"" type=""tns:PersonDocumentType""/>
    
    <xs:complexType name=""PersonDocumentType"">
        <xs:sequence>
            <xs:element name=""DocumentId"" type=""xs:string""/>
            <xs:element name=""CreatedDate"" type=""xs:date""/>
            <xs:element name=""Persons"" type=""tns:PersonType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""PersonId"" type=""xs:string""/>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
            <xs:element name=""Email"" type=""xs:string"" minOccurs=""0""/>
            <xs:element name=""Address"" type=""tns:AddressType"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""PostalCode"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            // Step 2: XML-Daten zum Deserialisieren vorbereiten
            const string xmlData = @"<?xml version=""1.0"" encoding=""utf-8""?>
<PersonDocument>
  <DocumentId>DOC-2025-001</DocumentId>
  <CreatedDate>2025-01-15</CreatedDate>
  <Persons>
    <PersonId>P001</PersonId>
    <FirstName>Anna</FirstName>
    <LastName>Schmidt</LastName>
    <Age>30</Age>
    <Email>anna.schmidt@example.com</Email>
    <Address>
      <Street>Hauptstraße 123</Street>
      <City>Berlin</City>
      <PostalCode>10115</PostalCode>
    </Address>
  </Persons>
  <Persons>
    <PersonId>P002</PersonId>
    <FirstName>Thomas</FirstName>
    <LastName>Müller</LastName>
    <Age>25</Age>
    <Email>thomas.mueller@example.com</Email>
    <Address>
      <Street>Münchener Straße 45</Street>
      <City>München</City>
      <PostalCode>80331</PostalCode>
    </Address>
  </Persons>
  <Persons>
    <PersonId>P003</PersonId>
    <FirstName>Maria</FirstName>
    <LastName>Gonzalez</LastName>
    <Age>35</Age>
    <Address>
      <Street>Hamburger Allee 67</Street>
      <City>Hamburg</City>
      <PostalCode>20095</PostalCode>
    </Address>
  </Persons>
</PersonDocument>";

            var xsdFile = CreateTempXsdFile(xsd);
            
            // Act - Step 3: XSD → Assembly mit Navigator
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "PersonTest" },
                { new NamespaceKey("http://person.example.com"), "PersonTest" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            };

            var assembly = Compiler.GenerateFiles("PersonDocumentTest", new[] { xsdFile }, generator);
            var personDocumentType = assembly.GetTypes().First(t => t.Name == "PersonDocumentType");

            _output.WriteLine($"✓ XSD → Assembly: PersonDocumentType gefunden ({personDocumentType.Name})");

            // Step 4: XML → Type deserialisieren - Use XML root element override
            object deserializedDocument;
            try 
            {
                var xmlRootAttribute = new System.Xml.Serialization.XmlRootAttribute("PersonDocument");
                var xmlSerializer = new System.Xml.Serialization.XmlSerializer(personDocumentType, xmlRootAttribute);
                using (var reader = new System.IO.StringReader(xmlData))
                {
                    deserializedDocument = xmlSerializer.Deserialize(reader);
                }
                _output.WriteLine($"✓ XML erfolgreich zu {personDocumentType.Name} deserialisiert (mit Root-Element Override)");
            }
            catch (Exception ex)
            {
                _output.WriteLine($"XML deserialization mit Root-Element Override fehlgeschlagen: {ex.Message}");
                // Fallback to navigator method
                deserializedDocument = navigator.DeserializeFromXml(xmlData, personDocumentType);
                _output.WriteLine($"✓ Fallback: XML erfolgreich zu {personDocumentType.Name} deserialisiert");
            }
            
            Assert.NotNull(deserializedDocument);

            // Assert - Step 5: Properties mit Navigator lesen
            _output.WriteLine("\n📖 PROPERTIES MIT NAVIGATOR LESEN:");
            
            // Document-Level Properties
            var documentId = navigator.GetPropertyValue(deserializedDocument, "DocumentId");
            var createdDate = navigator.GetPropertyValue(deserializedDocument, "CreatedDate");
            
            Assert.Equal("DOC-2025-001", documentId);
            Assert.NotNull(createdDate);
            
            _output.WriteLine($"✓ DocumentId: '{documentId}'");
            _output.WriteLine($"✓ CreatedDate: '{createdDate}'");

            // Array-Index Navigation: Persons[0], Persons[1], Persons[2]
            var person1Id = navigator.GetPropertyValue(deserializedDocument, "Persons[0].PersonId");
            var person1FirstName = navigator.GetPropertyValue(deserializedDocument, "Persons[0].FirstName");
            var person1LastName = navigator.GetPropertyValue(deserializedDocument, "Persons[0].LastName");
            var person1Age = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Age");
            var person1Email = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Email");
            
            Assert.Equal("P001", person1Id);
            Assert.Equal("Anna", person1FirstName);
            Assert.Equal("Schmidt", person1LastName);
            Assert.Equal(30, person1Age);
            Assert.Equal("anna.schmidt@example.com", person1Email);
            
            _output.WriteLine($"✓ Persons[0].PersonId: '{person1Id}'");
            _output.WriteLine($"✓ Persons[0].FirstName: '{person1FirstName}'");
            _output.WriteLine($"✓ Persons[0].LastName: '{person1LastName}'");
            _output.WriteLine($"✓ Persons[0].Age: {person1Age}");
            _output.WriteLine($"✓ Persons[0].Email: '{person1Email}'");

            // Verschachtelte Properties: Address in Person[0]
            var person1Street = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Address.Street");
            var person1City = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Address.City");
            var person1PostalCode = navigator.GetPropertyValue(deserializedDocument, "Persons[0].Address.PostalCode");
            
            Assert.Equal("Hauptstraße 123", person1Street);
            Assert.Equal("Berlin", person1City);
            Assert.Equal("10115", person1PostalCode);
            
            _output.WriteLine($"✓ Persons[0].Address.Street: '{person1Street}'");
            _output.WriteLine($"✓ Persons[0].Address.City: '{person1City}'");
            _output.WriteLine($"✓ Persons[0].Address.PostalCode: '{person1PostalCode}'");

            // Zweite Person
            var person2FirstName = navigator.GetPropertyValue(deserializedDocument, "Persons[1].FirstName");
            var person2Age = navigator.GetPropertyValue(deserializedDocument, "Persons[1].Age");
            var person2City = navigator.GetPropertyValue(deserializedDocument, "Persons[1].Address.City");
            
            Assert.Equal("Thomas", person2FirstName);
            Assert.Equal(25, person2Age);
            Assert.Equal("München", person2City);
            
            _output.WriteLine($"✓ Persons[1].FirstName: '{person2FirstName}'");
            _output.WriteLine($"✓ Persons[1].Age: {person2Age}");
            _output.WriteLine($"✓ Persons[1].Address.City: '{person2City}'");

            // Dritte Person (ohne Email)
            var person3FirstName = navigator.GetPropertyValue(deserializedDocument, "Persons[2].FirstName");
            var person3Email = navigator.GetPropertyValue(deserializedDocument, "Persons[2].Email");
            var person3City = navigator.GetPropertyValue(deserializedDocument, "Persons[2].Address.City");
            
            Assert.Equal("Maria", person3FirstName);
            Assert.Null(person3Email); // Keine Email im XML
            Assert.Equal("Hamburg", person3City);
            
            _output.WriteLine($"✓ Persons[2].FirstName: '{person3FirstName}'");
            _output.WriteLine($"✓ Persons[2].Email: {person3Email ?? "null"} (erwartet: null)");
            _output.WriteLine($"✓ Persons[2].Address.City: '{person3City}'");

            _output.WriteLine("\n🎉 === VOLLSTÄNDIGER WORKFLOW ERFOLGREICH ===");
            _output.WriteLine("XSD → Assembly → XML deserialize → Array-Index Property Navigation ✅");
        }

        [Fact]
        public void ComplexXsd_XmlDeserialization_NestedArrayNavigation_ShouldWork()
        {
            // Arrange - Komplexeres Schema mit verschachtelten Arrays
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://order.example.com""
           xmlns:tns=""http://order.example.com"">
    
    <xs:element name=""OrderDocument"" type=""tns:OrderDocumentType""/>
    
    <xs:complexType name=""OrderDocumentType"">
        <xs:sequence>
            <xs:element name=""DocumentId"" type=""xs:string""/>
            <xs:element name=""Orders"" type=""tns:OrderType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""OrderType"">
        <xs:sequence>
            <xs:element name=""OrderId"" type=""xs:string""/>
            <xs:element name=""CustomerName"" type=""xs:string""/>
            <xs:element name=""Total"" type=""xs:decimal""/>
            <xs:element name=""Items"" type=""tns:ItemType"" maxOccurs=""unbounded""/>
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

            const string xmlData = @"<?xml version=""1.0"" encoding=""utf-8""?>
<OrderDocument>
  <DocumentId>ORDER-DOC-2025</DocumentId>
  <Orders>
    <OrderId>ORD-001</OrderId>
    <CustomerName>Max Mustermann</CustomerName>
    <Total>1599.98</Total>
    <Items>
      <ProductName>Laptop</ProductName>
      <Quantity>1</Quantity>
      <Price>1299.99</Price>
    </Items>
    <Items>
      <ProductName>USB-Maus</ProductName>
      <Quantity>2</Quantity>
      <Price>149.99</Price>
    </Items>
  </Orders>
  <Orders>
    <OrderId>ORD-002</OrderId>
    <CustomerName>Anna Schmidt</CustomerName>
    <Total>89.99</Total>
    <Items>
      <ProductName>Wireless Keyboard</ProductName>
      <Quantity>1</Quantity>
      <Price>89.99</Price>
    </Items>
  </Orders>
</OrderDocument>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "OrderTest" },
                { new NamespaceKey("http://order.example.com"), "OrderTest" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            };

            var assembly = Compiler.GenerateFiles("OrderDocumentTest", new[] { xsdFile }, generator);
            var orderDocumentType = assembly.GetTypes().First(t => t.Name == "OrderDocumentType");

            // Act - Use XML root element override to handle namespace mapping
            object deserializedDocument;
            try 
            {
                var xmlRootAttribute = new System.Xml.Serialization.XmlRootAttribute("OrderDocument");
                var xmlSerializer = new System.Xml.Serialization.XmlSerializer(orderDocumentType, xmlRootAttribute);
                using (var reader = new System.IO.StringReader(xmlData))
                {
                    deserializedDocument = xmlSerializer.Deserialize(reader);
                }
                _output.WriteLine($"✓ XML erfolgreich zu {orderDocumentType.Name} deserialisiert (mit Root-Element Override)");
            }
            catch (Exception ex)
            {
                _output.WriteLine($"XML deserialization mit Root-Element Override fehlgeschlagen: {ex.Message}");
                // Fallback to navigator method
                deserializedDocument = navigator.DeserializeFromXml(xmlData, orderDocumentType);
                _output.WriteLine($"✓ Fallback: XML erfolgreich zu {orderDocumentType.Name} deserialisiert");
            }
            
            Assert.NotNull(deserializedDocument);

            // Assert - Verschachtelte Array-Navigation
            _output.WriteLine("\n📦 VERSCHACHTELTE ARRAY-NAVIGATION:");
            
            // Debug: Check available properties
            var props = deserializedDocument.GetType().GetProperties();
            _output.WriteLine($"Available properties: {string.Join(", ", props.Select(p => p.Name))}");
            
            // Debug: Check XML attributes on first few properties
            foreach (var prop in props.Take(3))
            {
                var xmlElementAttrs = prop.GetCustomAttributes(typeof(System.Xml.Serialization.XmlElementAttribute), false);
                if (xmlElementAttrs.Length > 0)
                {
                    var xmlElement = (System.Xml.Serialization.XmlElementAttribute)xmlElementAttrs[0];
                    _output.WriteLine($"Property '{prop.Name}' maps to XML element '{xmlElement.ElementName}'");
                }
                else
                {
                    _output.WriteLine($"Property '{prop.Name}' has no XmlElement attribute");
                }
            }
            
            // Debug: Check direct property access
            var documentIdProp = deserializedDocument.GetType().GetProperty("DocumentId");
            var directDocumentId = documentIdProp?.GetValue(deserializedDocument);
            _output.WriteLine($"Direct property access DocumentId: '{directDocumentId}'");
            
            var documentId = navigator.GetPropertyValue(deserializedDocument, "DocumentId");
            Assert.Equal("ORDER-DOC-2025", documentId);
            _output.WriteLine($"✓ DocumentId: '{documentId}'");

            // Order[0] Properties
            var order1Id = navigator.GetPropertyValue(deserializedDocument, "Orders[0].OrderId");
            var order1Customer = navigator.GetPropertyValue(deserializedDocument, "Orders[0].CustomerName");
            var order1Total = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Total");
            
            Assert.Equal("ORD-001", order1Id);
            Assert.Equal("Max Mustermann", order1Customer);
            Assert.Equal(1599.98m, order1Total);
            
            _output.WriteLine($"✓ Orders[0].OrderId: '{order1Id}'");
            _output.WriteLine($"✓ Orders[0].CustomerName: '{order1Customer}'");
            _output.WriteLine($"✓ Orders[0].Total: {order1Total}");

            // Order[0].Items[0] und Order[0].Items[1]
            var item1Name = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Items[0].ProductName");
            var item1Qty = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Items[0].Quantity");
            var item1Price = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Items[0].Price");
            
            Assert.Equal("Laptop", item1Name);
            Assert.Equal(1, item1Qty);
            Assert.Equal(1299.99m, item1Price);
            
            _output.WriteLine($"✓ Orders[0].Items[0].ProductName: '{item1Name}'");
            _output.WriteLine($"✓ Orders[0].Items[0].Quantity: {item1Qty}");
            _output.WriteLine($"✓ Orders[0].Items[0].Price: {item1Price}");

            var item2Name = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Items[1].ProductName");
            var item2Qty = navigator.GetPropertyValue(deserializedDocument, "Orders[0].Items[1].Quantity");
            
            Assert.Equal("USB-Maus", item2Name);
            Assert.Equal(2, item2Qty);
            
            _output.WriteLine($"✓ Orders[0].Items[1].ProductName: '{item2Name}'");
            _output.WriteLine($"✓ Orders[0].Items[1].Quantity: {item2Qty}");

            // Order[1].Items[0] (andere Order, erstes Item)
            var order2Item1Name = navigator.GetPropertyValue(deserializedDocument, "Orders[1].Items[0].ProductName");
            var order2Item1Price = navigator.GetPropertyValue(deserializedDocument, "Orders[1].Items[0].Price");
            
            Assert.Equal("Wireless Keyboard", order2Item1Name);
            Assert.Equal(89.99m, order2Item1Price);
            
            _output.WriteLine($"✓ Orders[1].Items[0].ProductName: '{order2Item1Name}'");
            _output.WriteLine($"✓ Orders[1].Items[0].Price: {order2Item1Price}");

            _output.WriteLine("\n🎯 === VERSCHACHTELTE ARRAY-NAVIGATION ERFOLGREICH ===");
            _output.WriteLine("Orders[X].Items[Y].Property Navigation funktioniert perfekt! ✅");
        }

        [Fact]
        public void RealWorldWorkflow_XsdToXmlToNavigator_ShouldHandleAllCases()
        {
            // Arrange - Realistisches Szenario mit allen Features
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://company.example.com""
           xmlns:tns=""http://company.example.com"">
    
    <xs:element name=""Company"" type=""tns:CompanyType""/>
    
    <xs:complexType name=""CompanyType"">
        <xs:sequence>
            <xs:element name=""CompanyName"" type=""xs:string""/>
            <xs:element name=""Founded"" type=""xs:int""/>
            <xs:element name=""Departments"" type=""tns:DepartmentType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""DepartmentType"">
        <xs:sequence>
            <xs:element name=""DepartmentName"" type=""xs:string""/>
            <xs:element name=""Budget"" type=""xs:decimal""/>
            <xs:element name=""Employees"" type=""tns:EmployeeType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""EmployeeType"">
        <xs:sequence>
            <xs:element name=""EmployeeId"" type=""xs:string""/>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Position"" type=""xs:string""/>
            <xs:element name=""Salary"" type=""xs:decimal""/>
            <xs:element name=""Projects"" type=""tns:ProjectType"" maxOccurs=""unbounded"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""ProjectType"">
        <xs:sequence>
            <xs:element name=""ProjectName"" type=""xs:string""/>
            <xs:element name=""Status"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
    
</xs:schema>";

            const string xmlData = @"<?xml version=""1.0"" encoding=""utf-8""?>
<Company>
  <CompanyName>Tech Solutions GmbH</CompanyName>
  <Founded>2010</Founded>
  <Departments>
    <DepartmentName>Development</DepartmentName>
    <Budget>500000.00</Budget>
    <Employees>
      <EmployeeId>EMP-001</EmployeeId>
      <Name>Anna Developer</Name>
      <Position>Senior Developer</Position>
      <Salary>75000.00</Salary>
      <Projects>
        <ProjectName>WebApp v2.0</ProjectName>
        <Status>In Progress</Status>
      </Projects>
      <Projects>
        <ProjectName>API Migration</ProjectName>
        <Status>Completed</Status>
      </Projects>
    </Employees>
    <Employees>
      <EmployeeId>EMP-002</EmployeeId>
      <Name>Thomas Architect</Name>
      <Position>Software Architect</Position>
      <Salary>85000.00</Salary>
      <Projects>
        <ProjectName>System Design</ProjectName>
        <Status>Planning</Status>
      </Projects>
    </Employees>
  </Departments>
  <Departments>
    <DepartmentName>Sales</DepartmentName>
    <Budget>200000.00</Budget>
    <Employees>
      <EmployeeId>EMP-003</EmployeeId>
      <Name>Maria Sales</Name>
      <Position>Sales Manager</Position>
      <Salary>65000.00</Salary>
    </Employees>
  </Departments>
</Company>";

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory();
            var navigator = factory.GenerateTypesFromXsd(xsdFile);

            var namespaceMap = new Dictionary<NamespaceKey, string>
            {
                { new NamespaceKey(), "CompanyTest" },
                { new NamespaceKey("http://company.example.com"), "CompanyTest" }
            };

            var generator = new Generator
            {
                GenerateNullables = true,
                DataAnnotationMode = DataAnnotationMode.All,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = namespaceMap.ToNamespaceProvider()
            };

            var assembly = Compiler.GenerateFiles("CompanyTest", new[] { xsdFile }, generator);
            var companyType = assembly.GetTypes().First(t => t.Name == "CompanyType");

            // Act & Assert - Use XML root element override to handle namespace mapping
            object company;
            try 
            {
                var xmlRootAttribute = new System.Xml.Serialization.XmlRootAttribute("Company");
                var xmlSerializer = new System.Xml.Serialization.XmlSerializer(companyType, xmlRootAttribute);
                using (var reader = new System.IO.StringReader(xmlData))
                {
                    company = xmlSerializer.Deserialize(reader);
                }
                _output.WriteLine($"✓ XML erfolgreich zu {companyType.Name} deserialisiert (mit Root-Element Override)");
            }
            catch (Exception ex)
            {
                _output.WriteLine($"XML deserialization mit Root-Element Override fehlgeschlagen: {ex.Message}");
                // Fallback to navigator method
                company = navigator.DeserializeFromXml(xmlData, companyType);
                _output.WriteLine($"✓ Fallback: XML erfolgreich zu {companyType.Name} deserialisiert");
            }
            
            Assert.NotNull(company);

            _output.WriteLine("\n🏢 REAL-WORLD COMPANY NAVIGATION:");

            // Company-Level
            var companyName = navigator.GetPropertyValue(company, "CompanyName");
            var founded = navigator.GetPropertyValue(company, "Founded");
            Assert.Equal("Tech Solutions GmbH", companyName);
            Assert.Equal(2010, founded);
            _output.WriteLine($"✓ CompanyName: '{companyName}'");
            _output.WriteLine($"✓ Founded: {founded}");

            // Department-Level Navigation
            var dept1Name = navigator.GetPropertyValue(company, "Departments[0].DepartmentName");
            var dept1Budget = navigator.GetPropertyValue(company, "Departments[0].Budget");
            var dept2Name = navigator.GetPropertyValue(company, "Departments[1].DepartmentName");
            
            Assert.Equal("Development", dept1Name);
            Assert.Equal(500000.00m, dept1Budget);
            Assert.Equal("Sales", dept2Name);
            
            _output.WriteLine($"✓ Departments[0].DepartmentName: '{dept1Name}'");
            _output.WriteLine($"✓ Departments[0].Budget: {dept1Budget}");
            _output.WriteLine($"✓ Departments[1].DepartmentName: '{dept2Name}'");

            // Employee-Level Navigation (3-fach verschachtelt)
            var emp1Name = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Name");
            var emp1Position = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Position");
            var emp1Salary = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Salary");
            var emp2Name = navigator.GetPropertyValue(company, "Departments[0].Employees[1].Name");
            
            Assert.Equal("Anna Developer", emp1Name);
            Assert.Equal("Senior Developer", emp1Position);
            Assert.Equal(75000.00m, emp1Salary);
            Assert.Equal("Thomas Architect", emp2Name);
            
            _output.WriteLine($"✓ Departments[0].Employees[0].Name: '{emp1Name}'");
            _output.WriteLine($"✓ Departments[0].Employees[0].Position: '{emp1Position}'");
            _output.WriteLine($"✓ Departments[0].Employees[0].Salary: {emp1Salary}");
            _output.WriteLine($"✓ Departments[0].Employees[1].Name: '{emp2Name}'");

            // Project-Level Navigation (4-fach verschachtelt!)
            var proj1Name = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Projects[0].ProjectName");
            var proj1Status = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Projects[0].Status");
            var proj2Name = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Projects[1].ProjectName");
            var proj2Status = navigator.GetPropertyValue(company, "Departments[0].Employees[0].Projects[1].Status");
            
            Assert.Equal("WebApp v2.0", proj1Name);
            Assert.Equal("In Progress", proj1Status);
            Assert.Equal("API Migration", proj2Name);
            Assert.Equal("Completed", proj2Status);
            
            _output.WriteLine($"✓ Departments[0].Employees[0].Projects[0].ProjectName: '{proj1Name}'");
            _output.WriteLine($"✓ Departments[0].Employees[0].Projects[0].Status: '{proj1Status}'");
            _output.WriteLine($"✓ Departments[0].Employees[0].Projects[1].ProjectName: '{proj2Name}'");
            _output.WriteLine($"✓ Departments[0].Employees[0].Projects[1].Status: '{proj2Status}'");

            // Thomas' Projekt
            var thomasProject = navigator.GetPropertyValue(company, "Departments[0].Employees[1].Projects[0].ProjectName");
            Assert.Equal("System Design", thomasProject);
            _output.WriteLine($"✓ Departments[0].Employees[1].Projects[0].ProjectName: '{thomasProject}'");

            // Sales Department Employee (ohne Projects)
            var salesEmpName = navigator.GetPropertyValue(company, "Departments[1].Employees[0].Name");
            var salesEmpPosition = navigator.GetPropertyValue(company, "Departments[1].Employees[0].Position");
            
            Assert.Equal("Maria Sales", salesEmpName);
            Assert.Equal("Sales Manager", salesEmpPosition);
            
            _output.WriteLine($"✓ Departments[1].Employees[0].Name: '{salesEmpName}'");
            _output.WriteLine($"✓ Departments[1].Employees[0].Position: '{salesEmpPosition}'");

            _output.WriteLine("\n🚀 === 4-FACH VERSCHACHTELTE NAVIGATION ERFOLGREICH ===");
            _output.WriteLine("Company.Departments[X].Employees[Y].Projects[Z].Property ✅");
            _output.WriteLine("Der gewünschte Workflow funktioniert perfekt!");
        }
    }
}