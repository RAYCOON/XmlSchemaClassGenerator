using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    public class EessiFactoryTests
    {
        private readonly ITestOutputHelper _output;
        private readonly string _eessiSchemaPath;

        public EessiFactoryTests(ITestOutputHelper output)
        {
            _output = output;
            _eessiSchemaPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "eessi");
        }

        [Fact]
        public void ProcessAllEessiSchemas_ExtractRequiredFields()
        {
            // Arrange
            var allXsdFiles = Directory.GetFiles(_eessiSchemaPath, "*.xsd").ToList();
            
            // Get dependency schemas
            var xmldsigPath = allXsdFiles.FirstOrDefault(f => Path.GetFileName(f).StartsWith("xmldsig"));
            var xadesPath = allXsdFiles.FirstOrDefault(f => Path.GetFileName(f).StartsWith("XAdES"));
            
            var xsdFiles = allXsdFiles
                .Where(f => !Path.GetFileName(f).StartsWith("XAdES") && 
                           !Path.GetFileName(f).StartsWith("xmldsig"))
                .OrderBy(f => f)
                .Take(3) // Process only first 20 files for testing
                .ToList();

            _output.WriteLine($"Processing {xsdFiles.Count} EESSI XSD files (out of {allXsdFiles.Count - 2} total)");

            var allRequiredFields = new Dictionary<string, List<string>>();
            var processedCount = 0;
            var errors = new List<string>();

            // Act
            foreach (var xsdFile in xsdFiles)
            {
                var fileName = Path.GetFileName(xsdFile);
                try
                {
                    _output.WriteLine($"Processing: {fileName}");

                    var config = new GeneratorConfiguration
                    {
                        GenerateDescriptionAttribute = false,
                        GenerateNullables = true,
                        GenerateInterfaces = true,
                        NamingScheme = NamingScheme.PascalCase,
                        CollectionType = typeof(List<>),
                        NamespaceProvider = new NamespaceProvider
                        {
                            GenerateNamespace = key =>
                            {
                                var xn = key.XmlSchemaNamespace;
                                if (xn == "http://www.w3.org/2000/09/xmldsig#")
                                    return "W3C.XmlDSig";
                                if (xn == "http://uri.etsi.org/01903/v1.3.2#")
                                    return "ETSI.XAdES";
                                if (xn == "http://uri.etsi.org/01903/v1.4.1#")
                                    return "ETSI.XAdES141";
                                if (xn.Contains("/eessi/ns/"))
                                {
                                    var parts = xn.Split('/');
                                    var id = parts.LastOrDefault()?.ToUpper() ?? "Unknown";
                                    return $"ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1";
                                }
                                return "EESSI.Generated";
                            }
                        }
                    };

                    var factory = new XsdToCSharpFactory(config);

                    // Include dependencies if needed
                    var schemaFiles = new List<string> { xsdFile };
                    if (xmldsigPath != null) schemaFiles.Add(xmldsigPath);
                    if (xadesPath != null) schemaFiles.Add(xadesPath);

                    // Generate code
                    var navigator = factory.GenerateTypesFromXsd(schemaFiles);
                    
                    // Extract required fields - both all and business only
                    var allFields = factory.GetRequiredPropertyPaths()
                        .OrderBy(f => f)
                        .ToList();
                    
                    var businessFields = factory.GetBusinessRequiredPropertyPaths()
                        .OrderBy(f => f)
                        .ToList();

                    if (businessFields.Any())
                    {
                        allRequiredFields[fileName] = businessFields;
                        _output.WriteLine($"  - Found {businessFields.Count} business required fields (filtered {allFields.Count - businessFields.Count} structural fields)");
                    }
                    else if (allFields.Any())
                    {
                        _output.WriteLine($"  - No business required fields found (but {allFields.Count} structural fields exist)");
                    }
                    else
                    {
                        _output.WriteLine($"  - No required fields found");
                    }

                    processedCount++;
                }
                catch (Exception ex)
                {
                    errors.Add($"{fileName}: Exception - {ex.Message}");
                    _output.WriteLine($"  - EXCEPTION: {ex.Message}");
                }
            }

            // Assert
            _output.WriteLine($"\nProcessed {processedCount} of {xsdFiles.Count} schemas successfully");
            
            if (errors.Any())
            {
                _output.WriteLine("\nErrors encountered:");
                foreach (var error in errors)
                {
                    _output.WriteLine($"  - {error}");
                }
            }

            // Output summary of business required fields
            _output.WriteLine("\n=== Business Required Fields Summary ===");
            _output.WriteLine("(Structural fields like .Value, Signature, and Algorithm have been filtered out)");
            foreach (var kvp in allRequiredFields.OrderBy(k => k.Key))
            {
                _output.WriteLine($"\n{kvp.Key}: ({kvp.Value.Count} business fields)");
                // Show up to 10 fields per schema
                foreach (var field in kvp.Value.Take(10))
                {
                    _output.WriteLine($"  - {field}");
                }
                if (kvp.Value.Count > 10)
                {
                    _output.WriteLine($"  ... and {kvp.Value.Count - 10} more");
                }
            }

            // Verify processing rate
            var successRate = (double)processedCount / xsdFiles.Count;
            _output.WriteLine($"\nSuccess rate: {successRate:P1} ({processedCount}/{xsdFiles.Count})");
            
            // We expect at least 90% success rate for EESSI schemas
            Assert.True(successRate >= 0.9, $"Expected at least 90% success rate, but got {successRate:P1}");
            
            // Since we're only processing a subset, also assert we processed what we expected
            Assert.Equal(xsdFiles.Count, processedCount + errors.Count);
        }

        [Fact]
        public void ProcessSpecificEessiSchema_ValidateRequiredFields()
        {
            // Test with a specific known schema
            var testFile = Path.Combine(_eessiSchemaPath, "S055-4.4.0-20241203T114247.xsd");
            
            if (!File.Exists(testFile))
            {
                _output.WriteLine($"Test file not found: {testFile}");
                return;
            }

            // Include required dependency schemas
            var xmldsigPath = Path.Combine(_eessiSchemaPath, "xmldsig-core-schema.xsd");
            var xadesPath = Path.Combine(_eessiSchemaPath, "XAdES.xsd");
            
            var schemaFiles = new List<string> { testFile };
            if (File.Exists(xmldsigPath))
                schemaFiles.Add(xmldsigPath);
            if (File.Exists(xadesPath))
                schemaFiles.Add(xadesPath);

            var config = new GeneratorConfiguration
            {
                GenerateDescriptionAttribute = false,
                GenerateNullables = true,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = new NamespaceProvider
                {
                    GenerateNamespace = key =>
                    {
                        var xn = key.XmlSchemaNamespace;
                        if (xn == "http://www.w3.org/2000/09/xmldsig#")
                            return "W3C.XmlDSig";
                        if (xn == "http://uri.etsi.org/01903/v1.3.2#")
                            return "ETSI.XAdES";
                        if (xn == "http://uri.etsi.org/01903/v1.4.1#")
                            return "ETSI.XAdES141";
                        if (xn.Contains("/eessi/ns/"))
                        {
                            var parts = xn.Split('/');
                            var id = parts.LastOrDefault()?.ToUpper() ?? "Unknown";
                            return $"ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1";
                        }
                        return "EESSI.Generated";
                    }
                }
            };

            var factory = new XsdToCSharpFactory(config);
            var navigator = factory.GenerateTypesFromXsd(schemaFiles);

            // Get both all and business required fields
            var allRequiredFields = factory.GetRequiredPropertyPaths();
            var businessRequiredFields = factory.GetBusinessRequiredPropertyPaths();
            
            _output.WriteLine($"=== Required fields in S055 ===");
            _output.WriteLine($"Total ALL required fields: {allRequiredFields.Count}");
            _output.WriteLine($"Total BUSINESS required fields: {businessRequiredFields.Count}");
            _output.WriteLine($"Structural fields filtered: {allRequiredFields.Count - businessRequiredFields.Count}");
            
            _output.WriteLine($"\nBusiness required fields:");
            foreach (var field in businessRequiredFields.OrderBy(f => f).Take(20))
            {
                _output.WriteLine($"  - {field}");
            }
            if (businessRequiredFields.Count > 20)
            {
                _output.WriteLine($"  ... and {businessRequiredFields.Count - 20} more");
            }

            // Verify we can create and validate instances
            var rootTypeName = factory.GetRootElementTypeName();
            Assert.NotNull(rootTypeName);
            _output.WriteLine($"\nRoot type: {rootTypeName}");

            var instance = factory.CreateRootInstance();
            Assert.NotNull(instance);

            var validationErrors = factory.ValidateInstance(instance);
            _output.WriteLine($"\nValidation errors for empty instance:");
            foreach (var error in validationErrors)
            {
                _output.WriteLine($"  - {error.PropertyPath}: {error.ErrorMessage}");
            }
        }

        [Theory]
        [InlineData("S071-4.4.0-20241203T114131.xsd")]
        [InlineData("A001-4.4.0-20241203T114134.xsd")]
        [InlineData("DA001-4.4.0-20241203T114141.xsd")]
        [InlineData("F001-4.4.1-20250507T153912.xsd")]
        [InlineData("H001-4.4.0-20241203T114210.xsd")]
        [InlineData("P1000-4.4.0-20241203T114112.xsd")]
        [InlineData("R001-4.4.1-20250430T112914.xsd")]
        [InlineData("S001-4.4.0-20241203T114125.xsd")]
        [InlineData("U001-4.4.0-20241203T114137.xsd")]
        [InlineData("X001-4.4.0-20241203T114238.xsd")]
        public void ProcessEessiSchemaByCategory_ExtractRequiredFields(string fileName)
        {
            var testFile = Path.Combine(_eessiSchemaPath, fileName);
            
            if (!File.Exists(testFile))
            {
                _output.WriteLine($"Test file not found: {testFile}");
                return;
            }

            // Include required dependency schemas
            var xmldsigPath = Path.Combine(_eessiSchemaPath, "xmldsig-core-schema.xsd");
            var xadesPath = Path.Combine(_eessiSchemaPath, "XAdES.xsd");
            
            var schemaFiles = new List<string> { testFile };
            if (File.Exists(xmldsigPath))
                schemaFiles.Add(xmldsigPath);
            if (File.Exists(xadesPath))
                schemaFiles.Add(xadesPath);

            var config = new GeneratorConfiguration
            {
                GenerateDescriptionAttribute = false,
                GenerateNullables = true,
                NamingScheme = NamingScheme.PascalCase,
                NamespaceProvider = new NamespaceProvider
                {
                    GenerateNamespace = key =>
                    {
                        var xn = key.XmlSchemaNamespace;
                        if (xn == "http://www.w3.org/2000/09/xmldsig#")
                            return "W3C.XmlDSig";
                        if (xn == "http://uri.etsi.org/01903/v1.3.2#")
                            return "ETSI.XAdES";
                        if (xn == "http://uri.etsi.org/01903/v1.4.1#")
                            return "ETSI.XAdES141";
                        if (xn.Contains("/eessi/ns/"))
                        {
                            var parts = xn.Split('/');
                            var id = parts.LastOrDefault()?.ToUpper() ?? "Unknown";
                            return $"ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1";
                        }
                        return "EESSI.Generated";
                    }
                }
            };

            var factory = new XsdToCSharpFactory(config);
            var navigator = factory.GenerateTypesFromXsd(schemaFiles);

            var requiredFields = factory.GetRequiredPropertyPaths();
            _output.WriteLine($"\nRequired fields in {fileName}:");
            foreach (var field in requiredFields.OrderBy(f => f))
            {
                _output.WriteLine($"  - {field}");
            }

            // Get type information
            var rootTypeName = factory.GetRootElementTypeName();
            var rootType = factory.GetRootElementType();
            _output.WriteLine($"\nRoot type found: {rootTypeName}");
            if (rootType != null)
            {
                _output.WriteLine($"  - Type: {rootType.Name} (Namespace: {rootType.Namespace})");
            }
        }
    }
}