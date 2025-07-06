using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using Xunit;
using XmlSchemaClassGenerator.Console;

namespace XmlSchemaClassGenerator.Tests
{
    public class PatternConfigurationTests : IDisposable
    {
        private readonly string _tempConfigFile;
        private readonly string _tempXsdFile;

        public PatternConfigurationTests()
        {
            _tempConfigFile = Path.GetTempFileName();
            _tempXsdFile = Path.GetTempFileName();
            
            File.WriteAllText(_tempXsdFile, @"<?xml version=""1.0"" encoding=""utf-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"" 
           targetNamespace=""http://example.com/test""
           elementFormDefault=""qualified"">
  <xs:element name=""Test"" type=""xs:string"" />
</xs:schema>");
        }

        public void Dispose()
        {
            if (File.Exists(_tempConfigFile))
                File.Delete(_tempConfigFile);
            if (File.Exists(_tempXsdFile))
                File.Delete(_tempXsdFile);
                
            // Clean up any generated files
            var outputDir = Path.Combine(Directory.GetCurrentDirectory(), "generated");
            if (Directory.Exists(outputDir))
                Directory.Delete(outputDir, true);
        }

        [Fact]
        public void FilenamePatterns_LoadedFromConfig()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @"(?<doc>[A-Z]+)-(?<ver>\d+\.\d+)",
                        Template = "MyApp.{doc}.V{ver}",
                        Transforms = new Dictionary<string, string>
                        {
                            ["ver"] = "dots_to_underscores"
                        },
                        Priority = 10
                    }
                }
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void XmlNamespacePatterns_LoadedFromConfig()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                XmlNamespacePatterns = new List<XmlNamespacePatternMapping>
                {
                    new XmlNamespacePatternMapping
                    {
                        Pattern = @"http://example\.com/(?<name>\w+)",
                        Template = "MyApp.{name}",
                        Transforms = null,
                        Priority = 1
                    }
                }
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void DefaultNamespaceStrategy_LoadedFromConfig()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                DefaultNamespaceStrategy = "UseFilename"
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void DefaultNamespaceTemplate_LoadedFromConfig()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                DefaultNamespaceStrategy = "UseTemplate",
                DefaultNamespaceTemplate = "Generated.{filename}.{lastsegment}"
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void ComplexEESSIConfig_Works()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                GenerateNullables = false,
                GenerateChoiceItemProperty = true,
                UsePascalCase = true,
                SeparateFiles = false,
                CollectionType = "System.Array",
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)",
                        Template = "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                        Transforms = new Dictionary<string, string>
                        {
                            ["ver"] = "dots_to_underscores"
                        },
                        Priority = 1
                    }
                },
                XmlNamespacePatterns = new List<XmlNamespacePatternMapping>
                {
                    new XmlNamespacePatternMapping
                    {
                        Pattern = @"http://ec\.europa\.eu/eessi/ns/(?<ver>[^/]+)/(?<doc>[A-Z]+[0-9]+)",
                        Template = "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                        Transforms = new Dictionary<string, string>
                        {
                            ["ver"] = "dots_to_underscores"
                        }
                    }
                },
                DefaultNamespaceStrategy = "UseFilename",
                DefaultNamespaceTemplate = "ITSG.EESSI.Tstelle.XML.Generated.{filename}"
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config, new JsonSerializerOptions 
            { 
                WriteIndented = true 
            }));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, "--ctor", _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void MultiplePatternsWithPriority_LoadedInOrder()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @".*",
                        Template = "LowPriority",
                        Priority = 100
                    },
                    new FilenamePatternMapping
                    {
                        Pattern = @"test.*",
                        Template = "HighPriority",
                        Priority = 1
                    }
                }
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void ConfigWithSourceDirectories_Works()
        {
            // Arrange
            var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
            Directory.CreateDirectory(tempDir);
            
            var xsdPath = Path.Combine(tempDir, "test.xsd");
            File.Copy(_tempXsdFile, xsdPath);

            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                SourceDirectories = new List<string> { tempDir },
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @"(?<name>\w+)",
                        Template = "Test.{name}"
                    }
                }
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            try
            {
                // Act
                var result = Program.Main(new[] { "--config", _tempConfigFile });

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                Directory.Delete(tempDir, true);
            }
        }

        [Fact]
        public void EmptyPatternsConfig_DoesNotCrash()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                FilenamePatterns = new List<FilenamePatternMapping>(),
                XmlNamespacePatterns = new List<XmlNamespacePatternMapping>()
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void NullTransformsInConfig_HandledGracefully()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "generated",
                FilenamePatterns = new List<FilenamePatternMapping>
                {
                    new FilenamePatternMapping
                    {
                        Pattern = @"(?<name>\w+)",
                        Template = "Test.{name}",
                        Transforms = null
                    }
                }
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act
            var result = Program.Main(new[] { "--config", _tempConfigFile, _tempXsdFile });

            // Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void CommandLineOverridesConfig()
        {
            // Arrange
            var config = new SimpleConfiguration
            {
                OutputDirectory = "from-config",
                DefaultNamespaceStrategy = "UseFilename"
            };

            File.WriteAllText(_tempConfigFile, JsonSerializer.Serialize(config));

            // Act - command line should override config
            var result = Program.Main(new[] 
            { 
                "--config", _tempConfigFile,
                "--default-namespace-strategy", "UseXmlNamespace",
                "-o", "from-commandline",
                _tempXsdFile 
            });

            // Assert
            Assert.Equal(0, result);
            
            // Cleanup
            var outputDir = Path.Combine(Directory.GetCurrentDirectory(), "from-commandline");
            if (Directory.Exists(outputDir))
                Directory.Delete(outputDir, true);
        }
    }
}