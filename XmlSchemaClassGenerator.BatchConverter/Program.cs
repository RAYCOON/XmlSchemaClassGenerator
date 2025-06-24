using Microsoft.Extensions.Configuration;
using Spectre.Console;
using System.Text.Json;
using XmlSchemaClassGenerator.BatchConverter.Models;
using XmlSchemaClassGenerator.BatchConverter.Services;

namespace XmlSchemaClassGenerator.BatchConverter;

class Program
{
    static async Task<int> Main(string[] args)
    {
        try
        {
            AnsiConsole.Write(new FigletText("XSD Batch Converter").Color(Color.Blue));

            var configFile = args.FirstOrDefault() ?? "batch-config.json";

            if (!File.Exists(configFile))
            {
                AnsiConsole.MarkupLine($"[red]Configuration file not found:[/] {configFile}");
                AnsiConsole.MarkupLine("[yellow]Creating example configuration file...[/]");
                CreateExampleConfig(configFile);
                return 1;
            }

            var configuration = LoadConfiguration(configFile);
            
            AnsiConsole.MarkupLine($"[blue]Loaded configuration:[/] {configuration.Name}");
            AnsiConsole.MarkupLine($"[blue]Output directory:[/] {configuration.OutputDirectory}");
            AnsiConsole.MarkupLine($"[blue]Schemas to convert:[/] {configuration.Schemas.Count(s => s.Enabled)}");
            AnsiConsole.WriteLine();

            var converter = new BatchConverterService(configuration);
            var result = await converter.ConvertAsync();

            AnsiConsole.WriteLine();
            DisplayResults(result);

            return result.FailureCount > 0 ? 1 : 0;
        }
        catch (Exception ex)
        {
            AnsiConsole.WriteException(ex);
            return 1;
        }
    }

    static BatchConfiguration LoadConfiguration(string configFile)
    {
        var json = File.ReadAllText(configFile);
        var options = new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true,
            ReadCommentHandling = JsonCommentHandling.Skip
        };
        
        return JsonSerializer.Deserialize<BatchConfiguration>(json, options) 
            ?? throw new InvalidOperationException("Failed to load configuration");
    }

    static void CreateExampleConfig(string fileName)
    {
        var example = new BatchConfiguration
        {
            Name = "Example XSD Batch Conversion",
            OutputDirectory = "./output",
            GlobalSettings = new GlobalSettings
            {
                NamespacePrefix = "MyCompany",
                GenerateNullables = true,
                EnableDataBinding = true,
                GenerateInterfaces = true,
                UsePascalCase = true,
                SeparateFiles = true,
                CollectionType = "System.Collections.Generic.List<>",
                CollectionSettersMode = "Public",
                GenerateDescriptionAttribute = true,
                NamespaceMappings = new List<NamespaceMapping>
                {
                    new() { XmlNamespace = "http://example.com/schema1", CSharpNamespace = "MyCompany.Schema1" },
                    new() { XmlNamespace = "http://example.com/schema2", CSharpNamespace = "MyCompany.Schema2" },
                    new() { XmlNamespace = "", CSharpNamespace = "MyCompany.DefaultNamespace" }
                }
            },
            Schemas = new List<SchemaConfiguration>
            {
                new()
                {
                    Name = "Customer Schema",
                    SourcePath = "schemas/customer.xsd",
                    OutputSubDirectory = "Customer",
                    Enabled = true
                },
                new()
                {
                    Name = "Order Schema with Choices",
                    SourcePath = "schemas/order.xsd",
                    OutputSubDirectory = "Order",
                    Settings = new SchemaSettings
                    {
                        SeparateSubstitutes = true,
                        UseShouldSerializePattern = true,
                        HandleChoicesAsSequence = true
                    },
                    Enabled = true
                },
                new()
                {
                    Name = "Product Schema (Disabled)",
                    SourcePath = "schemas/product.xsd",
                    Enabled = false
                }
            }
        };

        var options = new JsonSerializerOptions
        {
            WriteIndented = true
        };

        var json = JsonSerializer.Serialize(example, options);
        File.WriteAllText(fileName, json);

        AnsiConsole.MarkupLine($"[green]Created example configuration file:[/] {fileName}");
        AnsiConsole.MarkupLine("[yellow]Please edit this file with your XSD paths and run again.[/]");
    }

    static void DisplayResults(BatchResult result)
    {
        var table = new Table();
        table.AddColumn("Schema");
        table.AddColumn("Status");
        table.AddColumn("Duration");
        table.AddColumn("Output");

        foreach (var schemaResult in result.SchemaResults)
        {
            var status = schemaResult.Success 
                ? "[green]Success[/]" 
                : $"[red]Failed: {schemaResult.Error}[/]";
            
            table.AddRow(
                schemaResult.SchemaName,
                status,
                schemaResult.Duration.TotalSeconds.ToString("F2") + "s",
                schemaResult.OutputPath ?? "-"
            );
        }

        AnsiConsole.Write(table);

        AnsiConsole.WriteLine();
        AnsiConsole.MarkupLine($"[blue]Total schemas:[/] {result.SchemaResults.Count}");
        AnsiConsole.MarkupLine($"[green]Successful:[/] {result.SuccessCount}");
        AnsiConsole.MarkupLine($"[red]Failed:[/] {result.FailureCount}");
        AnsiConsole.MarkupLine($"[blue]Total duration:[/] {result.TotalDuration.TotalSeconds:F2}s");
    }
}