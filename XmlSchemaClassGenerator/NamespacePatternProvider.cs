using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace XmlSchemaClassGenerator;

/// <summary>
/// Provides namespace mapping based on patterns with placeholder support.
/// </summary>
public class NamespacePatternProvider
{
    private readonly List<NamespacePattern> _patterns = new();
    private readonly NamespaceProvider _fallbackProvider;

    public NamespacePatternProvider(NamespaceProvider fallbackProvider)
    {
        _fallbackProvider = fallbackProvider ?? throw new ArgumentNullException(nameof(fallbackProvider));
    }

    /// <summary>
    /// Adds a namespace pattern mapping.
    /// </summary>
    /// <param name="xmlNamespacePattern">Pattern for matching XML namespaces (supports {id} placeholders)</param>
    /// <param name="csharpNamespaceTemplate">Template for generating C# namespaces (supports {id}, {0}, {1} placeholders)</param>
    public void AddPattern(string xmlNamespacePattern, string csharpNamespaceTemplate)
    {
        System.Console.WriteLine($"[DEBUG] AddPattern called: '{xmlNamespacePattern}' -> '{csharpNamespaceTemplate}'");
        _patterns.Add(new NamespacePattern(xmlNamespacePattern, csharpNamespaceTemplate));
    }

    /// <summary>
    /// Generates a C# namespace for the given namespace key.
    /// </summary>
    public string GenerateNamespace(NamespaceKey key)
    {
        System.Console.WriteLine($"[DEBUG] GenerateNamespace called with key: XmlNamespace='{key.XmlSchemaNamespace}', Source='{key.Source}'");
        
        // Try each pattern in order
        foreach (var pattern in _patterns)
        {
            var result = pattern.TryApply(key);
            if (result != null)
            {
                System.Console.WriteLine($"[DEBUG] Pattern matched! Generated namespace: '{result}'");
                return result;
            }
        }
        
        System.Console.WriteLine($"[DEBUG] No pattern matched for namespace '{key.XmlSchemaNamespace}'");

        // Fall back to the default provider's generation logic
        if (_fallbackProvider.GenerateNamespace != null)
        {
            return _fallbackProvider.GenerateNamespace(key);
        }
        return null;
    }

    /// <summary>
    /// Creates a NamespaceProvider that uses pattern matching.
    /// </summary>
    public NamespaceProvider CreateNamespaceProvider()
    {
        var provider = new NamespaceProvider
        {
            GenerateNamespace = GenerateNamespace
        };

        // Copy existing mappings from fallback provider
        foreach (var kvp in _fallbackProvider)
        {
            provider.Add(kvp.Key, kvp.Value);
        }

        return provider;
    }

    private class NamespacePattern
    {
        private readonly string _xmlPattern;
        private readonly string _csharpTemplate;
        private readonly Regex _regex;
        private readonly List<string> _placeholderNames;

