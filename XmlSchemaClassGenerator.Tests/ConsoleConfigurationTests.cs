using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using Xunit;
using XmlSchemaClassGenerator.Console;

namespace XmlSchemaClassGenerator.Tests
{
    public class ConsoleConfigurationTests
    {
        [Fact]
        public void SimpleConfiguration_Deserializes_Correctly()
        {
            var json = @"{
                ""outputDirectory"": ""./generated"",
                ""generateNullables"": true,
                ""separateFiles"": true,
                ""generateChoiceItemProperty"": true,
                ""namespacePrefix"": ""MyCompany"",
                ""collectionType"": ""System.Collections.Generic.List<>"",
                ""namespaceMappings"": [
                    {
                        ""xmlNamespace"": ""http://example.com/common"",
                        ""cSharpNamespace"": ""MyCompany.Common""
                    }
                ],
                ""namespacePatterns"": [
                    {
                        ""xmlPattern"": ""http://example.com/{id}"",
                        ""cSharpTemplate"": ""MyCompany.{id}""
                    }
                ],
                ""sourceDirectories"": [""./schemas""],
                ""sourceFiles"": [""schema1.xsd"", ""schema2.xsd""]
            }";

            var config = JsonSerializer.Deserialize<SimpleConfiguration>(json, new JsonSerializerOptions 
            { 
                PropertyNameCaseInsensitive = true 
            });

            Assert.NotNull(config);
            Assert.Equal("./generated", config.OutputDirectory);
            Assert.True(config.GenerateNullables);
            Assert.True(config.SeparateFiles);
            Assert.True(config.GenerateChoiceItemProperty);
            Assert.Equal("MyCompany", config.NamespacePrefix);
            Assert.Equal("System.Collections.Generic.List<>", config.CollectionType);
            
            Assert.NotNull(config.NamespaceMappings);
            Assert.Single(config.NamespaceMappings);
            Assert.Equal("http://example.com/common", config.NamespaceMappings[0].XmlNamespace);
            Assert.Equal("MyCompany.Common", config.NamespaceMappings[0].CSharpNamespace);
            
            Assert.NotNull(config.NamespacePatterns);
            Assert.Single(config.NamespacePatterns);
            Assert.Equal("http://example.com/{id}", config.NamespacePatterns[0].XmlPattern);
            Assert.Equal("MyCompany.{id}", config.NamespacePatterns[0].CSharpTemplate);
            
            Assert.NotNull(config.SourceDirectories);
            Assert.Single(config.SourceDirectories);
            Assert.Equal("./schemas", config.SourceDirectories[0]);
            
            Assert.NotNull(config.SourceFiles);
            Assert.Equal(2, config.SourceFiles.Count);
            Assert.Equal("schema1.xsd", config.SourceFiles[0]);
            Assert.Equal("schema2.xsd", config.SourceFiles[1]);
        }

        [Fact]
        public void SimpleConfiguration_Handles_Partial_Config()
        {
            var json = @"{
                ""outputDirectory"": ""./output"",
                ""generateNullables"": true
            }";

            var config = JsonSerializer.Deserialize<SimpleConfiguration>(json, new JsonSerializerOptions 
            { 
                PropertyNameCaseInsensitive = true 
            });

            Assert.NotNull(config);
            Assert.Equal("./output", config.OutputDirectory);
            Assert.True(config.GenerateNullables);
            Assert.Null(config.SeparateFiles);
            Assert.Null(config.NamespaceMappings);
            Assert.Null(config.NamespacePatterns);
        }

        [Fact]
        public void SimpleConfiguration_CaseInsensitive_Works()
        {
            var json = @"{
                ""OutputDirectory"": ""./output"",
                ""generateNULLABLES"": true,
                ""NamespacePrefix"": ""Test""
            }";

            var config = JsonSerializer.Deserialize<SimpleConfiguration>(json, new JsonSerializerOptions 
            { 
                PropertyNameCaseInsensitive = true 
            });

            Assert.NotNull(config);
            Assert.Equal("./output", config.OutputDirectory);
            Assert.True(config.GenerateNullables);
            Assert.Equal("Test", config.NamespacePrefix);
        }

        [Fact]
        public void NamespaceMapping_Serializes_Correctly()
        {
            var mapping = new NamespaceMapping
            {
                XmlNamespace = "http://example.com",
                CSharpNamespace = "Example.Namespace"
            };

            var json = JsonSerializer.Serialize(mapping);
            var deserialized = JsonSerializer.Deserialize<NamespaceMapping>(json);

            Assert.Equal(mapping.XmlNamespace, deserialized.XmlNamespace);
            Assert.Equal(mapping.CSharpNamespace, deserialized.CSharpNamespace);
        }

        [Fact]
        public void NamespacePatternMapping_Works_With_Placeholders()
        {
            var pattern = new NamespacePatternMapping
            {
                XmlPattern = "http://example.com/{module}/{version}",
                CSharpTemplate = "MyCompany.{module}.V{version}"
            };

            Assert.Contains("{module}", pattern.XmlPattern);
            Assert.Contains("{version}", pattern.XmlPattern);
            Assert.Contains("{module}", pattern.CSharpTemplate);
            Assert.Contains("{version}", pattern.CSharpTemplate);
        }
    }
}