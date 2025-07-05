using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Schema;

namespace XmlSchemaClassGenerator;

/// <summary>
/// Resolves XSD schemas from directories and handles dependencies automatically.
/// </summary>
public class SchemaResolver
{
    private readonly List<string> _searchDirectories = new();
    private readonly Dictionary<string, string> _resolvedSchemas = new();
    private readonly HashSet<string> _processedFiles = new();
    
    public bool Recursive { get; set; }
    public bool AutoResolveImports { get; set; }
    public Action<string> Log { get; set; }

    public SchemaResolver()
    {
        AutoResolveImports = true;
        Recursive = false;
    }

    /// <summary>
    /// Adds a directory to search for schema files.
    /// </summary>
    public void AddSearchDirectory(string directory)
    {
        if (Directory.Exists(directory))
        {
            _searchDirectories.Add(Path.GetFullPath(directory));
        }
    }

    /// <summary>
    /// Finds all XSD files in the configured search directories.
    /// </summary>
    public IEnumerable<string> FindSchemaFiles()
    {
        var searchOption = Recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
        var schemaFiles = new List<string>();

        foreach (var directory in _searchDirectories)
        {
            try
            {
                var files = Directory.GetFiles(directory, "*.xsd", searchOption);
                schemaFiles.AddRange(files);
                Log?.Invoke($"Found {files.Length} XSD files in {directory}");
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Error searching directory {directory}: {ex.Message}");
            }
        }

        return schemaFiles.Distinct();
    }

    /// <summary>
    /// Resolves all schemas including their dependencies.
    /// </summary>
    public IEnumerable<string> ResolveSchemas(IEnumerable<string> initialSchemas)
    {
        var schemasToProcess = new Queue<string>(initialSchemas);
        var resolvedSchemas = new List<string>();

        while (schemasToProcess.Count > 0)
        {
            var schemaPath = schemasToProcess.Dequeue();
            
            if (_processedFiles.Contains(schemaPath))
                continue;

            _processedFiles.Add(schemaPath);
            resolvedSchemas.Add(schemaPath);

            if (AutoResolveImports)
            {
                var dependencies = ExtractSchemaDependencies(schemaPath);
                foreach (var dependency in dependencies)
                {
                    var resolvedDep = ResolveSchemaDependency(schemaPath, dependency);
                    if (resolvedDep != null && !_processedFiles.Contains(resolvedDep))
                    {
                        schemasToProcess.Enqueue(resolvedDep);
                        Log?.Invoke($"Resolved dependency: {dependency} -> {resolvedDep}");
                    }
                    else if (resolvedDep == null)
                    {
                        Log?.Invoke($"Warning: Could not resolve dependency '{dependency}' from {schemaPath}");
                    }
                }
            }
        }

        return resolvedSchemas;
    }

    /// <summary>
    /// Extracts import and include schema locations from an XSD file.
    /// </summary>
    private IEnumerable<string> ExtractSchemaDependencies(string schemaPath)
    {
        var dependencies = new List<string>();

        try
        {
            var doc = new XmlDocument();
            doc.Load(schemaPath);
            var nsmgr = new XmlNamespaceManager(doc.NameTable);
            nsmgr.AddNamespace("xsd", "http://www.w3.org/2001/XMLSchema");

            // Find all import elements
            var imports = doc.SelectNodes("//xsd:import[@schemaLocation]", nsmgr);
            if (imports != null)
            {
                foreach (XmlNode import in imports)
                {
                    var location = import.Attributes?["schemaLocation"]?.Value;
                    if (!string.IsNullOrEmpty(location))
                    {
                        dependencies.Add(location);
                    }
                }
            }

            // Find all include elements
            var includes = doc.SelectNodes("//xsd:include[@schemaLocation]", nsmgr);
            if (includes != null)
            {
                foreach (XmlNode include in includes)
                {
                    var location = include.Attributes?["schemaLocation"]?.Value;
                    if (!string.IsNullOrEmpty(location))
                    {
                        dependencies.Add(location);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Log?.Invoke($"Error extracting dependencies from {schemaPath}: {ex.Message}");
        }

        return dependencies.Distinct();
    }

    /// <summary>
    /// Resolves a schema dependency to an absolute path.
    /// </summary>
    private string ResolveSchemaDependency(string referencingSchema, string schemaLocation)
    {
        // Try relative to the referencing schema first
        var baseDir = Path.GetDirectoryName(referencingSchema);
        if (baseDir != null)
        {
            var relativePath = Path.Combine(baseDir, schemaLocation);
            if (File.Exists(relativePath))
            {
                return Path.GetFullPath(relativePath);
            }
        }

        // Try in all search directories
        foreach (var searchDir in _searchDirectories)
        {
            var searchPath = Path.Combine(searchDir, schemaLocation);
            if (File.Exists(searchPath))
            {
                return Path.GetFullPath(searchPath);
            }

            // Also try just the filename in search directories
            var fileName = Path.GetFileName(schemaLocation);
            searchPath = Path.Combine(searchDir, fileName);
            if (File.Exists(searchPath))
            {
                return Path.GetFullPath(searchPath);
            }
        }

        return null;
    }

    /// <summary>
    /// Creates a dependency graph showing schema relationships.
    /// </summary>
    public Dictionary<string, List<string>> CreateDependencyGraph(IEnumerable<string> schemas)
    {
        var graph = new Dictionary<string, List<string>>();

        foreach (var schema in schemas)
        {
            var dependencies = ExtractSchemaDependencies(schema);
            var resolvedDeps = new List<string>();

            foreach (var dep in dependencies)
            {
                var resolved = ResolveSchemaDependency(schema, dep);
                if (resolved != null)
                {
                    resolvedDeps.Add(resolved);
                }
            }

            graph[schema] = resolvedDeps;
        }

        return graph;
    }
}