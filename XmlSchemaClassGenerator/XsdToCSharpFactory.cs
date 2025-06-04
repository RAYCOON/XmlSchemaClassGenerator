using System;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;

namespace XmlSchemaClassGenerator
{
    public class XsdToCSharpFactory
    {
        private readonly GeneratorConfiguration _configuration;
        private readonly Generator _generator;

        public XsdToCSharpFactory(GeneratorConfiguration configuration = null)
        {
            _configuration = configuration ?? CreateDefaultConfiguration();
            _generator = new Generator();
            
            // Apply configuration to generator
            ApplyConfigurationToGenerator(_configuration);
        }

        /// <summary>
        /// Generates TypeModel objects from an XSD file that can be used for XPath-like navigation and property access
        /// </summary>
        /// <param name="xsdFilePath">Path to the XSD file</param>
        /// <returns>XsdTypeNavigator that provides XPath-like access to XSD-derived type models</returns>
        public XsdTypeNavigator GenerateTypesFromXsd(string xsdFilePath)
        {
            if (!File.Exists(xsdFilePath))
                throw new FileNotFoundException($"XSD file not found: {xsdFilePath}");

            // Create XmlSchemaSet from XSD file
            var schemaSet = new XmlSchemaSet();
            using (var reader = XmlReader.Create(xsdFilePath))
            {
                schemaSet.Add(null, reader);
            }
            schemaSet.Compile();

            if (schemaSet.GlobalTypes.Count == 0)
                throw new InvalidOperationException("No types found in XSD schema");

            // Use ModelBuilder to create TypeModel objects directly
            var modelBuilder = new ModelBuilder(_configuration, schemaSet);
            
            // Return navigator that provides XPath-like access
            return new XsdTypeNavigator(modelBuilder);
        }

        private void ApplyConfigurationToGenerator(GeneratorConfiguration config)
        {
            _generator.GenerateNullables = config.GenerateNullables;
            _generator.GenerateSerializableAttribute = config.GenerateSerializableAttribute;
            _generator.GenerateDesignerCategoryAttribute = config.GenerateDesignerCategoryAttribute;
            _generator.GenerateDebuggerStepThroughAttribute = config.GenerateDebuggerStepThroughAttribute;
            _generator.DataAnnotationMode = config.DataAnnotationMode;
            _generator.EmitOrder = config.EmitOrder;
            _generator.EnableDataBinding = config.EnableDataBinding;
            _generator.NamespacePrefix = config.NamespacePrefix;
            _generator.NamingScheme = config.NamingScheme;
            _generator.GenerateChoiceItemProperty = config.GenerateChoiceItemProperty;
        }

        /// <summary>
        /// Creates an instance of the specified type and deserializes XML content into it
        /// </summary>
        public T DeserializeXml<T>(string xmlContent)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (var reader = new StringReader(xmlContent))
            {
                return (T)serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// Deserializes XML content into an object of the specified type
        /// </summary>
        public object DeserializeXml(string xmlContent, Type targetType)
        {
            var serializer = new XmlSerializer(targetType);
            using (var reader = new StringReader(xmlContent))
            {
                return serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// Serializes an object to XML string
        /// </summary>
        public string SerializeToXml<T>(T obj)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (var writer = new StringWriter())
            {
                serializer.Serialize(writer, obj);
                return writer.ToString();
            }
        }

        private GeneratorConfiguration CreateDefaultConfiguration()
        {
            return new GeneratorConfiguration
            {
                GenerateNullables = true,
                GenerateSerializableAttribute = true,
                GenerateDesignerCategoryAttribute = false,
                GenerateDebuggerStepThroughAttribute = false,
                DataAnnotationMode = DataAnnotationMode.None,
                EmitOrder = true,
                EnableDataBinding = false,
                NamespacePrefix = "Generated",
                NamingScheme = NamingScheme.PascalCase
            };
        }

        /*
        private Dictionary<string, Type> CompileGeneratedCode(Dictionary<string, string> generatedCode)
        {
            // Runtime compilation implementation using Roslyn
            // This is commented out for now due to platform compatibility issues
            // Will be implemented in a future version
            throw new NotImplementedException("Runtime compilation is not yet implemented.");
        }
        */

        /// <summary>
        /// In-memory output writer to capture generated code
        /// </summary>
        private class InMemoryOutputWriter : OutputWriter
        {
            public Dictionary<string, string> GeneratedCode { get; } = new Dictionary<string, string>();

            public override void Write(CodeNamespace codeNamespace)
            {
                using (var writer = new StringWriter())
                {
                    using (var codeProvider = CodeDomProvider.CreateProvider("CSharp"))
                    {
                        var options = new CodeGeneratorOptions
                        {
                            BracingStyle = "C",
                            IndentString = "    "
                        };

                        codeProvider.GenerateCodeFromNamespace(codeNamespace, writer, options);
                    }
                    
                    var namespaceName = string.IsNullOrEmpty(codeNamespace.Name) ? "Generated" : codeNamespace.Name;
                    GeneratedCode[namespaceName] = writer.ToString();
                }
            }
        }
    }
}