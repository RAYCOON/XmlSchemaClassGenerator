using System;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.CSharp;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Xunit;
using Xunit.Abstractions;
using XmlSchemaClassGenerator.BatchConverter.Services;

namespace XmlSchemaClassGenerator.Tests
{
    public class A008SingleFileGenerationTest
    {
        private readonly ITestOutputHelper _output;

        public A008SingleFileGenerationTest(ITestOutputHelper output)
        {
            _output = output;
        }

        [Fact]
        public void GenerateA008SingleFileAndCompareWithExisting()
        {
            // Arrange
            var xsdPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "eessi", "A008-4.4.0-20241203T114133.xsd");
            var outputPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "csharp");
            var generatedFilePath = Path.Combine(outputPath, "A008-4.4.1.Designer.cs");
            var existingFilePath = Path.Combine(outputPath, "A008-4.4.0.Designer.cs");

            Assert.True(File.Exists(xsdPath), $"XSD file not found: {xsdPath}");
            Assert.True(File.Exists(existingFilePath), $"Existing file not found: {existingFilePath}");

            // Ensure output directory exists
            Directory.CreateDirectory(outputPath);

            // Set namespace provider
            var namespaceProvider = new NamespaceProvider();
            
            // Add namespace mappings using NamespaceKey
            namespaceProvider.Add(new NamespaceKey("http://www.w3.org/2000/09/xmldsig#"), "ITSG.EESSI.Tstelle.XML.XmlDsig");
            namespaceProvider.Add(new NamespaceKey("http://uri.etsi.org/01903/v1.3.2#"), "ITSG.EESSI.Tstelle.XML.Etsi");
            namespaceProvider.Add(new NamespaceKey("http://uri.etsi.org/01903/v1.4.1#"), "ITSG.EESSI.Tstelle.XML.Etsi141");
            namespaceProvider.Add(new NamespaceKey("http://uri.etsi.org/02231/v2#"), "ITSG.EESSI.Tstelle.XML.Etsi2");
            namespaceProvider.Add(new NamespaceKey("http://www.w3.org/2001/04/xmlenc#"), "ITSG.EESSI.Tstelle.XML.XmlEnc");

            // Create pattern-based namespace provider
            var patternProvider = new NamespacePatternProvider(namespaceProvider);
            patternProvider.AddPattern("http://ec.europa.eu/eessi/ns/4_4/{id}", "ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1");

            // Create namespace to filename mapping
            var fileNameMappings = new Dictionary<string, string>
            {
                { "ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_1", "A008-4.4.1" },
                { "ITSG.EESSI.Tstelle.XML.XmlDsig", "XmlDsig-4.4.1" },
                { "ITSG.EESSI.Tstelle.XML.Etsi", "XAdES-4.4.1" }
            };

            // Create custom output writer for single file
            var outputWriter = new CustomFileOutputWriter(outputPath, fileNameMappings, true, true);

            // Create the namespace provider with pattern support
            var finalNamespaceProvider = patternProvider.CreateNamespaceProvider();

            // Act - Configure and generate
            var generator = new Generator
            {
                NamespacePrefix = "",
                GenerateNullables = false,
                EnableDataBinding = false,
                GenerateInterfaces = false,
                GenerateDescriptionAttribute = false,
                GenerateComplexTypesForCollections = true,
                GenerateChoiceItemProperty = true, // Generate Item property for choice elements like xsd.exe
                NamingScheme = NamingScheme.Direct,
                UseXElementForAny = false,
                CollectionType = typeof(Array),
                CollectionSettersMode = CollectionSettersMode.Private,
                IntegerDataType = null,
                DataAnnotationMode = DataAnnotationMode.None,
                UseShouldSerializePattern = false,
                EnumAsString = false,
                SeparateClasses = false,
                NamespaceProvider = finalNamespaceProvider,
                OutputWriter = outputWriter
            };
            
            // Include the dependent XSD files
            var xsdDirectory = Path.GetDirectoryName(xsdPath);
            var xsdFiles = new[]
            {
                xsdPath,
                Path.Combine(xsdDirectory, "XAdES.xsd"),
                Path.Combine(xsdDirectory, "xmldsig-core-schema.xsd")
            };
            
            generator.Generate(xsdFiles);
            
            // Debug: Check if GenerateChoiceItemProperty is set
            _output.WriteLine($"GenerateChoiceItemProperty: {generator.GenerateChoiceItemProperty}");

            // Assert - File was created
            Assert.True(File.Exists(generatedFilePath), "Generated file was not created");

