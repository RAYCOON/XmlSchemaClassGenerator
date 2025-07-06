using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace XmlSchemaClassGenerator;

/// <summary>
/// A namespace provider that uses regex patterns to generate namespaces from XML namespaces or filenames
/// </summary>
public class PatternBasedNamespaceProvider : NamespaceProvider
{
    /// <summary>
    /// Patterns to match against XML namespaces or filenames for namespace generation
    /// </summary>
    public List<NamespacePattern> NamespacePatterns { get; set; } = new List<NamespacePattern>();

    /// <summary>
    /// Template to use when DefaultStrategy is UseTemplate
    /// </summary>
    public string DefaultNamespaceTemplate { get; set; } = "Generated.{filename}";

    /// <summary>
    /// Strategy to use when no pattern matches
    /// </summary>
    public DefaultNamespaceStrategy DefaultStrategy { get; set; } = DefaultNamespaceStrategy.AutoGenerate;

    /// <summary>
    /// The configuration for auto-generation fallback
    /// </summary>
    private readonly GeneratorConfiguration _configuration;

    public PatternBasedNamespaceProvider(GeneratorConfiguration configuration)
    {
        _configuration = configuration;
    }

    protected override string OnGenerateNamespace(NamespaceKey key)
    {
        // Try all patterns in priority order
        foreach (var pattern in NamespacePatterns.OrderBy(p => p.Priority))
        {
            string input = null;
            
            // Get the input based on the pattern source
            if (pattern.Source?.Equals("Filename", StringComparison.OrdinalIgnoreCase) == true && key.Source != null)
            {
                input = GetFilenameWithoutExtension(key.Source);
            }
            else if (pattern.Source?.Equals("XmlNamespace", StringComparison.OrdinalIgnoreCase) == true && !string.IsNullOrEmpty(key.XmlSchemaNamespace))
            {
                input = key.XmlSchemaNamespace;
            }
            
            if (!string.IsNullOrEmpty(input))
            {
                var result = TryMatchPattern(input, pattern);
                if (!string.IsNullOrEmpty(result))
                    return result;
            }
        }

        // Apply default strategy
        return ApplyDefaultStrategy(key);
    }

    private string TryMatchPattern(string input, NamespacePattern pattern)
    {
        try
        {
            var regex = new Regex(pattern.Pattern);
            var match = regex.Match(input);
            
            if (match.Success)
            {
                var result = pattern.Template;
                
                // Replace numeric placeholders first
                for (int i = 1; i < match.Groups.Count; i++)
                {
                    var value = match.Groups[i].Value;
                    
                    // Check if there's a transformation for numeric group
                    if (pattern.Transforms != null && pattern.Transforms.ContainsKey((i - 1).ToString()))
                    {
                        value = ApplyTransformation(value, pattern.Transforms[(i - 1).ToString()]);
                    }
                    
                    result = result.Replace($"{{{i - 1}}}", value);
                }
                
                // Then replace named groups (which might override numeric ones)
                var groupNames = regex.GetGroupNames();
                foreach (var groupName in groupNames)
                {
                    // Skip numeric group names and the whole match group "0"
                    if (!string.IsNullOrEmpty(groupName) && groupName != "0" && !int.TryParse(groupName, out _))
                    {
                        var group = match.Groups[groupName];
                        if (group.Success)
                        {
                            var value = group.Value;
                            
                            // Apply transformations if specified
                            if (pattern.Transforms != null && pattern.Transforms.ContainsKey(groupName))
                            {
                                value = ApplyTransformation(value, pattern.Transforms[groupName]);
                            }
                            
                            result = result.Replace($"{{{groupName}}}", value);
                        }
                    }
                }
                
                return result;
            }
        }
        catch (Exception ex)
        {
            _configuration.WriteLog($"Error applying pattern '{pattern.Pattern}': {ex.Message}");
        }
        
        return null;
    }

    private string ApplyTransformation(string value, string transformation)
    {
        switch (transformation?.ToLowerInvariant())
        {
            case PatternTransformations.DotsToUnderscores:
                return value.Replace('.', '_');
                
            case PatternTransformations.UnderscoresToDots:
                return value.Replace('_', '.');
            
            case PatternTransformations.Uppercase:
                return value.ToUpperInvariant();
            
            case PatternTransformations.Lowercase:
                return value.ToLowerInvariant();
            
            case PatternTransformations.TitleCase:
                return value.ToTitleCase(_configuration.NamingScheme);
            
            case PatternTransformations.RemoveHyphens:
                return value.Replace("-", "");
            
            default:
                return value;
        }
    }

    private string ApplyDefaultStrategy(NamespaceKey key)
    {
        switch (DefaultStrategy)
        {
            case DefaultNamespaceStrategy.UseFilename:
                if (key.Source != null)
                {
                    var filename = GetFilenameWithoutExtension(key.Source);
                    if (!string.IsNullOrEmpty(filename))
                        return filename.ToTitleCase(_configuration.NamingScheme);
                }
                goto case DefaultNamespaceStrategy.AutoGenerate;
            
            case DefaultNamespaceStrategy.UseXmlNamespace:
                if (!string.IsNullOrEmpty(key.XmlSchemaNamespace))
                {
                    var lastSegment = key.XmlSchemaNamespace.Split('/', '#').LastOrDefault(s => !string.IsNullOrEmpty(s));
                    if (!string.IsNullOrEmpty(lastSegment))
                        return lastSegment.ToTitleCase(_configuration.NamingScheme);
                }
                goto case DefaultNamespaceStrategy.AutoGenerate;
            
            case DefaultNamespaceStrategy.UseTemplate:
                if (!string.IsNullOrEmpty(DefaultNamespaceTemplate))
                {
                    var result = DefaultNamespaceTemplate;
                    
                    if (key.Source != null)
                    {
                        var filename = GetFilenameWithoutExtension(key.Source);
                        result = result.Replace("{filename}", filename ?? "Unknown");
                    }
                    
                    if (!string.IsNullOrEmpty(key.XmlSchemaNamespace))
                    {
                        result = result.Replace("{xmlnamespace}", key.XmlSchemaNamespace);
                        var lastSegment = key.XmlSchemaNamespace.Split('/', '#').LastOrDefault(s => !string.IsNullOrEmpty(s));
                        result = result.Replace("{lastsegment}", lastSegment ?? "");
                    }
                    
                    return result;
                }
                goto case DefaultNamespaceStrategy.AutoGenerate;
            
            case DefaultNamespaceStrategy.ThrowException:
                throw new InvalidOperationException($"Namespace not provided for XML namespace '{key.XmlSchemaNamespace}' and source '{key.Source}'");
            
            case DefaultNamespaceStrategy.AutoGenerate:
            default:
                // Return null to trigger the existing auto-generation logic in BuildNamespace
                return null;
        }
    }

    private string GetFilenameWithoutExtension(Uri source)
    {
        if (source == null) return null;
        
        var path = source.IsAbsoluteUri ? source.LocalPath : source.OriginalString;
        return Path.GetFileNameWithoutExtension(path);
    }
}