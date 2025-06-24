using System.Text.Json;
using XmlSchemaClassGenerator.BatchConverter.Models;

public class GenerateNaeConfig
{
    public static void MainDisabled()
    {
        var schemasDir = "schemas/NAE";
        var xsdFiles = Directory.GetFiles(schemasDir, "*.xsd")
            .Select(Path.GetFileName)
            .OrderBy(f => f)
            .ToList();

        System.Console.WriteLine($"Found {xsdFiles.Count} XSD files in {schemasDir}");

        var config = new BatchConfiguration
        {
            Name = "NAE 4.4.1/6.0.1 RC1 Complete Schema Conversion",
            OutputDirectory = "./output/NAE",
            GlobalSettings = new GlobalSettings
            {
                NamespacePrefix = "NAE",
                GenerateNullables = true,
                EnableDataBinding = false,
                GenerateInterfaces = true,
                UsePascalCase = true,
                SeparateFiles = true,
                SeparateNamespaceHierarchy = true,
                CollectionType = "System.Collections.Generic.List<>",
                CollectionSettersMode = "Public",
                GenerateDescriptionAttribute = true,
                UniqueTypeNames = true, // Important for large schema sets
                UseShouldSerializePattern = false,
                EnumAsString = false,
                NamespaceMappings = new List<NamespaceMapping>
                {
                    // Add common NAE namespaces here if known
                    new() { XmlNamespace = "", CSharpNamespace = "NAE.Common" }
                }
            },
            Schemas = new List<SchemaConfiguration>()
        };

        // Group schemas by prefix for better organization
        var groupedSchemas = xsdFiles
            .GroupBy(f => GetSchemaGroup(f))
            .OrderBy(g => g.Key);

        foreach (var group in groupedSchemas)
        {
            foreach (var xsdFile in group.OrderBy(f => f))
            {
                var schemaName = Path.GetFileNameWithoutExtension(xsdFile);
                config.Schemas.Add(new SchemaConfiguration
                {
                    Name = schemaName,
                    SourcePath = $"{schemasDir}/{xsdFile}",
                    OutputSubDirectory = group.Key,
                    Enabled = true,
                    Settings = IsComplexSchema(xsdFile) ? new SchemaSettings
                    {
                        SeparateSubstitutes = true,
                        UseShouldSerializePattern = true
                    } : null
                });
            }
        }

        // Save configuration
        var options = new JsonSerializerOptions
        {
            WriteIndented = true
        };
        var json = JsonSerializer.Serialize(config, options);
        File.WriteAllText("nae-batch-config.json", json);

        System.Console.WriteLine($"Configuration saved to nae-batch-config.json");
        System.Console.WriteLine($"Total schemas configured: {config.Schemas.Count}");
        System.Console.WriteLine($"Groups: {string.Join(", ", groupedSchemas.Select(g => $"{g.Key} ({g.Count()})"))}");
    }

    private static string GetSchemaGroup(string fileName)
    {
        // Group by common prefixes
        if (fileName.StartsWith("GKV_BUC_")) return "GKV_BUC";
        if (fileName.StartsWith("H")) return "H_Messages";
        if (fileName.StartsWith("X")) return "X_Messages";
        if (fileName.StartsWith("A")) return "A_Messages";
        if (fileName.StartsWith("R")) return "R_Messages";
        if (fileName.StartsWith("S")) return "S_Messages";
        if (fileName.Contains("Types")) return "Types";
        if (fileName.Contains("CC-")) return "CommonComponents";
        return "Other";
    }

    private static bool IsComplexSchema(string fileName)
    {
        // Schemas that likely contain choices or complex structures
        return fileName.Contains("BUC") || 
               fileName.Contains("Message") || 
               fileName.Contains("Types");
    }
}