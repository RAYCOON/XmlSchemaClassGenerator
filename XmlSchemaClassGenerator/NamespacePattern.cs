using System.Collections.Generic;

namespace XmlSchemaClassGenerator;

/// <summary>
/// Represents a regex pattern for matching and transforming namespaces
/// </summary>
public class NamespacePattern
{
    /// <summary>
    /// The source to match against. Can be "XmlNamespace" or "Filename".
    /// </summary>
    public string Source { get; set; } = "XmlNamespace";

    /// <summary>
    /// The regex pattern to match against. Can include named capture groups.
    /// </summary>
    public string Pattern { get; set; }

    /// <summary>
    /// The template to use for generating the namespace. Can include placeholders matching capture group names.
    /// </summary>
    public string Template { get; set; }

    /// <summary>
    /// Optional transformations to apply to captured groups before substitution.
    /// Key is the capture group name, value is the transformation type.
    /// </summary>
    public Dictionary<string, string> Transforms { get; set; } = new Dictionary<string, string>();

    /// <summary>
    /// Priority for this pattern. Lower values are checked first.
    /// </summary>
    public int Priority { get; set; } = 100;

    public NamespacePattern() { }

    public NamespacePattern(string pattern, string template)
    {
        Pattern = pattern;
        Template = template;
    }
}

/// <summary>
/// Represents a pattern for generating output filenames
/// </summary>
public class OutputFilenamePattern
{
    /// <summary>
    /// The regex pattern to match against the generated C# namespace. Can include named capture groups.
    /// </summary>
    public string Pattern { get; set; }

    /// <summary>
    /// The template to use for generating the output filename (without extension). Can include placeholders matching capture group names.
    /// </summary>
    public string Template { get; set; }

    /// <summary>
    /// Optional transformations to apply to captured groups before substitution.
    /// Key is the capture group name, value is the transformation type.
    /// </summary>
    public Dictionary<string, string> Transforms { get; set; } = new Dictionary<string, string>();

    /// <summary>
    /// Priority for this pattern. Lower values are checked first.
    /// </summary>
    public int Priority { get; set; } = 100;

    public OutputFilenamePattern() { }

    public OutputFilenamePattern(string pattern, string template)
    {
        Pattern = pattern;
        Template = template;
    }
}

/// <summary>
/// Available transformation types for captured values
/// </summary>
public static class PatternTransformations
{
    public const string DotsToUnderscores = "dots_to_underscores";
    public const string UnderscoresToDots = "underscores_to_dots";
    public const string Uppercase = "uppercase";
    public const string Lowercase = "lowercase";
    public const string TitleCase = "titlecase";
    public const string RemoveHyphens = "remove_hyphens";
}

/// <summary>
/// Default namespace generation strategies when no pattern matches
/// </summary>
public enum DefaultNamespaceStrategy
{
    /// <summary>
    /// Auto-generate from XML namespace (current default behavior)
    /// </summary>
    AutoGenerate,
    
    /// <summary>
    /// Use filename as basis for namespace
    /// </summary>
    UseFilename,
    
    /// <summary>
    /// Use last segment of XML namespace
    /// </summary>
    UseXmlNamespace,
    
    /// <summary>
    /// Throw exception if no mapping found (original strict behavior)
    /// </summary>
    ThrowException,
    
    /// <summary>
    /// Use the DefaultNamespaceTemplate
    /// </summary>
    UseTemplate
}

/// <summary>
/// Default output filename generation strategies when no pattern matches
/// </summary>
public enum DefaultOutputFilenameStrategy
{
    /// <summary>
    /// Use the namespace as filename (default behavior)
    /// </summary>
    UseNamespace,
    
    /// <summary>
    /// Use the original source filename (without path and extension)
    /// </summary>
    UseSourceFilename,
    
    /// <summary>
    /// Use a custom template
    /// </summary>
    UseTemplate
}