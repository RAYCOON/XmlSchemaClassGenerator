using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Schema;
using Xunit;

namespace XmlSchemaClassGenerator.Tests;

public class ChoiceTests
{
    [Fact]
    public void TestSimpleChoice()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
        xmlns=""test_generation_namespace/common.xsd""        
        targetNamespace=""test_generation_namespace/common.xsd"">

    <!-- Wurzelelement -->
    <xs:element name=""Person"" type=""PersonType""/>

    <!-- Komplexer Typ mit Name und Wahl zwischen Telefon oder E-Mail -->
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Vorname"" type=""xs:string""/>
            <xs:element name=""Nachname"" type=""xs:string""/>
            <xs:choice>
                <xs:element name=""Telefon"" type=""xs:string""/>
                <xs:element name=""Email"" type=""xs:string""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

        var schema = XmlSchema.Read(new StringReader(xsd), null);
        var schemaSet = new XmlSchemaSet();
        schemaSet.Add(schema);

        var generator = new Generator
        {
            GenerateChoiceItemProperty = true,
            NamespaceProvider = new NamespaceProvider
            {
                GenerateNamespace = key => "Test"
            }
        };

        var output = new MemoryOutputWriter();
        generator.OutputWriter = output;
        generator.Generate(schemaSet);

        var content = output.Content.First();

        // Verify that choice properties are generated
        Assert.Contains("public object Item { get; set; }", content);
        Assert.Contains("public PersonTypeItemChoiceType ItemElementName { get; set; }", content);
        
        // Verify enum is generated
        Assert.Contains("public enum PersonTypeItemChoiceType", content);
        Assert.Contains("Telefon", content);
        Assert.Contains("Email", content);
        
        // Verify XmlChoiceIdentifier attribute
        Assert.Contains("XmlChoiceIdentifierAttribute", content);
        
