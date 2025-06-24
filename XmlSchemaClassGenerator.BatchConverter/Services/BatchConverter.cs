using Spectre.Console;
using XmlSchemaClassGenerator.BatchConverter.Models;
using XmlSchemaClassGenerator.NamingProviders;

namespace XmlSchemaClassGenerator.BatchConverter.Services;

public class BatchConverterService
{
    private readonly BatchConfiguration _configuration;

    public BatchConverterService(BatchConfiguration configuration)
    {
        _configuration = configuration;
    }

    public async Task<BatchResult> ConvertAsync()
    {
        var result = new BatchResult();
        var enabledSchemas = _configuration.Schemas.Where(s => s.Enabled).ToList();

        await AnsiConsole.Progress()
            .AutoClear(false)
            .Columns(new ProgressColumn[]
            {
                new TaskDescriptionColumn(),
                new ProgressBarColumn(),
                new PercentageColumn(),
                new RemainingTimeColumn(),
                new SpinnerColumn(),
            })
            .StartAsync(async ctx =>
            {
                var task = ctx.AddTask($"[green]Converting {enabledSchemas.Count} schemas[/]", maxValue: enabledSchemas.Count);

                foreach (var schema in enabledSchemas)
                {
                    task.Description = $"[yellow]Converting: {schema.Name}[/]";
                    
                    try
                    {
                        var schemaResult = await ConvertSchemaAsync(schema);
                        result.SchemaResults.Add(schemaResult);

                        if (schemaResult.Success)
                        {
                            AnsiConsole.MarkupLine($"[green]✓[/] {schema.Name}");
                        }
                        else
                        {
                            AnsiConsole.MarkupLine($"[red]✗[/] {schema.Name}: {schemaResult.Error}");
                        }
                    }
                    catch (Exception ex)
                    {
                        result.SchemaResults.Add(new SchemaResult
                        {
                            SchemaName = schema.Name,
                            Success = false,
                            Error = ex.Message
                        });
                        AnsiConsole.MarkupLine($"[red]✗[/] {schema.Name}: {ex.Message}");
                    }

                    task.Increment(1);
                }

                task.Description = "[green]Conversion complete![/]";
            });

        return result;
    }

    private Task<SchemaResult> ConvertSchemaAsync(SchemaConfiguration schema)
    {
        return Task.Run(() =>
        {
            var result = new SchemaResult { SchemaName = schema.Name };

            try
            {
                var generator = CreateGenerator(schema);
                var outputPath = GetOutputPath(schema);

                if (!Directory.Exists(outputPath))
                {
                    Directory.CreateDirectory(outputPath);
                }

                generator.OutputFolder = outputPath;
                
                var startTime = DateTime.Now;
                // Handle wildcards in source path
                var sourcePaths = new List<string>();
                if (schema.SourcePath.Contains("*"))
                {
                    var dir = Path.GetDirectoryName(schema.SourcePath) ?? ".";
                    var pattern = Path.GetFileName(schema.SourcePath);
                    sourcePaths.AddRange(Directory.GetFiles(dir, pattern));
                }
                else
                {
                    sourcePaths.Add(schema.SourcePath);
                }
                
                generator.Generate(sourcePaths.ToArray());
                var duration = DateTime.Now - startTime;

                result.Success = !generator.ValidationError;
                result.Duration = duration;
                result.OutputPath = outputPath;

                if (generator.ValidationError)
                {
                    result.Error = "Validation errors occurred during generation";
                }
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Error = ex.Message;
            }

            return result;
        });
    }

