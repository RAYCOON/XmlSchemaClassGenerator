using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;

namespace XmlSchemaClassGenerator;

/// <summary>
/// An OutputWriter that collects all namespaces and writes them to a single file
/// </summary>
public class SingleFileOutputWriter : OutputWriter
{
    private readonly string _outputPath;
    private readonly List<CodeNamespace> _namespaces = new();
    
    public GeneratorConfiguration Configuration { get; set; }

    public SingleFileOutputWriter(string outputPath)
    {
        _outputPath = outputPath;
        
        // Ensure directory exists
        var directory = Path.GetDirectoryName(_outputPath);
        if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory))
        {
            Directory.CreateDirectory(directory);
        }
    }

    public override void Write(CodeNamespace cn)
    {
        // Collect namespaces instead of writing immediately
        _namespaces.Add(cn);
    }

    /// <summary>
    /// Writes all collected namespaces to the single output file
    /// </summary>
    public void Flush()
    {
        var cu = new CodeCompileUnit();
        
        // Add all collected namespaces to a single compile unit
        foreach (var ns in _namespaces)
        {
            cu.Namespaces.Add(ns);
        }
        
        Configuration?.WriteLog(_outputPath);
        
        using var writer = new StreamWriter(_outputPath, false, new System.Text.UTF8Encoding(true));
        Write(writer, cu);
    }
}