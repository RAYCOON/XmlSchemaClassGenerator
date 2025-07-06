using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using Xunit;
using XmlSchemaClassGenerator;
using XmlSchemaClassGenerator.Console;

namespace XmlSchemaClassGenerator.Tests
{
    public class EessiBatchPatternTests : IDisposable
    {
        private readonly string _tempDir;
        private readonly List<string> _tempFiles = new List<string>();

        public EessiBatchPatternTests()
        {
            _tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
            Directory.CreateDirectory(_tempDir);
        }

        public void Dispose()
        {
            if (Directory.Exists(_tempDir))
                Directory.Delete(_tempDir, true);
        }

        private string CreateEessiXsd(string docType, string version, string timestamp = "20241203T114133")
        {
            var fileName = $"{docType}-{version}-{timestamp}.xsd";
            var filePath = Path.Combine(_tempDir, fileName);
            
            var content = $@"<?xml version=""1.0"" encoding=""utf-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"" 
           targetNamespace=""http://ec.europa.eu/eessi/ns/{version.Replace('.', '_')}/{docType}""
           elementFormDefault=""qualified"">
  <xs:element name=""{docType}"" type=""xs:string"" />
</xs:schema>";
            
            File.WriteAllText(filePath, content);
            _tempFiles.Add(filePath);
            return filePath;
        }

        [Fact]
        public void BatchProcess_MultipleEessiFiles_GeneratesCorrectNamespaces()
        {
            // Arrange
            CreateEessiXsd("A008", "4.4.0");
            CreateEessiXsd("A009", "4.4.1");
            CreateEessiXsd("DA003", "4.4.1");
            CreateEessiXsd("S071", "4.4.0");

            var config = new SimpleConfiguration
            {
                OutputDirectory = Path.Combine(_tempDir, "output"),
                GenerateChoiceItemProperty = true,
                CollectionType = "System.Array",
                SourceDirectories = new List<string> { _tempDir },
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)",
                        Template = "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                        Transforms = new Dictionary<string, string>
                        {
                            ["ver"] = "dots_to_underscores"
                        }
                    }
                }
            };

            var configPath = Path.Combine(_tempDir, "config.json");
            File.WriteAllText(configPath, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", configPath, "--ctor" });

            // Assert
            Assert.Equal(0, result);
            
            // Verify output files exist with correct namespaces
            var outputDir = Path.Combine(_tempDir, "output");
            Assert.True(Directory.Exists(outputDir));
            
            var generatedFiles = Directory.GetFiles(outputDir, "*.cs", SearchOption.AllDirectories);
            Assert.NotEmpty(generatedFiles);
            
            // Check namespace in generated files
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0");
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A009.V4_4_1");
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.DA003.V4_4_1");
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.S071.V4_4_0");
        }

        [Fact]
        public void SingleFile_WithPattern_GeneratesCorrectly()
        {
            // Arrange
            var xsdFile = CreateEessiXsd("A008", "4.4.0");
            var outputFile = Path.Combine(_tempDir, "output.cs");

            // Act
            var result = Program.Main(new[]
            {
                "--single-file",
                "--gi",
                "--ua",
                "--ctor",
                "--file-pattern", @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                "--pattern-transform", "ver=dots_to_underscores",
                "-o", outputFile,
                xsdFile
            });

            // Assert
            Assert.Equal(0, result);
            
            // Verify single file was created
            var singleFileOutput = Path.Combine(outputFile, "output.cs");
            Assert.True(File.Exists(singleFileOutput));
            
            var content = File.ReadAllText(singleFileOutput);
            Assert.Contains("namespace ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0", content);
        }

        [Fact]
        public void XmlNamespacePattern_WorksWithEessi()
        {
            // Arrange
            var xsdFile = CreateEessiXsd("A009", "4.4.1");
            var outputDir = Path.Combine(_tempDir, "xml-pattern-output");

            // Act
            var result = Program.Main(new[]
            {
                "--xml-pattern", @"http://ec\.europa\.eu/eessi/ns/(?<ver>[^/]+)/(?<doc>[A-Z]+[0-9]+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                "--pattern-transform", "ver=dots_to_underscores",
                "-o", outputDir,
                xsdFile
            });

            // Assert
            Assert.Equal(0, result);
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A009.V4_4_1");
        }

        [Fact]
        public void MixedVersions_HandledCorrectly()
        {
            // Arrange
            CreateEessiXsd("A001", "4.4.0");
            CreateEessiXsd("A001", "4.4.1"); 
            CreateEessiXsd("A001", "4.5.0");

            var outputDir = Path.Combine(_tempDir, "mixed-versions");

            // Act
            var result = Program.Main(new[]
            {
                "--directory", _tempDir,
                "--file-pattern", @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                "--pattern-transform", "ver=dots_to_underscores",
                "-o", outputDir
            });

            // Assert
            Assert.Equal(0, result);
            
            // All versions should be generated with different namespaces
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A001.V4_4_0");
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A001.V4_4_1");
            AssertFileContainsNamespace(outputDir, "namespace ITSG.EESSI.Tstelle.XML.SED.A001.V4_5_0");
        }

        [Fact]
        public void FallbackStrategy_WorksWhenPatternDoesntMatch()
        {
            // Arrange
            var nonMatchingFile = Path.Combine(_tempDir, "non-eessi-file.xsd");
            File.WriteAllText(nonMatchingFile, @"<?xml version=""1.0"" encoding=""utf-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""Test"" type=""xs:string"" />
</xs:schema>");

            var outputDir = Path.Combine(_tempDir, "fallback-output");

            // Act
            var result = Program.Main(new[]
            {
                "--file-pattern", @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                "--default-namespace-strategy", "UseFilename",
                "-o", outputDir,
                nonMatchingFile
            });

            // Assert
            Assert.Equal(0, result);
            
            // Should use filename as namespace
            AssertFileContainsNamespace(outputDir, "namespace NonEessiFile");
        }

        [Fact]
        public void ComplexTransformations_AppliedCorrectly()
        {
            // Arrange
            var xsdFile = CreateEessiXsd("da-test", "1.2.3");
            var outputDir = Path.Combine(_tempDir, "transform-output");

            // Act
            var result = Program.Main(new[]
            {
                "--file-pattern", @"(?<doc>[a-z-]+)-(?<ver>\d+\.\d+\.\d+)=Test.{doc}.V{ver}",
                "--pattern-transform", "ver=dots_to_underscores",
                "--pattern-transform", "doc=uppercase",
                "--pattern-transform", "doc=remove_hyphens",
                "-o", outputDir,
                xsdFile
            });

            // Assert
            Assert.Equal(0, result);
            
            // doc should be uppercase and without hyphens, ver should have underscores
            AssertFileContainsNamespace(outputDir, "namespace Test.DATEST.V1_2_3");
        }

        private void AssertFileContainsNamespace(string directory, string expectedNamespace)
        {
            var files = Directory.GetFiles(directory, "*.cs", SearchOption.AllDirectories);
            var found = files.Any(file => 
            {
                var content = File.ReadAllText(file);
                return content.Contains(expectedNamespace);
            });
            
            Assert.True(found, $"Expected namespace '{expectedNamespace}' not found in any generated files");
        }
    }
}