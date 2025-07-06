using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using XmlSchemaClassGenerator.Console;

namespace XmlSchemaClassGenerator.Tests
{
    public class PatternCommandLineTests
    {
        private string CreateTempXsd()
        {
            var tempFile = Path.GetTempFileName();
            File.WriteAllText(tempFile, @"<?xml version=""1.0"" encoding=""utf-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""Test"" type=""xs:string"" />
</xs:schema>");
            return tempFile;
        }

        [Fact]
        public void FilePattern_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--file-pattern",
                @"(?<doc>[A-Z]+)-(?<ver>\d+)=MyApp.{doc}.V{ver}",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void XmlPattern_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--xml-pattern",
                @"http://example\.com/(?<name>\w+)=MyApp.{name}",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void PatternTransform_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--file-pattern",
                @"(?<ver>\d+\.\d+)=V{ver}",
                "--pattern-transform",
                "ver=dots_to_underscores",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void MultiplePatternTransforms_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--file-pattern",
                @"(?<name>\w+)-(?<ver>\d+\.\d+)={name}.V{ver}",
                "--pattern-transform",
                "ver=dots_to_underscores",
                "--pattern-transform",
                "name=uppercase",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void DefaultNamespaceStrategy_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var validStrategies = new[] 
            { 
                "AutoGenerate", 
                "UseFilename", 
                "UseXmlNamespace", 
                "ThrowException", 
                "UseTemplate" 
            };

            foreach (var strategy in validStrategies)
            {
                var args = new[]
                {
                    "--default-namespace-strategy",
                    strategy,
                    tempXsd
                };

                try
                {
                    // Act
                    var result = Program.Main(args);

                    // Assert
                    Assert.Equal(0, result);
                }
                finally
                {
                    File.Delete(tempXsd);
                    tempXsd = CreateTempXsd();
                }
            }

            File.Delete(tempXsd);
        }

        [Fact]
        public void DefaultNamespaceTemplate_ParsedCorrectly()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--default-namespace-strategy",
                "UseTemplate",
                "--default-namespace-template",
                "MyApp.Generated.{filename}",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void ShortFormOptions_Work()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "-fp", @"(?<name>\w+)=Test.{name}",
                "-xp", @"http://example\.com/(?<id>\w+)=Example.{id}",
                "-pt", "name=uppercase",
                "-dns", "UseFilename",
                "-dnt", "Default.{filename}",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void ComplexEESSIExample_Works()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--single-file",
                "--gi",
                "--ua",
                "--ctor",
                "--file-pattern",
                @"(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
                "--pattern-transform",
                "ver=dots_to_underscores",
                "-o",
                "test-output.cs",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert
                Assert.Equal(0, result);
                
                // Cleanup generated file
                if (File.Exists("test-output.cs"))
                    File.Delete("test-output.cs");
                
                var outputDir = Path.Combine(Directory.GetCurrentDirectory(), "test-output.cs");
                if (Directory.Exists(outputDir))
                    Directory.Delete(outputDir, true);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void InvalidPatternFormat_HandledGracefully()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--file-pattern",
                "invalid-pattern-without-equals",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert - should still work, just ignore invalid pattern
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }

        [Fact]
        public void InvalidTransformFormat_HandledGracefully()
        {
            // Arrange
            var tempXsd = CreateTempXsd();
            var args = new[]
            {
                "--pattern-transform",
                "invalid-transform-without-equals",
                tempXsd
            };

            try
            {
                // Act
                var result = Program.Main(args);

                // Assert - should still work, just ignore invalid transform
                Assert.Equal(0, result);
            }
            finally
            {
                File.Delete(tempXsd);
            }
        }
    }
}