        // Verify XmlElement attributes for choice elements
        Assert.Contains(@"[System.Xml.Serialization.XmlElementAttribute(""Telefon"", Type=typeof(string))]", content);
        Assert.Contains(@"[System.Xml.Serialization.XmlElementAttribute(""Email"", Type=typeof(string))]", content);
    }

    [Fact]
    public void TestChoiceDisabled()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""Container"" type=""ContainerType""/>
    <xs:complexType name=""ContainerType"">
        <xs:sequence>
            <xs:choice>
                <xs:element name=""Option1"" type=""xs:string""/>
                <xs:element name=""Option2"" type=""xs:int""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

        var schema = XmlSchema.Read(new StringReader(xsd), null);
        var schemaSet = new XmlSchemaSet();
        schemaSet.Add(schema);

        var generator = new Generator
        {
            GenerateChoiceItemProperty = false, // Disabled
            NamespaceProvider = new NamespaceProvider
            {
                GenerateNamespace = key => "Test"
            }
        };

        var output = new MemoryOutputWriter();
        generator.OutputWriter = output;
        generator.Generate(schemaSet);

        var content = output.Content.First();

        // When disabled, individual properties should be generated
        Assert.Contains("Option1", content);
        Assert.Contains("Option2", content);
        
        // No Item property or enum should be generated
        Assert.DoesNotContain("public object Item", content);
        Assert.DoesNotContain("ItemChoiceType", content);
        Assert.DoesNotContain("ItemElementName", content);
    }

    [Fact]
    public void TestMultipleChoices()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""Data"" type=""DataType""/>
    <xs:complexType name=""DataType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:choice>
                <xs:element name=""StringValue"" type=""xs:string""/>
                <xs:element name=""IntValue"" type=""xs:int""/>
                <xs:element name=""BoolValue"" type=""xs:boolean""/>
            </xs:choice>
            <xs:element name=""Description"" type=""xs:string"" minOccurs=""0""/>
            <xs:choice minOccurs=""0"">
                <xs:element name=""CreatedDate"" type=""xs:date""/>
                <xs:element name=""ModifiedDate"" type=""xs:date""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

        var schema = XmlSchema.Read(new StringReader(xsd), null);
        var schemaSet = new XmlSchemaSet();
        schemaSet.Add(schema);

        var generator = new Generator
        {
            GenerateChoiceItemProperty = true,
            NamespaceProvider = new NamespaceProvider
            {
                GenerateNamespace = key => "Test"
            }
        };

        var output = new MemoryOutputWriter();
        generator.OutputWriter = output;
        generator.Generate(schemaSet);

        var content = output.Content.First();

        // First choice
        Assert.Contains("public object Item { get; set; }", content);
        Assert.Contains("public DataTypeItemChoiceType ItemElementName { get; set; }", content);
        
        // Second choice
        Assert.Contains("public object Item1 { get; set; }", content);
        Assert.Contains("public DataTypeItemChoiceType1 Item1ElementName { get; set; }", content);
        
        // Verify enums
        Assert.Contains("public enum DataTypeItemChoiceType", content);
        Assert.Contains("StringValue", content);
        Assert.Contains("IntValue", content);
        Assert.Contains("BoolValue", content);
        
        Assert.Contains("public enum DataTypeItemChoiceType1", content);
        Assert.Contains("CreatedDate", content);
        Assert.Contains("ModifiedDate", content);
    }

    [Fact]
    public void TestChoiceWithComplexTypes()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""Message"" type=""MessageType""/>
    
    <xs:complexType name=""MessageType"">
        <xs:sequence>
            <xs:element name=""Id"" type=""xs:string""/>
            <xs:choice>
                <xs:element name=""TextContent"" type=""TextType""/>
                <xs:element name=""BinaryContent"" type=""BinaryType""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""TextType"">
        <xs:sequence>
            <xs:element name=""Text"" type=""xs:string""/>
            <xs:element name=""Language"" type=""xs:string"" minOccurs=""0""/>
        </xs:sequence>
    </xs:complexType>
    
    <xs:complexType name=""BinaryType"">
        <xs:sequence>
            <xs:element name=""Data"" type=""xs:base64Binary""/>
            <xs:element name=""MimeType"" type=""xs:string""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

        var schema = XmlSchema.Read(new StringReader(xsd), null);
        var schemaSet = new XmlSchemaSet();
        schemaSet.Add(schema);

        var generator = new Generator
        {
            GenerateChoiceItemProperty = true,
            NamespaceProvider = new NamespaceProvider
            {
                GenerateNamespace = key => "Test"
            }
        };

        var output = new MemoryOutputWriter();
        generator.OutputWriter = output;
        generator.Generate(schemaSet);

        var content = output.Content.First();

        // Verify choice with complex types
        Assert.Contains("public object Item { get; set; }", content);
        Assert.Contains("public MessageTypeItemChoiceType ItemElementName { get; set; }", content);
        
        // Verify XmlElement attributes reference the correct types (may have different names due to uniqueness)
        Assert.Contains(@"[System.Xml.Serialization.XmlElementAttribute(""TextContent"", Type=typeof(", content);
        Assert.Contains(@"[System.Xml.Serialization.XmlElementAttribute(""BinaryContent"", Type=typeof(", content);
        
        // Verify complex types are generated (either as original names or with Item suffix)
        Assert.True(content.Contains("public partial class TextType") || content.Contains("public partial class TextTypeItem"));
        Assert.True(content.Contains("public partial class BinaryType") || content.Contains("public partial class BinaryTypeItem"));
    }

    [Fact]
    public void TestChoiceWithNamespaces()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
           xmlns:tns=""http://example.com/test""
           targetNamespace=""http://example.com/test"">
           
    <xs:element name=""Container"" type=""tns:ContainerType""/>
    
    <xs:complexType name=""ContainerType"">
        <xs:sequence>
            <xs:choice>
                <xs:element name=""LocalElement"" type=""xs:string""/>
                <xs:element ref=""tns:GlobalElement""/>
            </xs:choice>
        </xs:sequence>
    </xs:complexType>
    
    <xs:element name=""GlobalElement"" type=""xs:int""/>
</xs:schema>";

        var schema = XmlSchema.Read(new StringReader(xsd), null);
        var schemaSet = new XmlSchemaSet();
        schemaSet.Add(schema);

        var generator = new Generator
        {
            GenerateChoiceItemProperty = true,
            NamespaceProvider = new NamespaceProvider
            {
                GenerateNamespace = key => "Test.Example"
            }
        };

        var output = new MemoryOutputWriter();
        generator.OutputWriter = output;
        generator.Generate(schemaSet);

        var content = output.Content.First();

        // Verify namespace handling
        Assert.Contains("namespace Test.Example", content);
        
        // Verify XmlElement attributes include namespace
        Assert.Contains(@"Namespace=""http://example.com/test""", content);
    }
}