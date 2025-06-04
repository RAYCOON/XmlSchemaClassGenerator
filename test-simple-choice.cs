using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using XmlSchemaClassGenerator;

public class TestSimpleChoice 
{
    public static void Main()
    {
        const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""Person"" type=""PersonType""/>
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

        var writer = new FileOutputWriter("test-output");
        generator.OutputWriter = writer;
        
        try 
        {
            generator.Generate(schemaSet);
            Console.WriteLine("Generated successfully!");
            
            // Read the output
            var outputFile = Path.Combine("test-output", "Test.cs");
            if (File.Exists(outputFile))
            {
                Console.WriteLine(File.ReadAllText(outputFile));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex}");
        }
    }
}