        public NamespacePattern(string xmlPattern, string csharpTemplate)
        {
            _xmlPattern = xmlPattern;
            _csharpTemplate = csharpTemplate;
            
            // Extract placeholder names from the pattern
            _placeholderNames = new List<string>();
            var placeholderRegex = new Regex(@"\{(\w+)\}");
            var matches = placeholderRegex.Matches(xmlPattern);
            foreach (Match match in matches)
            {
                _placeholderNames.Add(match.Groups[1].Value);
            }

            // Convert the pattern to a regex - but first replace placeholders
            var regexPattern = xmlPattern;
            
            // Replace named placeholders with capture groups BEFORE escaping
            foreach (var placeholder in _placeholderNames)
            {
                var placeholderPattern = $"{{{placeholder}}}";
                var captureGroup = $"(?<{placeholder}>[^/]+)";
                regexPattern = regexPattern.Replace(placeholderPattern, captureGroup);
                System.Console.WriteLine($"[DEBUG] Replaced '{placeholderPattern}' with '{captureGroup}'");
            }
            
            // Now escape the rest of the pattern
            // But we need to protect our capture groups from being escaped
            var parts = regexPattern.Split(new[] { "(?<" }, StringSplitOptions.None);
            for (int i = 0; i < parts.Length; i++)
            {
                if (i == 0)
                {
                    parts[i] = Regex.Escape(parts[i]);
                }
                else
                {
                    var endIndex = parts[i].IndexOf(")");
                    if (endIndex > 0)
                    {
                        var captureGroupContent = parts[i].Substring(0, endIndex + 1);
                        var rest = parts[i].Substring(endIndex + 1);
                        parts[i] = captureGroupContent + Regex.Escape(rest);
                    }
                }
            }
            regexPattern = string.Join("(?<", parts);
            
            System.Console.WriteLine($"[DEBUG] Final regex pattern: '{regexPattern}'");
            
            // Also support numbered placeholders
            regexPattern = regexPattern.Replace(@"\\\{(\d+)\\\}", @"([^/]+)");
            
            _regex = new Regex($"^{regexPattern}$", RegexOptions.Compiled);
            
            System.Console.WriteLine($"[DEBUG] Created pattern: '{xmlPattern}' -> regex: '{_regex}'");
        }

        public string TryApply(NamespaceKey key)
        {
            if (string.IsNullOrEmpty(key.XmlSchemaNamespace))
                return null;

            System.Console.WriteLine($"[DEBUG] Trying to match '{key.XmlSchemaNamespace}' against pattern '{_xmlPattern}'");
            var match = _regex.Match(key.XmlSchemaNamespace);
            if (!match.Success)
            {
                System.Console.WriteLine($"[DEBUG] No match!");
                return null;
            }
            
            System.Console.WriteLine($"[DEBUG] Match successful!");

            var result = _csharpTemplate;

            // Replace named placeholders
            for (int i = 0; i < _placeholderNames.Count; i++)
            {
                var placeholderName = _placeholderNames[i];
                var value = match.Groups[placeholderName].Value;
                result = result.Replace($"{{{placeholderName}}}", value);
                
                // Also replace numbered placeholders
                result = result.Replace($"{{{i}}}", value);
            }

            // Replace numbered placeholders from unnamed groups
            for (int i = 1; i < match.Groups.Count; i++)
            {
                result = result.Replace($"{{{i - 1}}}", match.Groups[i].Value);
            }

            // Special placeholders
            if (key.Source != null)
            {
                var filename = Path.GetFileNameWithoutExtension(key.Source.LocalPath);
                result = result.Replace("{filename}", filename);
                
                // Extract schema ID from filename pattern (e.g., "S055-4.4.xsd" -> "S055")
                var schemaIdMatch = Regex.Match(filename, @"^([A-Z]\d+)");
                if (schemaIdMatch.Success)
                {
                    result = result.Replace("{schemaId}", schemaIdMatch.Groups[1].Value);
                }
            }

            return result;
        }
    }
}

/// <summary>
/// Extension methods for creating pattern-based namespace providers.
/// </summary>
public static class NamespacePatternExtensions
{
    /// <summary>
    /// Creates a NamespaceProvider with pattern support from command-line patterns.
    /// </summary>
    public static NamespaceProvider ToNamespaceProviderWithPatterns(
        this IEnumerable<KeyValuePair<string, string>> patterns,
        NamespaceProvider baseProvider)
    {
        var patternProvider = new NamespacePatternProvider(baseProvider);
        
        foreach (var pattern in patterns)
        {
            // Check if this looks like a pattern (contains placeholders)
            if (pattern.Key.Contains("{") && pattern.Key.Contains("}"))
            {
                patternProvider.AddPattern(pattern.Key, pattern.Value);
            }
            else
            {
                // Regular exact mapping
                baseProvider.Add(new NamespaceKey(pattern.Key), pattern.Value);
            }
        }

        return patternProvider.CreateNamespaceProvider();
    }
}