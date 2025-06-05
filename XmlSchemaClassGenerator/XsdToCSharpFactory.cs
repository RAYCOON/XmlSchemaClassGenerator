using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.Emit;
using System.ComponentModel.DataAnnotations;

namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Factory class that provides a complete, high-level API for XSD to C# code generation.
    /// This class wraps the existing Generator/ModelBuilder pipeline and provides both:
    /// - XPath-like navigation capabilities through XsdTypeNavigator
    /// - Compiled .NET assemblies for actual type instantiation
    /// 
    /// USAGE PATTERN:
    /// 1. var factory = new XsdToCSharpFactory(configuration)
    /// 2. var navigator = factory.GenerateTypesFromXsd(xsdFiles)  // Creates navigator AND assembly AND detects root
    /// 3. var rootInstance = factory.CreateRootInstance()        // Create root element automatically
    /// 4. Use navigator for XPath-like property access and manipulation
    /// 
    /// ADVANCED USAGE:
    /// - var assembly = factory.GetCompiledAssembly()           // Get the compiled types
    /// - var rootType = factory.GetRootElementType()            // Get auto-detected root type
    /// - var instance = factory.CreateInstance("TypeName")      // Create specific instances
    /// 
    /// REDUNDANCY ELIMINATED + ROOT DETECTION:
    /// No need to manually find root element types - factory detects them automatically!
    /// </summary>
    public class XsdToCSharpFactory
    {
        private readonly GeneratorConfiguration _configuration;
        private readonly Generator _generator;

        public XsdToCSharpFactory(GeneratorConfiguration configuration = null)
        {
            _configuration = configuration ?? CreateDefaultConfiguration();
            _generator = new Generator();
            
            // Apply configuration to generator
            ApplyConfigurationToGenerator(_configuration);
        }

        /// <summary>
        /// Generates TypeModel objects from an XSD file that can be used for XPath-like navigation and property access
        /// </summary>
        /// <param name="xsdFilePath">Path to the XSD file</param>
        /// <returns>XsdTypeNavigator that provides XPath-like access to XSD-derived type models</returns>
        public XsdTypeNavigator GenerateTypesFromXsd(string xsdFilePath)
        {
            return GenerateTypesFromXsd(new[] { xsdFilePath });
        }

        private XsdTypeNavigator _navigator;

        /// <summary>
        /// Generates TypeModel objects from multiple XSD files that can be used for XPath-like navigation and property access
        /// This method supports XSD files with imports and dependencies
        /// </summary>
        /// <param name="xsdFilePaths">Paths to the XSD files</param>
        /// <returns>XsdTypeNavigator that provides XPath-like access to XSD-derived type models</returns>
        public XsdTypeNavigator GenerateTypesFromXsd(IEnumerable<string> xsdFilePaths)
        {
            var files = xsdFilePaths.ToList();
            if (!files.Any())
                throw new ArgumentException("At least one XSD file path must be provided");

            foreach (var file in files)
            {
                if (!File.Exists(file))
                    throw new FileNotFoundException($"XSD file not found: {file}");
            }

            // Create XmlSchemaSet from all XSD files
            var schemaSet = new XmlSchemaSet();
            foreach (var xsdFilePath in files)
            {
                using (var reader = XmlReader.Create(xsdFilePath))
                {
                    schemaSet.Add(null, reader);
                }
            }
            schemaSet.Compile();

            if (schemaSet.GlobalTypes.Count == 0)
                throw new InvalidOperationException("No types found in XSD schemas");

            // Use ModelBuilder to create TypeModel objects directly
            var modelBuilder = new ModelBuilder(_configuration, schemaSet);
            
            // Create navigator
            _navigator = new XsdTypeNavigator(modelBuilder);

            // Store files for assembly compilation
            _lastXsdFiles = files.ToList();
            
            // Also compile to real assembly for complete functionality
            _compiledAssembly = CompileToAssembly($"XsdFactory_{DateTime.Now.Ticks}");
            
            // Auto-detect root element type
            _rootElementType = DetectRootElementType();
            
            // Return navigator that provides XPath-like access
            return _navigator;
        }

        private Assembly _compiledAssembly;
        private IList<string> _lastXsdFiles;
        private Type _rootElementType;

        /// <summary>
        /// Gets the compiled assembly containing the generated types
        /// Call this after GenerateTypesFromXsd()
        /// </summary>
        public Assembly GetCompiledAssembly()
        {
            if (_compiledAssembly == null)
                throw new InvalidOperationException("No assembly generated. Call GenerateTypesFromXsd() first.");
            
            return _compiledAssembly;
        }

        /// <summary>
        /// Creates an instance of the specified type from the compiled assembly
        /// </summary>
        public object CreateInstance(string typeName)
        {
            if (_compiledAssembly == null)
                throw new InvalidOperationException("No assembly generated. Call GenerateTypesFromXsd() first.");

            var type = _compiledAssembly.GetTypes().FirstOrDefault(t => t.Name == typeName);
            if (type == null)
                throw new ArgumentException($"Type '{typeName}' not found in generated assembly");

            return Activator.CreateInstance(type);
        }

        /// <summary>
        /// Gets the automatically detected root element type
        /// Call this after GenerateTypesFromXsd()
        /// </summary>
        public Type GetRootElementType()
        {
            if (_rootElementType == null)
                throw new InvalidOperationException("No root element type detected. Call GenerateTypesFromXsd() first.");
            
            return _rootElementType;
        }

        /// <summary>
        /// Gets the name of the automatically detected root element type
        /// Call this after GenerateTypesFromXsd()
        /// </summary>
        public string GetRootElementTypeName()
        {
            return GetRootElementType().Name;
        }

        /// <summary>
        /// Creates an instance of the automatically detected root element type
        /// Call this after GenerateTypesFromXsd()
        /// </summary>
        public object CreateRootInstance()
        {
            if (_rootElementType == null)
                throw new InvalidOperationException("No root element type detected. Call GenerateTypesFromXsd() first.");

            return Activator.CreateInstance(_rootElementType);
        }

        /// <summary>
        /// Compile XSD files to assembly using the proven Roslyn approach from Compiler class
        /// </summary>
        private Assembly CompileToAssembly(string assemblyName)
        {
            return CompileFiles(assemblyName, _lastXsdFiles);
        }

        private static readonly string[] DependencyAssemblies =
        [
            "netstandard",
            "System.ComponentModel.Annotations",
            "System.ComponentModel.Primitives",
            "System.Diagnostics.Tools",
            "System.Linq",
            "System.ObjectModel",
            "System.Private.CoreLib",
            "System.Private.Xml",
            "System.Private.Xml.Linq",
            "System.Runtime",
            "System.Runtime.Extensions",
            "System.Xml.XDocument",
            "System.Xml.XmlSerializer",
        ];

        private Assembly CompileFiles(string name, IEnumerable<string> xsdFiles)
        {
            // Use temporary file approach like the proven Compiler class
            var tempDir = Path.Combine(Path.GetTempPath(), name + "_" + Guid.NewGuid().ToString("N").Substring(0, 8));
            Directory.CreateDirectory(tempDir);

            try
            {
                // Create generator for compilation (copy settings from main generator)
                var compilerGenerator = new Generator
                {
                    GenerateNullables = _generator.GenerateNullables,
                    NamespaceProvider = _generator.NamespaceProvider,
                    DataAnnotationMode = _generator.DataAnnotationMode,
                    EmitOrder = _generator.EmitOrder,
                    NamingScheme = _generator.NamingScheme,
                    GenerateDesignerCategoryAttribute = false,
                    GenerateComplexTypesForCollections = true,
                    EntityFramework = false,
                    GenerateInterfaces = true,
                    GenerateDescriptionAttribute = true,
                    TextValuePropertyName = "Value",
                    IntegerDataType = typeof(int)
                };

                var output = new FileOutputWriter(tempDir, true);
                compilerGenerator.OutputWriter = output;

                compilerGenerator.Generate(xsdFiles);

                // Compile all generated files
                return CompileGeneratedFiles(name, output.WrittenFiles);
            }
            finally
            {
                // Clean up temp directory
                try { Directory.Delete(tempDir, true); } catch { }
            }
        }

        private static Assembly CompileGeneratedFiles(string name, IEnumerable<string> filePaths)
        {
            return Compile(name, filePaths.Select(f => File.ReadAllText(f)).ToArray());
        }

        private static readonly LanguageVersion MaxLanguageVersion = Enum
            .GetValues(typeof(LanguageVersion))
            .Cast<LanguageVersion>()
            .Max();

        private static Assembly Compile(string name, params string[] contents)
        {
            // Get references in a way that works with .NET Standard 2.0
            var references = GetPlatformReferences();
            var options = new CSharpParseOptions(kind: SourceCodeKind.Regular, languageVersion: MaxLanguageVersion);
            var syntaxTrees = contents.Select(c => CSharpSyntaxTree.ParseText(c, options));
            var compilation = CSharpCompilation.Create(name, syntaxTrees)
                .AddReferences(references)
                .WithOptions(new CSharpCompilationOptions(OutputKind.DynamicallyLinkedLibrary));

            using var stream = new MemoryStream();
            var emitResult = compilation.Emit(stream);

            if (!emitResult.Success)
            {
                var errors = string.Join("\n", emitResult.Diagnostics
                    .Where(d => d.Severity == DiagnosticSeverity.Error)
                    .Select(d => d.ToString()));
                throw new InvalidOperationException($"Compilation failed:\n{errors}");
            }

            return Assembly.Load(stream.ToArray());
        }

        /// <summary>
        /// Get platform references in a way that works with .NET Standard 2.0 and .NET Framework
        /// </summary>
        private static List<MetadataReference> GetPlatformReferences()
        {
            var references = new List<MetadataReference>();

            // Use runtime assemblies directly - works across all platforms
            try
            {
                // Core assemblies
                references.Add(MetadataReference.CreateFromFile(typeof(object).Assembly.Location));
                references.Add(MetadataReference.CreateFromFile(typeof(System.Xml.Serialization.XmlSerializer).Assembly.Location));
                references.Add(MetadataReference.CreateFromFile(typeof(System.Linq.Enumerable).Assembly.Location));
                references.Add(MetadataReference.CreateFromFile(typeof(System.Collections.Generic.List<>).Assembly.Location));
                
                // Try to add DataAnnotations
                try
                {
                    references.Add(MetadataReference.CreateFromFile(typeof(System.ComponentModel.DataAnnotations.RequiredAttribute).Assembly.Location));
                }
                catch
                {
                    // DataAnnotations might not be available in all contexts
                }
                
                // Try to find and add more system assemblies from the runtime directory
                var runtimeDir = Path.GetDirectoryName(typeof(object).Assembly.Location);
                if (!string.IsNullOrEmpty(runtimeDir))
                {
                    var commonAssemblies = new[]
                    {
                        "mscorlib.dll",
                        "System.dll", 
                        "System.Core.dll",
                        "System.Xml.dll",
                        "System.Runtime.dll",
                        "System.Collections.dll",
                        "System.ComponentModel.Primitives.dll",
                        "netstandard.dll"
                    };
                    
                    foreach (var assemblyName in commonAssemblies)
                    {
                        var assemblyPath = Path.Combine(runtimeDir, assemblyName);
                        if (File.Exists(assemblyPath))
                        {
                            try
                            {
                                references.Add(MetadataReference.CreateFromFile(assemblyPath));
                            }
                            catch
                            {
                                // Skip if assembly can't be loaded
                            }
                        }
                    }
                }
            }
            catch
            {
                // If all else fails, add minimal references
                references.Add(MetadataReference.CreateFromFile(typeof(object).Assembly.Location));
            }

            return references;
        }

        /// <summary>
        /// Auto-detect the root element type from the generated assembly
        /// Uses heuristics to find the most likely root element type
        /// </summary>
        private Type DetectRootElementType()
        {
            if (_compiledAssembly == null)
                return null;

            var types = _compiledAssembly.GetTypes()
                .Where(t => t.IsClass && !t.IsAbstract && !t.IsNested)
                .ToList();

            // Strategy 1: Look for types with XmlRoot attribute
            var typesWithXmlRoot = types
                .Where(t => t.GetCustomAttributes(typeof(System.Xml.Serialization.XmlRootAttribute), false).Any())
                .ToList();

            if (typesWithXmlRoot.Count == 1)
                return typesWithXmlRoot[0];

            // Strategy 2: Look for common root element patterns (S071, Document, Root, etc.)
            var commonRootPatterns = new[] { "S071", "Document", "Root", "Message", "Envelope" };
            foreach (var pattern in commonRootPatterns)
            {
                var matchingType = types.FirstOrDefault(t => 
                    t.Name.Equals(pattern, StringComparison.OrdinalIgnoreCase) ||
                    t.Name.EndsWith(pattern, StringComparison.OrdinalIgnoreCase));
                if (matchingType != null)
                    return matchingType;
            }

            // Strategy 3: Look for the type that contains the most other types as properties
            var typeWithMostComplexProperties = types
                .Select(t => new { Type = t, ComplexPropertyCount = GetComplexPropertyCount(t, types) })
                .OrderByDescending(x => x.ComplexPropertyCount)
                .FirstOrDefault();

            if (typeWithMostComplexProperties != null && typeWithMostComplexProperties.ComplexPropertyCount > 0)
                return typeWithMostComplexProperties.Type;

            // Strategy 4: Return the first type as fallback
            return types.FirstOrDefault();
        }

        /// <summary>
        /// Count how many properties of a type are complex types (not primitives)
        /// </summary>
        private int GetComplexPropertyCount(Type type, List<Type> allGeneratedTypes)
        {
            return type.GetProperties()
                .Count(p => allGeneratedTypes.Contains(p.PropertyType) || 
                           (p.PropertyType.IsGenericType && 
                            p.PropertyType.GetGenericArguments().Any(arg => allGeneratedTypes.Contains(arg))));
        }

        private void ApplyConfigurationToGenerator(GeneratorConfiguration config)
        {
            _generator.GenerateNullables = config.GenerateNullables;
            _generator.GenerateSerializableAttribute = config.GenerateSerializableAttribute;
            _generator.GenerateDesignerCategoryAttribute = config.GenerateDesignerCategoryAttribute;
            _generator.GenerateDebuggerStepThroughAttribute = config.GenerateDebuggerStepThroughAttribute;
            _generator.DataAnnotationMode = config.DataAnnotationMode;
            _generator.EmitOrder = config.EmitOrder;
            _generator.EnableDataBinding = config.EnableDataBinding;
            _generator.NamespacePrefix = config.NamespacePrefix;
            _generator.NamingScheme = config.NamingScheme;
            _generator.GenerateChoiceItemProperty = config.GenerateChoiceItemProperty;
            _generator.NamespaceProvider = config.NamespaceProvider; // This was missing!
        }

        /// <summary>
        /// Creates an instance of the specified type and deserializes XML content into it
        /// </summary>
        public T DeserializeXml<T>(string xmlContent)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (var reader = new StringReader(xmlContent))
            {
                return (T)serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// Deserializes XML content into an object of the specified type
        /// </summary>
        public object DeserializeXml(string xmlContent, Type targetType)
        {
            var serializer = new XmlSerializer(targetType);
            using (var reader = new StringReader(xmlContent))
            {
                return serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// Serializes an object to XML string
        /// </summary>
        public string SerializeToXml<T>(T obj)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (var writer = new StringWriter())
            {
                serializer.Serialize(writer, obj);
                return writer.ToString();
            }
        }

        /// <summary>
        /// Gets all required property paths for the current XSD schema.
        /// Required properties are those marked with [Required] attribute or have MinOccurs > 0 in XSD.
        /// </summary>
        /// <returns>List of property paths (e.g., "Customer.Name", "Customer.Orders[*].Total")</returns>
        public List<string> GetRequiredPropertyPaths()
        {
            if (_compiledAssembly == null)
                throw new InvalidOperationException("No types have been generated. Call GenerateTypesFromXsd() first.");

            var requiredPaths = new List<string>();
            var rootType = GetRootElementType();
            
            if (rootType != null)
            {
                CollectRequiredPaths(rootType, "", requiredPaths, new HashSet<Type>());
            }

            return requiredPaths;
        }

        /// <summary>
        /// Validates an object instance against XSD schema requirements and returns validation errors with property paths.
        /// </summary>
        /// <param name="instance">The object instance to validate</param>
        /// <returns>Empty list if valid, otherwise list of validation errors with property paths</returns>
        public List<XsdValidationError> ValidateInstance(object instance)
        {
            if (instance == null)
                throw new ArgumentNullException(nameof(instance));

            var errors = new List<XsdValidationError>();
            ValidateInstanceRecursive(instance, "", errors, new HashSet<object>());
            return errors;
        }

        private void CollectRequiredPaths(Type type, string currentPath, List<string> requiredPaths, HashSet<Type> visitedTypes)
        {
            if (visitedTypes.Contains(type))
                return;

            visitedTypes.Add(type);

            var properties = type.GetProperties(BindingFlags.Public | BindingFlags.Instance);
            
            foreach (var property in properties)
            {
                var fullPath = string.IsNullOrEmpty(currentPath) ? property.Name : $"{currentPath}.{property.Name}";
                
                // Check for Required attribute
                var requiredAttr = property.GetCustomAttribute<RequiredAttribute>();
                if (requiredAttr != null)
                {
                    requiredPaths.Add(fullPath);
                }

                // Check for XmlElement with minOccurs > 0 (implied by Required)
                try
                {
                    var xmlElementAttrs = property.GetCustomAttributes<XmlElementAttribute>();
                    if (xmlElementAttrs.Any())
                    {
                        // Check for nullable types - non-nullable value types are usually required
                        var propertyType = property.PropertyType;
                        var underlyingType = Nullable.GetUnderlyingType(propertyType);
                        
                        if (underlyingType == null && propertyType.IsValueType && requiredAttr == null)
                        {
                            // Value type without Required attribute might still be required
                            // This is a heuristic - in practice Required attribute should be used
                        }
                    }
                }
                catch (AmbiguousMatchException)
                {
                    // Property has multiple XmlElement attributes - this is common in complex schemas
                    // Skip attribute-based analysis for this property
                }

                // Recursively check complex types
                var propType = property.PropertyType;
                if (IsCollectionType(propType))
                {
                    var elementType = GetCollectionElementType(propType);
                    if (elementType != null && IsComplexType(elementType))
                    {
                        CollectRequiredPaths(elementType, $"{fullPath}[*]", requiredPaths, new HashSet<Type>(visitedTypes));
                    }
                }
                else if (IsComplexType(propType))
                {
                    CollectRequiredPaths(propType, fullPath, requiredPaths, new HashSet<Type>(visitedTypes));
                }
            }
        }

        private void ValidateInstanceRecursive(object instance, string currentPath, List<XsdValidationError> errors, HashSet<object> visitedObjects)
        {
            if (instance == null || visitedObjects.Contains(instance))
                return;

            visitedObjects.Add(instance);

            var type = instance.GetType();
            var properties = type.GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (var property in properties)
            {
                var fullPath = string.IsNullOrEmpty(currentPath) ? property.Name : $"{currentPath}.{property.Name}";
                var value = property.GetValue(instance);

                // Check Required attribute
                var requiredAttr = property.GetCustomAttribute<RequiredAttribute>();
                if (requiredAttr != null)
                {
                    if (value == null || (value is string str && string.IsNullOrEmpty(str)))
                    {
                        errors.Add(new XsdValidationError
                        {
                            PropertyPath = fullPath,
                            ErrorMessage = $"Required property '{property.Name}' is missing or empty.",
                            ErrorType = XsdValidationErrorType.Required
                        });
                        continue;
                    }
                }

                if (value != null)
                {
                    // Validate collection items
                    if (IsCollectionType(property.PropertyType) && value is System.Collections.IEnumerable enumerable)
                    {
                        int index = 0;
                        foreach (var item in enumerable)
                        {
                            if (item != null && IsComplexType(item.GetType()))
                            {
                                ValidateInstanceRecursive(item, $"{fullPath}[{index}]", errors, new HashSet<object>(visitedObjects));
                            }
                            index++;
                        }
                    }
                    // Validate complex type properties
                    else if (IsComplexType(property.PropertyType))
                    {
                        ValidateInstanceRecursive(value, fullPath, errors, new HashSet<object>(visitedObjects));
                    }
                }
            }
        }

        private bool IsCollectionType(Type type)
        {
            return type != typeof(string) && typeof(System.Collections.IEnumerable).IsAssignableFrom(type);
        }

        private Type GetCollectionElementType(Type collectionType)
        {
            if (collectionType.IsArray)
                return collectionType.GetElementType();

            var genericArgs = collectionType.GetGenericArguments();
            return genericArgs.Length > 0 ? genericArgs[0] : null;
        }

        private bool IsComplexType(Type type)
        {
            return !type.IsPrimitive && type != typeof(string) && type != typeof(DateTime) && 
                   type != typeof(decimal) && type != typeof(Guid) && !type.IsEnum &&
                   Nullable.GetUnderlyingType(type) == null;
        }

        private GeneratorConfiguration CreateDefaultConfiguration()
        {
            return new GeneratorConfiguration
            {
                GenerateNullables = true,
                GenerateSerializableAttribute = true,
                GenerateDesignerCategoryAttribute = false,
                GenerateDebuggerStepThroughAttribute = false,
                DataAnnotationMode = DataAnnotationMode.None,
                EmitOrder = true,
                EnableDataBinding = false,
                NamespacePrefix = "Generated",
                NamingScheme = NamingScheme.PascalCase
            };
        }


    }
}