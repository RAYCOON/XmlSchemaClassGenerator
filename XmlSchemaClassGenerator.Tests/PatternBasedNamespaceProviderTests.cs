using System;
using System.Collections.Generic;
using Xunit;
using XmlSchemaClassGenerator;

namespace XmlSchemaClassGenerator.Tests
{
    public class PatternBasedNamespaceProviderTests
    {
        private GeneratorConfiguration CreateTestConfiguration()
        {
            return new GeneratorConfiguration
            {
                NamingScheme = NamingScheme.PascalCase
            };
        }

        [Fact]
        public void FilenamePattern_SimpleMatch_ExtractsAndTransforms()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)",
                        "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> { ["ver"] = "dots_to_underscores" }
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("A008-4.4.0-20241203T114133.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0", result);
        }

        [Fact]
        public void XmlNamespacePattern_SimpleMatch_ExtractsGroups()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"http://ec\.europa\.eu/eessi/ns/(?<ver>[^/]+)/(?<doc>[A-Z]+[0-9]+)",
                        "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}")
                    {
                        Source = "XmlNamespace"
                    }
                }
            };

            var key = new NamespaceKey(null, "http://ec.europa.eu/eessi/ns/4_4/A008");

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.A008.V4_4", result);
        }

        [Fact]
        public void Transform_DotsToUnderscores_Works()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"test-(?<version>\d+\.\d+\.\d+)",
                        "Test.V{version}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> { ["version"] = "dots_to_underscores" }
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("test-1.2.3.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.V1_2_3", result);
        }

        [Fact]
        public void Transform_Uppercase_Works()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<name>[a-z]+)",
                        "Test.{name}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> { ["name"] = "uppercase" }
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("hello.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.HELLO", result);
        }

        [Fact]
        public void Transform_Lowercase_Works()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<name>[A-Z]+)",
                        "Test.{name}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> { ["name"] = "lowercase" }
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("HELLO.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.hello", result);
        }

        [Fact]
        public void Transform_RemoveHyphens_Works()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<name>[a-z-]+)",
                        "Test.{name}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> { ["name"] = "remove_hyphens" }
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("hello-world-test.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.helloworldtest", result);
        }

        [Fact]
        public void Priority_LowerPriorityMatchesFirst()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@".*", "Second") { Source = "Filename", Priority = 200 },
                    new NamespacePattern(@".*", "First") { Source = "Filename", Priority = 100 }
                }
            };

            var key = new NamespaceKey(new System.Uri("test.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("First", result);
        }

        [Fact]
        public void MultipleGroups_AllReplaced()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<type>[A-Z]+)-(?<num>\d+)-(?<ver>\d+\.\d+)",
                        "{type}.Number{num}.Version{ver}")
                    {
                        Source = "Filename"
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("TEST-123-4.5.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("TEST.Number123.Version4.5", result);
        }

        [Fact]
        public void NoMatch_FallsBackToDefault_AutoGenerate()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@"specific-pattern", "Matched")
                    {
                        Source = "Filename"
                    }
                },
                DefaultStrategy = DefaultNamespaceStrategy.AutoGenerate
            };

            var key = new NamespaceKey(null, "http://example.com/test");

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Null(result); // AutoGenerate returns null to trigger existing logic
        }

        [Fact]
        public void DefaultStrategy_UseFilename_ExtractsFilename()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@"will-not-match", "Matched")
                    {
                        Source = "Filename"
                    }
                },
                DefaultStrategy = DefaultNamespaceStrategy.UseFilename
            };

            var key = new NamespaceKey(new System.Uri("MySchema.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("MySchema", result);
        }

        [Fact]
        public void DefaultStrategy_UseXmlNamespace_ExtractsLastSegment()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@"will-not-match", "Matched")
                    {
                        Source = "XmlNamespace"
                    }
                },
                DefaultStrategy = DefaultNamespaceStrategy.UseXmlNamespace
            };

            var key = new NamespaceKey(null, "http://example.com/schemas/MyType");

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("MyType", result);
        }

        [Fact]
        public void DefaultStrategy_UseTemplate_AppliesTemplate()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                DefaultStrategy = DefaultNamespaceStrategy.UseTemplate,
                DefaultNamespaceTemplate = "Generated.{filename}.{lastsegment}"
            };

            var key = new NamespaceKey(
                new System.Uri("test.xsd", System.UriKind.Relative), 
                "http://example.com/MyNamespace");

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Generated.test.MyNamespace", result);
        }

        [Fact]
        public void DefaultStrategy_ThrowException_Throws()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                DefaultStrategy = DefaultNamespaceStrategy.ThrowException
            };

            var key = new NamespaceKey(null, "http://example.com/test");

            // Act & Assert
            Assert.Throws<InvalidOperationException>(() => provider.FindNamespace(key));
        }

        [Fact]
        public void InvalidRegexPattern_LogsError_ReturnsNull()
        {
            // Arrange
            var logMessages = new List<string>();
            var config = CreateTestConfiguration();
            config.Log = msg => logMessages.Add(msg);
            
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@"[invalid(regex", "Test")
                    {
                        Source = "Filename"
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("test.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Null(result);
            Assert.Contains(logMessages, msg => msg.Contains("Error applying pattern"));
        }

        [Fact]
        public void MissingCaptureGroup_LeavesPlaceholder()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<name>\w+)",
                        "Test.{name}.{missing}")
                    {
                        Source = "Filename"
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("hello.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.hello.{missing}", result);
        }

        [Fact]
        public void NumericPlaceholders_Work()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(\w+)-(\d+)",
                        "Test.{0}.Version{1}")
                    {
                        Source = "Filename"
                    }
                }
            };

            var key = new NamespaceKey(new System.Uri("schema-123.xsd", System.UriKind.Relative), null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("Test.schema.Version123", result);
        }

        [Fact]
        public void ComplexEESSIPattern_WithAllTransforms()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(
                        @"(?<doc>[A-Za-z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)-\d+T\d+",
                        "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}")
                    {
                        Source = "Filename",
                        Transforms = new Dictionary<string, string> 
                        { 
                            ["ver"] = "dots_to_underscores",
                            ["doc"] = "uppercase"
                        }
                    }
                }
            };

            var key = new NamespaceKey(
                new System.Uri("da003-4.4.1-20241203T114133.xsd", System.UriKind.Relative), 
                null);

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.DA003.V4_4_1", result);
        }

        [Fact]
        public void BothPatternsConfigured_PriorityDeterminesOrder()
        {
            // Arrange
            var config = CreateTestConfiguration();
            var provider = new PatternBasedNamespaceProvider(config)
            {
                NamespacePatterns = new List<NamespacePattern>
                {
                    new NamespacePattern(@"test", "FromFilename") { Source = "Filename", Priority = 100 },
                    new NamespacePattern(@".*", "FromXmlNamespace") { Source = "XmlNamespace", Priority = 200 }
                }
            };

            var key = new NamespaceKey(
                new System.Uri("test.xsd", System.UriKind.Relative), 
                "http://example.com");

            // Act
            var result = provider.FindNamespace(key);

            // Assert
            Assert.Equal("FromFilename", result);
        }
    }
}