namespace XmlSchemaClassGenerator;

/// <summary>
/// Represents a regex transformation to apply when generating namespaces from filenames.
/// </summary>
public class NamespaceTransform
{
    /// <summary>
    /// The regex pattern to match against.
    /// </summary>
    public string Pattern { get; set; }

    /// <summary>
    /// The replacement string. Can include regex replacement patterns like $1, $2, etc.
    /// </summary>
    public string Replacement { get; set; }

    /// <summary>
    /// Creates a new NamespaceTransform.
    /// </summary>
    public NamespaceTransform() { }

    /// <summary>
    /// Creates a new NamespaceTransform with the specified pattern and replacement.
    /// </summary>
    public NamespaceTransform(string pattern, string replacement)
    {
        Pattern = pattern;
        Replacement = replacement;
    }
}