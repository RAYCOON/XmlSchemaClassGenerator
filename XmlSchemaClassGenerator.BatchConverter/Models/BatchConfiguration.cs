namespace XmlSchemaClassGenerator.BatchConverter.Models;

public class BatchConfiguration
{
    public string Name { get; set; } = "Default Batch";
    public string OutputDirectory { get; set; } = "./generated";
    public GlobalSettings GlobalSettings { get; set; } = new();
    public List<SchemaConfiguration> Schemas { get; set; } = new();
}

public class GlobalSettings
{
    public string? NamespacePrefix { get; set; }
    public bool GenerateNullables { get; set; } = true;
    public bool EnableDataBinding { get; set; } = false;
    public bool GenerateInterfaces { get; set; } = true;
    public bool UsePascalCase { get; set; } = true;
    public bool SeparateFiles { get; set; } = true;
    public bool SeparateNamespaceHierarchy { get; set; } = false;
    public string CollectionType { get; set; } = "System.Collections.Generic.List<>";
    public string CollectionSettersMode { get; set; } = "Public";
    public bool GenerateDescriptionAttribute { get; set; } = true;
    public bool UniqueTypeNames { get; set; } = false;
    public bool UseShouldSerializePattern { get; set; } = false;
    public bool EnumAsString { get; set; } = false;
    public List<NamespaceMapping> NamespaceMappings { get; set; } = new();
}

public class NamespaceMapping
{
    public string XmlNamespace { get; set; } = "";
    public string CSharpNamespace { get; set; } = "";
}

public class SchemaConfiguration
{
    public string Name { get; set; } = "";
    public string SourcePath { get; set; } = "";
    public string? OutputSubDirectory { get; set; }
    public SchemaSettings? Settings { get; set; }
    public bool Enabled { get; set; } = true;
}

public class SchemaSettings : GlobalSettings
{
    public bool? SeparateSubstitutes { get; set; }
    public bool? HandleChoicesAsSequence { get; set; }
}