using System;
using System.Collections.Generic;
using Xunit;
using XmlSchemaClassGenerator;

namespace XmlSchemaClassGenerator.Tests
{
    public class SimplePatternTests
    {
        [Fact]
        public void TestPatternBasedNamespaceProvider_BasicFunctionality()
        {
            // Arrange
            var config = new GeneratorConfiguration();
            var provider = new PatternBasedNamespaceProvider(config);
            
            // Test that it exists and can be instantiated
            Assert.NotNull(provider);
            
            // Test basic properties
            provider.FilenamePatterns = new List<NamespacePattern>();
            provider.XmlNamespacePatterns = new List<NamespacePattern>();
            provider.DefaultStrategy = DefaultNamespaceStrategy.AutoGenerate;
            provider.DefaultNamespaceTemplate = "Test.{filename}";
            
            Assert.NotNull(provider.FilenamePatterns);
            Assert.NotNull(provider.XmlNamespacePatterns);
            Assert.Equal(DefaultNamespaceStrategy.AutoGenerate, provider.DefaultStrategy);
            Assert.Equal("Test.{filename}", provider.DefaultNamespaceTemplate);
        }

        [Fact]
        public void TestNamespacePattern_Creation()
        {
            // Test creating a namespace pattern
            var pattern = new NamespacePattern(
                @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)",
                "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}")
            {
                Transforms = new Dictionary<string, string> { ["ver"] = "dots_to_underscores" },
                Priority = 10
            };
            
            Assert.Equal(@"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)", pattern.Pattern);
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}", pattern.Template);
            Assert.Equal("dots_to_underscores", pattern.Transforms["ver"]);
            Assert.Equal(10, pattern.Priority);
        }

        [Fact]
        public void TestPatternTransformations_Constants()
        {
            // Test that transformation constants are defined
            Assert.Equal("dots_to_underscores", PatternTransformations.DotsToUnderscores);
            Assert.Equal("uppercase", PatternTransformations.Uppercase);
            Assert.Equal("lowercase", PatternTransformations.Lowercase);
            Assert.Equal("titlecase", PatternTransformations.TitleCase);
            Assert.Equal("remove_hyphens", PatternTransformations.RemoveHyphens);
        }

        [Fact]
        public void TestDefaultNamespaceStrategy_Enum()
        {
            // Test all enum values
            Assert.Equal(0, (int)DefaultNamespaceStrategy.AutoGenerate);
            Assert.Equal(1, (int)DefaultNamespaceStrategy.UseFilename);
            Assert.Equal(2, (int)DefaultNamespaceStrategy.UseXmlNamespace);
            Assert.Equal(3, (int)DefaultNamespaceStrategy.ThrowException);
            Assert.Equal(4, (int)DefaultNamespaceStrategy.UseTemplate);
        }

        [Fact]
        public void TestGeneratorConfiguration_NewProperties()
        {
            // Test that GeneratorConfiguration has the new properties
            var config = new GeneratorConfiguration();
            
            config.XmlNamespacePatterns = new List<NamespacePattern>();
            config.FilenamePatterns = new List<NamespacePattern>();
            config.DefaultNamespaceTemplate = "Test";
            config.DefaultNamespaceStrategy = DefaultNamespaceStrategy.UseFilename;
            
            Assert.NotNull(config.XmlNamespacePatterns);
            Assert.NotNull(config.FilenamePatterns);
            Assert.Equal("Test", config.DefaultNamespaceTemplate);
            Assert.Equal(DefaultNamespaceStrategy.UseFilename, config.DefaultNamespaceStrategy);
        }

        [Fact]
        public void TestGenerator_NewProperties()
        {
            // Test that Generator has the new properties
            var generator = new Generator();
            
            generator.XmlNamespacePatterns = new List<NamespacePattern>();
            generator.FilenamePatterns = new List<NamespacePattern>();
            generator.DefaultNamespaceTemplate = "Test";
            generator.DefaultNamespaceStrategy = DefaultNamespaceStrategy.UseTemplate;
            
            Assert.NotNull(generator.XmlNamespacePatterns);
            Assert.NotNull(generator.FilenamePatterns);
            Assert.Equal("Test", generator.DefaultNamespaceTemplate);
            Assert.Equal(DefaultNamespaceStrategy.UseTemplate, generator.DefaultNamespaceStrategy);
            
            // Test ConfigureNamespaceProvider method exists
            generator.ConfigureNamespaceProvider();
        }
    }
}