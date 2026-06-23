using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace XmlSchemaClassGenerator;

public class FileOutputWriter : OutputWriter
{
    public GeneratorConfiguration Configuration { get; set; }

    public FileOutputWriter(string directory, bool createIfNotExists = true)
    {
        OutputDirectory = directory;

        if (createIfNotExists && !Directory.Exists(OutputDirectory))
        {
            Directory.CreateDirectory(OutputDirectory);
        }
    }

    public string OutputDirectory { get; }

    /// <summary>
    /// A list of all the files written.
    /// </summary>
    public IList<string> WrittenFiles { get; } = [];

    private readonly Dictionary<string, List<(CodeNamespace Namespace, List<CodeTypeDeclaration> Types)>> _sourceFileGroups = new();
    
    public override void Write(CodeNamespace cn)
    {
        switch (Configuration?.FileGroupingMode ?? FileGroupingMode.ByNamespace)
        {
            case FileGroupingMode.ByType:
                WriteSeparateFiles(cn);
                break;
                
            case FileGroupingMode.BySourceFile:
                CollectBySourceFile(cn);
                break;
                
            case FileGroupingMode.ByNamespace:
            default:
                WriteNamespaceFile(cn);
                break;
        }
    }
    
    private void WriteNamespaceFile(CodeNamespace cn)
    {
        var cu = new CodeCompileUnit();
        cu.Namespaces.Add(cn);
        
        var filename = GenerateOutputFilename(cn.Name);
        var path = Path.Combine(OutputDirectory, filename + ".cs");
        Configuration?.WriteLog(path);
        WriteFile(path, cu);
    }
    
    private void CollectBySourceFile(CodeNamespace cn)
    {
        // Group types by their source file
        foreach (CodeTypeDeclaration type in cn.Types)
        {
            var sourceFile = GetTypeSourceFile(type);
            if (string.IsNullOrEmpty(sourceFile))
                sourceFile = "Unknown"; // Fallback for types without source
                
            if (!_sourceFileGroups.ContainsKey(sourceFile))
                _sourceFileGroups[sourceFile] = new List<(CodeNamespace, List<CodeTypeDeclaration>)>();
                
            // Find or create entry for this namespace
            var nsEntry = _sourceFileGroups[sourceFile].FirstOrDefault(e => e.Namespace.Name == cn.Name);
            if (nsEntry.Namespace == null)
            {
                var newNs = new CodeNamespace(cn.Name);
                newNs.Imports.AddRange(cn.Imports.Cast<CodeNamespaceImport>().ToArray());
                newNs.Comments.AddRange(cn.Comments);
                _sourceFileGroups[sourceFile].Add((newNs, new List<CodeTypeDeclaration> { type }));
            }
            else
            {
                nsEntry.Types.Add(type);
            }
        }
    }
    
    /// <summary>
    /// Writes all collected source file groups. Call this after all namespaces have been processed.
    /// </summary>
    public void WriteSourceFileGroups()
    {
        foreach (var kvp in _sourceFileGroups)
        {
            var sourceFile = kvp.Key;
            var namespaceGroups = kvp.Value;
            var cu = new CodeCompileUnit();

            // Add all namespaces that have types from this source file
            foreach (var nsGroup in namespaceGroups)
            {
                var ns = nsGroup.Namespace;
                var types = nsGroup.Types;
                ns.Types.Clear();
                foreach (var type in types)
                {
                    if (Configuration?.GenerateSourceFileAttribute == false)
                        RemoveSourceFileAttribute(type);
                    ns.Types.Add(type);
                }
                cu.Namespaces.Add(ns);
            }

            var filename = GenerateOutputFilename(sourceFile);
            var path = Path.Combine(OutputDirectory, filename + ".cs");
            Configuration?.WriteLog(path);
            WriteFile(path, cu);
        }

        _sourceFileGroups.Clear();
    }

