using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace XmlSchemaClassGenerator.Tests
{
    public class RequiredFieldsAnalysisTest
    {
        private readonly ITestOutputHelper _output;
        private readonly string _eessiSchemaPath;

        public RequiredFieldsAnalysisTest(ITestOutputHelper output)
        {
            _output = output;
            _eessiSchemaPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "xsd", "eessi");
        }

        [Fact]
        public void AnalyzeRequiredFieldPatterns()
        {
            // Test with S071 to understand the patterns
            var testFile = Path.Combine(_eessiSchemaPath, "S071-4.4.0-20241203T114131.xsd");
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
                DataAnnotationMode = DataAnnotationMode.All,
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

            // Get ALL required fields (including structural)
            var allRequiredFields = factory.GetRequiredPropertyPaths()
                .OrderBy(f => f)
                .ToList();
            
            // Get only BUSINESS required fields (excluding structural)
            var businessRequiredFields = factory.GetBusinessRequiredPropertyPaths()
                .OrderBy(f => f)
                .ToList();

            _output.WriteLine("=== COMPARISON: All Required vs Business Required Fields ===");
            _output.WriteLine($"Total ALL required fields: {allRequiredFields.Count}");
            _output.WriteLine($"Total BUSINESS required fields: {businessRequiredFields.Count}");
            _output.WriteLine($"Structural fields filtered out: {allRequiredFields.Count - businessRequiredFields.Count}");

            // Analyze what was filtered out
            var structuralFields = allRequiredFields.Except(businessRequiredFields).ToList();
            var valueFields = structuralFields.Where(f => f.EndsWith(".Value")).ToList();
            var signatureFields = structuralFields.Where(f => f.Contains("Signature")).ToList();
            var algorithmFields = structuralFields.Where(f => f.Contains("Algorithm")).ToList();

            _output.WriteLine($"\n=== Structural Fields Breakdown ===");
            _output.WriteLine($"'Value' fields (enums): {valueFields.Count}");
            foreach (var field in valueFields.Take(5))
            {
                _output.WriteLine($"  - {field}");
            }
            if (valueFields.Count > 5)
                _output.WriteLine($"  ... and {valueFields.Count - 5} more");

            _output.WriteLine($"\nSignature fields: {signatureFields.Count}");
            foreach (var field in signatureFields.Take(5))
            {
                _output.WriteLine($"  - {field}");
            }
            if (signatureFields.Count > 5)
                _output.WriteLine($"  ... and {signatureFields.Count - 5} more");

            _output.WriteLine($"\nAlgorithm fields: {algorithmFields.Count}");
            foreach (var field in algorithmFields.Take(5))
            {
                _output.WriteLine($"  - {field}");
            }

            _output.WriteLine($"\n=== Business Required Fields ===");
            _output.WriteLine($"Total business fields: {businessRequiredFields.Count}");
            
            // Show some business field patterns
            var personFields = businessRequiredFields.Where(f => f.Contains("Person")).Take(10).ToList();
            _output.WriteLine($"\nPerson-related business fields:");
            foreach (var field in personFields)
            {
                _output.WriteLine($"  - {field}");
            }

            var dateFields = businessRequiredFields.Where(f => f.Contains("Date")).Take(10).ToList();
            _output.WriteLine($"\nDate-related business fields:");
            foreach (var field in dateFields)
            {
                _output.WriteLine($"  - {field}");
            }

            var benefitFields = businessRequiredFields.Where(f => f.Contains("Benefit")).Take(10).ToList();
            _output.WriteLine($"\nBenefit-related business fields:");
            foreach (var field in benefitFields)
            {
                _output.WriteLine($"  - {field}");
            }

            // Show first 20 business fields
            _output.WriteLine($"\nFirst 20 business required fields:");
            foreach (var field in businessRequiredFields.Take(20))
            {
                _output.WriteLine($"  - {field}");
            }
            if (businessRequiredFields.Count > 20)
                _output.WriteLine($"  ... and {businessRequiredFields.Count - 20} more");

            // Test passes - output will be shown in test results
            Assert.True(businessRequiredFields.Count < allRequiredFields.Count, 
                "Business required fields should be fewer than all required fields");
        }
    }
}