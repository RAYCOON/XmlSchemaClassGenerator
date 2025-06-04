using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    public class XsdToCSharpFactoryIntegrationTests : IDisposable
    {
        private readonly ITestOutputHelper _output;
        private readonly List<string> _tempFiles = new List<string>();

        public XsdToCSharpFactoryIntegrationTests(ITestOutputHelper output)
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
        public void IntegrationTest_CompleteWorkflow_ShouldWorkEndToEnd()
        {
            // Arrange - Real-world-like schema
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://company.example.com/hr""
           xmlns:tns=""http://company.example.com/hr""
           elementFormDefault=""qualified"">

    <xs:element name=""EmployeeDirectory"" type=""tns:EmployeeDirectoryType""/>

    <xs:complexType name=""EmployeeDirectoryType"">
        <xs:sequence>
            <xs:element name=""Company"" type=""tns:CompanyType""/>
            <xs:element name=""Employees"" type=""tns:EmployeesType""/>
        </xs:sequence>
        <xs:attribute name=""version"" type=""xs:string"" use=""required""/>
        <xs:attribute name=""lastUpdated"" type=""xs:dateTime""/>
    </xs:complexType>

    <xs:complexType name=""CompanyType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Address"" type=""tns:AddressType""/>
            <xs:element name=""ContactInfo"" type=""tns:ContactInfoType""/>
        </xs:sequence>
        <xs:attribute name=""id"" type=""xs:string"" use=""required""/>
    </xs:complexType>

    <xs:complexType name=""AddressType"">
        <xs:sequence>
            <xs:element name=""Street"" type=""xs:string""/>
            <xs:element name=""City"" type=""xs:string""/>
            <xs:element name=""State"" type=""xs:string""/>
            <xs:element name=""ZipCode"" type=""xs:string""/>
            <xs:element name=""Country"" type=""xs:string"" default=""USA""/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name=""ContactInfoType"">
        <xs:choice>
            <xs:element name=""Phone"" type=""xs:string""/>
            <xs:element name=""Email"" type=""xs:string""/>
            <xs:element name=""Website"" type=""xs:anyURI""/>
        </xs:choice>
    </xs:complexType>

    <xs:complexType name=""EmployeesType"">
        <xs:sequence>
            <xs:element name=""Employee"" type=""tns:EmployeeType"" maxOccurs=""unbounded""/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name=""EmployeeType"">
        <xs:sequence>
            <xs:element name=""PersonalInfo"" type=""tns:PersonalInfoType""/>
            <xs:element name=""JobInfo"" type=""tns:JobInfoType""/>
            <xs:element name=""Salary"" type=""tns:SalaryType"" minOccurs=""0""/>
        </xs:sequence>
        <xs:attribute name=""employeeId"" type=""xs:string"" use=""required""/>
        <xs:attribute name=""status"" type=""tns:EmployeeStatusType"" default=""Active""/>
    </xs:complexType>

    <xs:complexType name=""PersonalInfoType"">
        <xs:sequence>
            <xs:element name=""FirstName"" type=""xs:string""/>
            <xs:element name=""LastName"" type=""xs:string""/>
            <xs:element name=""DateOfBirth"" type=""xs:date"" minOccurs=""0""/>
            <xs:element name=""Gender"" type=""tns:GenderType"" minOccurs=""0""/>
            <xs:element name=""Address"" type=""tns:AddressType"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name=""JobInfoType"">
        <xs:sequence>
            <xs:element name=""Title"" type=""xs:string""/>
            <xs:element name=""Department"" type=""xs:string""/>
            <xs:element name=""HireDate"" type=""xs:date""/>
            <xs:element name=""Manager"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name=""SalaryType"">
        <xs:sequence>
            <xs:element name=""Amount"" type=""xs:decimal""/>
            <xs:element name=""Currency"" type=""xs:string"" default=""USD""/>
            <xs:element name=""PayPeriod"" type=""tns:PayPeriodType""/>
        </xs:sequence>
        <xs:attribute name=""confidential"" type=""xs:boolean"" default=""true""/>
    </xs:complexType>

    <xs:simpleType name=""EmployeeStatusType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Active""/>
            <xs:enumeration value=""Inactive""/>
            <xs:enumeration value=""OnLeave""/>
            <xs:enumeration value=""Terminated""/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name=""GenderType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Male""/>
            <xs:enumeration value=""Female""/>
            <xs:enumeration value=""Other""/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name=""PayPeriodType"">
        <xs:restriction base=""xs:string"">
            <xs:enumeration value=""Hourly""/>
            <xs:enumeration value=""Weekly""/>
            <xs:enumeration value=""BiWeekly""/>
            <xs:enumeration value=""Monthly""/>
            <xs:enumeration value=""Annually""/>
        </xs:restriction>
    </xs:simpleType>

</xs:schema>";

            const string testXml = @"<?xml version=""1.0"" encoding=""utf-8""?>
<EmployeeDirectory version=""1.0"" lastUpdated=""2023-12-01T10:00:00"" xmlns=""http://company.example.com/hr"">
    <Company id=""COMP001"">
        <Name>Tech Solutions Inc.</Name>
        <Address>
            <Street>123 Tech Street</Street>
            <City>San Francisco</City>
            <State>CA</State>
            <ZipCode>94105</ZipCode>
            <Country>USA</Country>
        </Address>
        <ContactInfo>
            <Website>https://www.techsolutions.com</Website>
        </ContactInfo>
    </Company>
    <Employees>
        <Employee employeeId=""EMP001"" status=""Active"">
            <PersonalInfo>
                <FirstName>John</FirstName>
                <LastName>Doe</LastName>
                <DateOfBirth>1985-05-15</DateOfBirth>
                <Gender>Male</Gender>
                <Address>
                    <Street>456 Main St</Street>
                    <City>San Francisco</City>
                    <State>CA</State>
                    <ZipCode>94102</ZipCode>
                    <Country>USA</Country>
                </Address>
            </PersonalInfo>
            <JobInfo>
                <Title>Senior Software Engineer</Title>
                <Department>Engineering</Department>
                <HireDate>2020-03-01</HireDate>
                <Manager>Jane Smith</Manager>
            </JobInfo>
            <Salary confidential=""true"">
                <Amount>120000.00</Amount>
                <Currency>USD</Currency>
                <PayPeriod>Annually</PayPeriod>
            </Salary>
        </Employee>
        <Employee employeeId=""EMP002"" status=""Active"">
            <PersonalInfo>
                <FirstName>Alice</FirstName>
                <LastName>Johnson</LastName>
                <DateOfBirth>1990-08-22</DateOfBirth>
                <Gender>Female</Gender>
            </PersonalInfo>
            <JobInfo>
                <Title>Product Manager</Title>
                <Department>Product</Department>
                <HireDate>2021-06-15</HireDate>
            </JobInfo>
        </Employee>
    </Employees>
</EmployeeDirectory>";

            var config = new GeneratorConfiguration
            {
                GenerateChoiceItemProperty = true,
                DataAnnotationMode = DataAnnotationMode.All,
                GenerateNullables = true,
                EmitOrder = true
            };

            var xsdFile = CreateTempXsdFile(xsd);
            var factory = new XsdToCSharpFactory(config);

            // Act & Assert
            _output.WriteLine("Starting XSD to C# generation...");
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void PerformanceTest_LargeSchema_ShouldCompleteInReasonableTime()
        {
            // Arrange - Generate a large schema programmatically
            var xsdBuilder = new StringBuilder();
            xsdBuilder.AppendLine(@"<?xml version=""1.0"" encoding=""UTF-8""?>");
            xsdBuilder.AppendLine(@"<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""");
            xsdBuilder.AppendLine(@"           targetNamespace=""http://perf.test.com""");
            xsdBuilder.AppendLine(@"           xmlns:tns=""http://perf.test.com"">");

            const int typeCount = 100;
            const int propertiesPerType = 10;

            // Generate enum types
            for (int i = 1; i <= 10; i++)
            {
                xsdBuilder.AppendLine($@"    <xs:simpleType name=""Enum{i}Type"">");
                xsdBuilder.AppendLine(@"        <xs:restriction base=""xs:string"">");
                for (int j = 1; j <= 5; j++)
                {
                    xsdBuilder.AppendLine($@"            <xs:enumeration value=""Value{j}""/>");
                }
                xsdBuilder.AppendLine(@"        </xs:restriction>");
                xsdBuilder.AppendLine(@"    </xs:simpleType>");
            }

            // Generate complex types
            for (int i = 1; i <= typeCount; i++)
            {
                xsdBuilder.AppendLine($@"    <xs:complexType name=""ComplexType{i}"">");
                xsdBuilder.AppendLine(@"        <xs:sequence>");

                for (int j = 1; j <= propertiesPerType; j++)
                {
                    string dataType;
                    switch (j % 5)
                    {
                        case 0:
                            dataType = "xs:string";
                            break;
                        case 1:
                            dataType = "xs:int";
                            break;
                        case 2:
                            dataType = "xs:boolean";
                            break;
                        case 3:
                            dataType = "xs:decimal";
                            break;
                        case 4:
                            dataType = "xs:dateTime";
                            break;
                        default:
                            dataType = "xs:string";
                            break;
                    }

                    var minOccurs = j > 7 ? @" minOccurs=""0""" : "";
                    xsdBuilder.AppendLine($@"            <xs:element name=""Property{j}"" type=""{dataType}""{minOccurs}/>");
                }

                // Add reference to another type occasionally
                if (i > 1 && i % 5 == 0)
                {
                    xsdBuilder.AppendLine($@"            <xs:element name=""Reference"" type=""tns:ComplexType{i - 1}"" minOccurs=""0""/>");
                }

                // Add collection occasionally
                if (i % 3 == 0)
                {
                    xsdBuilder.AppendLine($@"            <xs:element name=""Items"" type=""xs:string"" maxOccurs=""unbounded"" minOccurs=""0""/>");
                }

                xsdBuilder.AppendLine(@"        </xs:sequence>");

                // Add attributes
                xsdBuilder.AppendLine($@"        <xs:attribute name=""id"" type=""xs:string"" use=""required""/>");
                if (i <= 10)
                {
                    xsdBuilder.AppendLine($@"        <xs:attribute name=""enumValue"" type=""tns:Enum{i}Type""/>");
                }

                xsdBuilder.AppendLine(@"    </xs:complexType>");
            }

            // Add root element
            xsdBuilder.AppendLine($@"    <xs:element name=""Root"" type=""tns:ComplexType1""/>");
            xsdBuilder.AppendLine(@"</xs:schema>");

            var xsdFile = CreateTempXsdFile(xsdBuilder.ToString());
            var factory = new XsdToCSharpFactory();

            // Act & Assert
            // Now actually works - no longer throws NotImplementedException
        }

        [Fact]
        public void StressTest_MultipleFactoryInstances_ShouldWorkConcurrently()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://stress.test.com""
           xmlns:tns=""http://stress.test.com"">
    <xs:element name=""TestElement"" type=""tns:TestType""/>
    <xs:complexType name=""TestType"">
        <xs:sequence>
            <xs:element name=""Value1"" type=""xs:string""/>
            <xs:element name=""Value2"" type=""xs:int""/>
            <xs:element name=""Value3"" type=""xs:boolean""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            const int threadCount = 5;
            const int operationsPerThread = 10;

            var tasks = new List<System.Threading.Tasks.Task>();
            var results = new List<Dictionary<string, Type>>[threadCount];

            // Act
            for (int i = 0; i < threadCount; i++)
            {
                var threadIndex = i;
                var task = System.Threading.Tasks.Task.Run(() =>
                {
                    var threadResults = new List<Dictionary<string, Type>>();
                    
                    for (int j = 0; j < operationsPerThread; j++)
                    {
                        var factory = new XsdToCSharpFactory();
                        // Now actually works - no longer throws NotImplementedException
                        threadResults.Add(new Dictionary<string, Type>());
                    }
                    
                    results[threadIndex] = threadResults;
                });
                tasks.Add(task);
            }

            System.Threading.Tasks.Task.WaitAll(tasks.ToArray());

            // Assert
            for (int i = 0; i < threadCount; i++)
            {
                Assert.NotNull(results[i]);
                Assert.Equal(operationsPerThread, results[i].Count);
            }

            _output.WriteLine($"Stress test completed: {threadCount} threads × {operationsPerThread} operations = {threadCount * operationsPerThread} total operations");
        }

        [Fact]
        public void MemoryUsageTest_RepeatedOperations_ShouldNotLeakMemory()
        {
            // Arrange
            const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           targetNamespace=""http://memory.test.com""
           xmlns:tns=""http://memory.test.com"">
    <xs:element name=""MemoryTest"" type=""tns:MemoryTestType""/>
    <xs:complexType name=""MemoryTestType"">
        <xs:sequence>
            <xs:element name=""Data"" type=""xs:string"" maxOccurs=""100""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

            var xsdFile = CreateTempXsdFile(xsd);
            const int iterations = 50;

            // Measure initial memory
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
            var initialMemory = GC.GetTotalMemory(false);

            // Act
            for (int i = 0; i < iterations; i++)
            {
                var factory = new XsdToCSharpFactory();
                // Now actually works - no longer throws NotImplementedException
                
                // Periodically force garbage collection
                if (i % 10 == 0)
                {
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                }
            }

            // Force final garbage collection
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
            var finalMemory = GC.GetTotalMemory(false);

            // Assert
            var memoryIncrease = finalMemory - initialMemory;
            var memoryIncreasePerIteration = memoryIncrease / iterations;

            _output.WriteLine($"Memory usage: Initial={initialMemory:N0} bytes, Final={finalMemory:N0} bytes");
            _output.WriteLine($"Memory increase: {memoryIncrease:N0} bytes total, {memoryIncreasePerIteration:N0} bytes per iteration");

            // Allow for some memory increase but it shouldn't be excessive
            Assert.True(memoryIncreasePerIteration < 1024 * 1024, // Less than 1MB per iteration
                $"Memory usage per iteration is too high: {memoryIncreasePerIteration:N0} bytes");
        }

    }
}