    private Generator CreateGenerator(SchemaConfiguration schema)
    {
        var settings = schema.Settings ?? _configuration.GlobalSettings;
        var generator = new Generator();

        // Apply global settings
        ApplySettings(generator, _configuration.GlobalSettings);

        // Override with schema-specific settings if provided
        if (schema.Settings != null)
        {
            ApplySettings(generator, schema.Settings);
        }

        // Set up namespace mappings
        var namespaces = new List<string>();
        foreach (var mapping in settings.NamespaceMappings)
        {
            namespaces.Add($"{mapping.XmlNamespace}={mapping.CSharpNamespace}");
        }

        if (namespaces.Any() || !string.IsNullOrEmpty(settings.NamespacePrefix))
        {
            generator.NamespaceProvider = namespaces
                .Select(n => CodeUtilities.ParseNamespace(n, settings.NamespacePrefix))
                .ToNamespaceProvider(key =>
                {
                    var xn = key.XmlSchemaNamespace;
                    var name = string.Join(".", xn.Split('/').Where(p => p != "schema" && GeneratorConfiguration.IdentifierRegex.IsMatch(p))
                        .Select(n => n.ToTitleCase(NamingScheme.PascalCase)));
                    if (!string.IsNullOrEmpty(settings.NamespacePrefix)) 
                    { 
                        name = settings.NamespacePrefix + (string.IsNullOrEmpty(name) ? "" : ("." + name)); 
                    }
                    return name;
                });
        }

        return generator;
    }

    private void ApplySettings(Generator generator, GlobalSettings settings)
    {
        generator.GenerateNullables = settings.GenerateNullables;
        generator.EnableDataBinding = settings.EnableDataBinding;
        generator.GenerateInterfaces = settings.GenerateInterfaces;
        generator.NamingScheme = settings.UsePascalCase ? NamingScheme.PascalCase : NamingScheme.Direct;
        generator.SeparateClasses = settings.SeparateFiles;
        generator.SeparateNamespaceHierarchy = settings.SeparateNamespaceHierarchy;
        generator.GenerateDescriptionAttribute = settings.GenerateDescriptionAttribute;
        generator.UniqueTypeNamesAcrossNamespaces = settings.UniqueTypeNames;
        generator.UseShouldSerializePattern = settings.UseShouldSerializePattern;
        generator.EnumAsString = settings.EnumAsString;

        if (!string.IsNullOrEmpty(settings.CollectionType))
        {
            generator.CollectionType = Type.GetType(settings.CollectionType) ?? typeof(System.Collections.Generic.List<>);
        }

        generator.CollectionSettersMode = settings.CollectionSettersMode switch
        {
            "Private" => CollectionSettersMode.Private,
            "Public" => CollectionSettersMode.Public,
            "PublicWithoutConstructorInitialization" => CollectionSettersMode.PublicWithoutConstructorInitialization,
            "Init" => CollectionSettersMode.Init,
            "InitWithoutConstructorInitialization" => CollectionSettersMode.InitWithoutConstructorInitialization,
            _ => CollectionSettersMode.Public
        };

        if (settings is SchemaSettings schemaSettings)
        {
            if (schemaSettings.SeparateSubstitutes.HasValue)
                generator.SeparateSubstitutes = schemaSettings.SeparateSubstitutes.Value;
        }
    }

    private string GetOutputPath(SchemaConfiguration schema)
    {
        var baseOutput = Path.GetFullPath(_configuration.OutputDirectory);
        
        if (!string.IsNullOrEmpty(schema.OutputSubDirectory))
        {
            return Path.Combine(baseOutput, schema.OutputSubDirectory);
        }

        return Path.Combine(baseOutput, Path.GetFileNameWithoutExtension(schema.SourcePath));
    }
}

public class BatchResult
{
    public List<SchemaResult> SchemaResults { get; set; } = new();
    public int SuccessCount => SchemaResults.Count(r => r.Success);
    public int FailureCount => SchemaResults.Count(r => !r.Success);
    public TimeSpan TotalDuration => TimeSpan.FromMilliseconds(SchemaResults.Sum(r => r.Duration.TotalMilliseconds));
}

public class SchemaResult
{
    public string SchemaName { get; set; } = "";
    public bool Success { get; set; }
    public string? Error { get; set; }
    public TimeSpan Duration { get; set; }
    public string? OutputPath { get; set; }
}