    private static void RemoveSourceFileAttribute(CodeTypeDeclaration type)
    {
        var toRemove = type.CustomAttributes
            .Cast<CodeAttributeDeclaration>()
            .FirstOrDefault(attr =>
                attr.AttributeType.BaseType == "System.ComponentModel.DescriptionAttribute" &&
                attr.Arguments.Count > 0 &&
                attr.Arguments[0].Value is CodePrimitiveExpression p &&
                p.Value is string s &&
                s.StartsWith("SourceFile:"));
        if (toRemove != null)
            type.CustomAttributes.Remove(toRemove);
    }
    
    private string GetTypeSourceFile(CodeTypeDeclaration type)
    {
        // Look for a custom attribute that stores the source file
        foreach (CodeAttributeDeclaration attr in type.CustomAttributes)
        {
            if (attr.AttributeType.BaseType == "System.ComponentModel.DescriptionAttribute" && 
                attr.Arguments.Count > 0 &&
                attr.Arguments[0].Value is CodePrimitiveExpression primitive &&
                primitive.Value is string description &&
                description.StartsWith("SourceFile:"))
            {
                return description.Substring("SourceFile:".Length);
            }
        }
        return null;
    }

    protected virtual void WriteFile(string path, CodeCompileUnit cu)
    {
        FileStream fs = null;

        try
        {
            fs = new FileStream(path, FileMode.Create);
            using (var writer = new StreamWriter(fs))
            {
                fs = null;
                Write(writer, cu);
            }
            WrittenFiles.Add(path);
        }
        finally
        {
            fs?.Dispose();
        }
    }

    private void WriteSeparateFiles(CodeNamespace cn)
    {
        var validatedNamespaceName = ValidateName(cn.Name);

        var namespacePath = validatedNamespaceName;

        if (Configuration?.SeparateNamespaceHierarchy == true)
        {
            namespacePath = Path.Combine(validatedNamespaceName.Split('.'));
        }

        var dirPath = Path.Combine(OutputDirectory, namespacePath);
        var ccu = new CodeCompileUnit();
        var cns = new CodeNamespace(validatedNamespaceName);

        Directory.CreateDirectory(dirPath);

        cns.Imports.AddRange(cn.Imports.Cast<CodeNamespaceImport>().ToArray());
        cns.Comments.AddRange(cn.Comments);
        ccu.Namespaces.Add(cns);

        foreach (CodeTypeDeclaration ctd in cn.Types)
        {
            var path = Path.Combine(dirPath, ctd.Name + ".cs");
            cns.Types.Clear();
            cns.Types.Add(ctd);
            Configuration?.WriteLog(path);
            WriteFile(path, ccu);
        }
    }

    static readonly Regex InvalidCharacters = new($"[{string.Join("", Path.GetInvalidFileNameChars())}]", RegexOptions.Compiled);

    private static string ValidateName(string name) => InvalidCharacters.Replace(name, "_");

    private string GenerateOutputFilename(string namespaceName)
    {
        // Try to match against output filename patterns
        if (Configuration?.OutputFilenamePatterns != null)
        {
            foreach (var pattern in Configuration.OutputFilenamePatterns.OrderBy(p => p.Priority))
            {
                var result = TryMatchPattern(namespaceName, pattern);
                if (!string.IsNullOrEmpty(result))
                    return ValidateName(result);
            }
        }

        // Apply default strategy
        switch (Configuration?.DefaultOutputFilenameStrategy ?? DefaultOutputFilenameStrategy.UseNamespace)
        {
            case DefaultOutputFilenameStrategy.UseSourceFilename:
                // TODO: Need to pass source filename through the pipeline
                goto case DefaultOutputFilenameStrategy.UseNamespace;
                
            case DefaultOutputFilenameStrategy.UseTemplate:
                // TODO: Implement template support
                goto case DefaultOutputFilenameStrategy.UseNamespace;
                
            case DefaultOutputFilenameStrategy.UseNamespace:
            default:
                return namespaceName;
        }
    }

    private string TryMatchPattern(string input, OutputFilenamePattern pattern)
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
            Configuration?.WriteLog($"Error applying output filename pattern '{pattern.Pattern}': {ex.Message}");
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
            
            case PatternTransformations.RemoveHyphens:
                return value.Replace("-", "");
            
            default:
                return value;
        }
    }
}