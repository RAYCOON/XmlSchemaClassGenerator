using System.Collections.Generic;
using System.Linq;
using Xunit;
using XmlSchemaClassGenerator;

namespace XmlSchemaClassGenerator.Tests
{
    public class NamespacePatternTests
    {
        [Fact]
        public void NamespacePattern_SimpleIdReplacement_Works()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://example.com/{id}", "MyCompany.{id}")
            };
            
            var baseProvider = new NamespaceProvider();
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var result = patternProvider.GenerateNamespace(new NamespaceKey("http://example.com/Orders"));

            // Assert
            Assert.Equal("MyCompany.Orders", result);
        }

        [Fact]
        public void NamespacePattern_MultipleReplacements_Work()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://example.com/{module}/{version}", "MyCompany.{module}.V{version}")
            };
            
            var baseProvider = new NamespaceProvider();
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var result = patternProvider.GenerateNamespace(new NamespaceKey("http://example.com/Orders/2_0"));

            // Assert
            Assert.Equal("MyCompany.Orders.V2_0", result);
        }

        [Fact]
        public void NamespacePattern_EessiPattern_Works()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://ec.europa.eu/eessi/ns/4_4/{id}", "ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1")
            };
            
            var baseProvider = new NamespaceProvider();
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var resultS001 = patternProvider.GenerateNamespace(new NamespaceKey("http://ec.europa.eu/eessi/ns/4_4/S001"));
            var resultA008 = patternProvider.GenerateNamespace(new NamespaceKey("http://ec.europa.eu/eessi/ns/4_4/A008"));
            var resultDA003 = patternProvider.GenerateNamespace(new NamespaceKey("http://ec.europa.eu/eessi/ns/4_4/DA003"));

            // Assert
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.S001.V4_4_1", resultS001);
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_1", resultA008);
            Assert.Equal("ITSG.EESSI.Tstelle.XML.SED.DA003.V4_4_1", resultDA003);
        }

        [Fact]
        public void NamespacePattern_FallsBackToBase_WhenNoMatch()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://example.com/{id}", "MyCompany.{id}")
            };
            
            var baseProvider = new NamespaceProvider();
            baseProvider.Add(new NamespaceKey("http://other.com"), "Other.Namespace");
            
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var patternMatch = patternProvider.GenerateNamespace(new NamespaceKey("http://example.com/Test"));
            var baseMatch = patternProvider[new NamespaceKey("http://other.com")]; // Direct lookup in provider
            var noMatch = patternProvider.GenerateNamespace(new NamespaceKey("http://nomatch.com/test"));

            // Assert
            Assert.Equal("MyCompany.Test", patternMatch);
            Assert.Equal("Other.Namespace", baseMatch);
            Assert.Null(noMatch); // No pattern matches and no auto-generation configured
        }

        [Fact]
        public void NamespacePattern_MultiplePatterns_FirstMatchWins()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://example.com/{id}", "First.{id}"),
                new("http://example.com/{name}", "Second.{name}")
            };
            
            var baseProvider = new NamespaceProvider();
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var result = patternProvider.GenerateNamespace(new NamespaceKey("http://example.com/Test"));

            // Assert
            Assert.Equal("First.Test", result); // First pattern should match
        }


        [Fact]
        public void NamespacePattern_ComplexPath_Works()
        {
            // Arrange
            var patterns = new List<KeyValuePair<string, string>>
            {
                new("http://schemas.company.com/services/{service}/v{version}/{type}", 
                    "Company.Services.{service}.V{version}.{type}")
            };
            
            var baseProvider = new NamespaceProvider();
            var patternProvider = patterns.ToNamespaceProviderWithPatterns(baseProvider);

            // Act
            var result = patternProvider.GenerateNamespace(
                new NamespaceKey("http://schemas.company.com/services/Orders/v3/Contracts"));

            // Assert
            Assert.Equal("Company.Services.Orders.V3.Contracts", result);
        }
    }
}