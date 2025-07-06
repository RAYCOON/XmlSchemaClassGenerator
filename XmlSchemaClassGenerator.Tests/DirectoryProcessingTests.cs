using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;
using XmlSchemaClassGenerator;

namespace XmlSchemaClassGenerator.Tests
{
    public class DirectoryProcessingTests : IDisposable
    {
        private readonly string _testDirectory;
        private readonly List<string> _createdFiles = new();

        public DirectoryProcessingTests()
        {
            _testDirectory = Path.Combine(Path.GetTempPath(), $"XscgenTest_{Guid.NewGuid():N}");
            Directory.CreateDirectory(_testDirectory);
        }

        public void Dispose()
        {
            try
            {
                if (Directory.Exists(_testDirectory))
                {
                    Directory.Delete(_testDirectory, recursive: true);
                }
            }
            catch { }
        }

        [Fact]
        public void SchemaResolver_FindsAllXsdFiles_InDirectory()
        {
            // Arrange
            CreateTestXsdFile("schema1.xsd");
            CreateTestXsdFile("schema2.xsd");
            CreateTestXsdFile("schema3.xsd");
            CreateTestFile("notschema.xml"); // Should be ignored

            var resolver = new SchemaResolver
            {
                Recursive = false,
                Log = null
            };
            resolver.AddSearchDirectory(_testDirectory);

            // Act
            var files = resolver.FindSchemaFiles().ToList();

            // Assert
            Assert.Equal(3, files.Count);
            Assert.All(files, f => Assert.True(f.EndsWith(".xsd")));
        }

        [Fact]
        public void SchemaResolver_FindsXsdFiles_RecursivelyInSubdirectories()
        {
            // Arrange
            CreateTestXsdFile("root.xsd");
            CreateTestXsdFile("sub1/schema1.xsd");
            CreateTestXsdFile("sub1/schema2.xsd");
            CreateTestXsdFile("sub2/schema3.xsd");
            CreateTestXsdFile("sub2/nested/deep.xsd");

            var resolver = new SchemaResolver
            {
                Recursive = true,
                Log = null
            };
            resolver.AddSearchDirectory(_testDirectory);

            // Act
            var files = resolver.FindSchemaFiles().ToList();

            // Assert
            Assert.Equal(5, files.Count);
            Assert.Contains(files, f => f.EndsWith("root.xsd"));
            Assert.Contains(files, f => f.EndsWith("deep.xsd"));
        }

        [Fact]
        public void SchemaResolver_ResolvesImports_WhenAutoResolveEnabled()
        {
            // Arrange
            CreateTestXsdFile("main.xsd", @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"" 
           targetNamespace=""http://example.com/main""
           xmlns:imp=""http://example.com/imported"">
    <xs:import namespace=""http://example.com/imported"" schemaLocation=""imported.xsd""/>
    <xs:element name=""Root"" type=""xs:string""/>
</xs:schema>");

            CreateTestXsdFile("imported.xsd", @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"" 
           targetNamespace=""http://example.com/imported"">
    <xs:element name=""ImportedElement"" type=""xs:string""/>
</xs:schema>");

            var resolver = new SchemaResolver
            {
                Recursive = false,
                AutoResolveImports = true,
                Log = null
            };
            resolver.AddSearchDirectory(_testDirectory);

            // Act
            var files = resolver.FindSchemaFiles().ToList();
            var resolved = resolver.ResolveSchemas(new List<string> { Path.Combine(_testDirectory, "main.xsd") }).ToList();

            // Assert
            Assert.Equal(2, files.Count);
            Assert.Equal(2, resolved.Count); // Both main and imported should be included
        }


        private void CreateTestXsdFile(string relativePath, string content = null)
        {
            var fullPath = Path.Combine(_testDirectory, relativePath);
            var dir = Path.GetDirectoryName(fullPath);
            if (!string.IsNullOrEmpty(dir) && !Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            content ??= @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""TestElement"" type=""xs:string""/>
</xs:schema>";

            File.WriteAllText(fullPath, content);
            _createdFiles.Add(fullPath);
        }

        private void CreateTestFile(string relativePath, string content = "<root/>")
        {
            var fullPath = Path.Combine(_testDirectory, relativePath);
            File.WriteAllText(fullPath, content);
            _createdFiles.Add(fullPath);
        }
    }
}