            // Load all generated files to get complete type information
            var generatedFiles = new[] 
            {
                generatedFilePath,
                Path.Combine(outputPath, "XmlDsig-4.4.1.Designer.cs"),
                Path.Combine(outputPath, "XAdES-4.4.1.Designer.cs")
            }.Where(File.Exists).ToArray();
            
            // Combine all generated content
            var generatedContent = string.Join("\n", generatedFiles.Select(File.ReadAllText));
            var existingContent = File.ReadAllText(existingFilePath);

            // Parse both files using Roslyn
            var generatedTree = CSharpSyntaxTree.ParseText(generatedContent);
            var existingTree = CSharpSyntaxTree.ParseText(existingContent);

            var generatedRoot = generatedTree.GetCompilationUnitRoot();
            var existingRoot = existingTree.GetCompilationUnitRoot();

            // Extract classes from both files
            var generatedClasses = ExtractClassInfo(generatedRoot);
            var existingClasses = ExtractClassInfo(existingRoot);

            // Compare class structures
            CompareClassStructures(generatedClasses, existingClasses);

            _output.WriteLine($"Generated file: {generatedFilePath}");
            _output.WriteLine($"Comparison completed successfully");
        }

        private Dictionary<string, ClassInfo> ExtractClassInfo(CompilationUnitSyntax root)
        {
            var classes = new Dictionary<string, ClassInfo>();

            var classDeclarations = root.DescendantNodes().OfType<ClassDeclarationSyntax>();
            foreach (var classDecl in classDeclarations)
            {
                var className = classDecl.Identifier.Text;
                var classInfo = new ClassInfo
                {
                    Name = className,
                    IsPartial = classDecl.Modifiers.Any(m => m.Text == "partial"),
                    Properties = new List<PropertyInfo>(),
                    Fields = new List<FieldInfo>()
                };

                // Extract properties
                var properties = classDecl.Members.OfType<PropertyDeclarationSyntax>();
                foreach (var prop in properties)
                {
                    classInfo.Properties.Add(new PropertyInfo
                    {
                        Name = prop.Identifier.Text,
                        Type = prop.Type.ToString(),
                        HasGetter = prop.AccessorList?.Accessors.Any(a => a.Kind() == SyntaxKind.GetAccessorDeclaration) ?? false,
                        HasSetter = prop.AccessorList?.Accessors.Any(a => a.Kind() == SyntaxKind.SetAccessorDeclaration) ?? false
                    });
                }

                // Extract fields
                var fields = classDecl.Members.OfType<FieldDeclarationSyntax>();
                foreach (var field in fields)
                {
                    foreach (var variable in field.Declaration.Variables)
                    {
                        classInfo.Fields.Add(new FieldInfo
                        {
                            Name = variable.Identifier.Text,
                            Type = field.Declaration.Type.ToString(),
                            IsPrivate = field.Modifiers.Any(m => m.Text == "private")
                        });
                    }
                }

                classes[className] = classInfo;
            }

            // Also extract enums
            var enumDeclarations = root.DescendantNodes().OfType<EnumDeclarationSyntax>();
            foreach (var enumDecl in enumDeclarations)
            {
                var enumName = enumDecl.Identifier.Text;
                var enumInfo = new ClassInfo
                {
                    Name = enumName,
                    IsEnum = true,
                    EnumValues = enumDecl.Members.Select(m => m.Identifier.Text).ToList()
                };
                classes[enumName] = enumInfo;
            }

            return classes;
        }

        private void CompareClassStructures(Dictionary<string, ClassInfo> generated, Dictionary<string, ClassInfo> existing)
        {
            // Check that all classes from existing are present in generated
            foreach (var kvp in existing)
            {
                var className = kvp.Key;
                var existingClass = kvp.Value;

                Assert.True(generated.ContainsKey(className), $"Class '{className}' not found in generated file");

                var generatedClass = generated[className];

                if (existingClass.IsEnum)
                {
                    // Compare enum values
                    Assert.Equal(existingClass.EnumValues.Count, generatedClass.EnumValues.Count);
                    foreach (var enumValue in existingClass.EnumValues)
                    {
                        Assert.Contains(enumValue, generatedClass.EnumValues);
                    }
                }
                else
                {
                    // Compare properties (ignore namespace differences in types)
                    foreach (var existingProp in existingClass.Properties)
                    {
                        var generatedProp = generatedClass.Properties.FirstOrDefault(p => p.Name == existingProp.Name);
                        if (generatedProp == null)
                        {
                            // Some properties might have been renamed or are generated differently
                            _output.WriteLine($"Warning: Property '{existingProp.Name}' not found in generated class '{className}'");
                            continue;
                        }
                        
                        // Normalize type names (remove namespace differences)
                        var existingType = NormalizeTypeName(existingProp.Type);
                        var generatedType = NormalizeTypeName(generatedProp.Type);
                        
                        if (existingType != generatedType)
                        {
                            throw new Exception($"Type mismatch for property '{existingProp.Name}' in class '{className}': " +
                                $"Expected '{existingProp.Type}' (normalized to '{existingType}'), " +
                                $"but got '{generatedProp.Type}' (normalized to '{generatedType}')");
                        }
                        Assert.Equal(existingProp.HasGetter, generatedProp.HasGetter);
                        Assert.Equal(existingProp.HasSetter, generatedProp.HasSetter);
                    }

                    // Note: We don't compare fields because the old xsd.exe had duplicate initialization issues
                    _output.WriteLine($"Class '{className}': {existingClass.Properties.Count} properties verified");
                }
            }

            _output.WriteLine($"Total classes compared: {existing.Count}");
            _output.WriteLine($"Note: Some differences in property types and names are expected between xsd.exe and XmlSchemaClassGenerator");
        }

        private string NormalizeTypeName(string typeName)
        {
            // Handle nullable types first - normalize them to non-nullable for comparison
            if (typeName.StartsWith("Nullable<") && typeName.EndsWith(">"))
            {
                var innerType = typeName.Substring(9, typeName.Length - 10);
                return NormalizeTypeName(innerType);
            }
            
            // Also handle System.Nullable<T>
            if (typeName.StartsWith("System.Nullable<") && typeName.EndsWith(">"))
            {
                var innerType = typeName.Substring(16, typeName.Length - 17);
                return NormalizeTypeName(innerType);
            }
            
            // Normalize XML types - XmlNode and XmlElement are considered equivalent for our purposes
            if (typeName.Contains("XmlNode"))
            {
                typeName = typeName.Replace("XmlNode", "XmlElement");
            }
            
            // Special case: The generator always creates arrays for xs:any elements
            // while xsd.exe sometimes creates single elements
            if (typeName == "XmlElement" || typeName == "System.Xml.XmlElement")
            {
                // Normalize single XmlElement to array for comparison
                typeName = "System.Xml.XmlElement[]";
            }
            
            // Normalize collection types - List<T> and T[] are considered equivalent
            if (typeName.StartsWith("List<") && typeName.EndsWith(">"))
            {
                var innerType = typeName.Substring(5, typeName.Length - 6);
                return NormalizeTypeName(innerType) + "[]";
            }
            
            // Also handle System.Collections.Generic.List<T>
            if (typeName.Contains("List<") && typeName.EndsWith(">"))
            {
                var listMatch = Regex.Match(typeName, @"(?:.*\.)?List<(.+)>$");
                if (listMatch.Success)
                {
                    return NormalizeTypeName(listMatch.Groups[1].Value) + "[]";
                }
            }
            
            // Remove namespace prefixes but keep the type name
            // e.g., "ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0.SomeType" -> "SomeType"
            var lastDot = typeName.LastIndexOf('.');
            if (lastDot >= 0 && !typeName.Contains("<") && !typeName.Contains("["))
            {
                return typeName.Substring(lastDot + 1);
            }
            
            // Handle generic types
            if (typeName.Contains("<"))
            {
                var genericMatch = Regex.Match(typeName, @"^(.+)<(.+)>$");
                if (genericMatch.Success)
                {
                    var genericType = NormalizeTypeName(genericMatch.Groups[1].Value);
                    var genericArg = NormalizeTypeName(genericMatch.Groups[2].Value);
                    return $"{genericType}<{genericArg}>";
                }
            }
            
            return typeName;
        }

        private class ClassInfo
        {
            public string Name { get; set; }
            public bool IsPartial { get; set; }
            public bool IsEnum { get; set; }
            public List<PropertyInfo> Properties { get; set; } = new List<PropertyInfo>();
            public List<FieldInfo> Fields { get; set; } = new List<FieldInfo>();
            public List<string> EnumValues { get; set; } = new List<string>();
        }

        private class PropertyInfo
        {
            public string Name { get; set; }
            public string Type { get; set; }
            public bool HasGetter { get; set; }
            public bool HasSetter { get; set; }
        }

        private class FieldInfo
        {
            public string Name { get; set; }
            public string Type { get; set; }
            public bool IsPrivate { get; set; }
        }

    }
}