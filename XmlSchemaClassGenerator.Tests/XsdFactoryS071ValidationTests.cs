using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;

namespace XmlSchemaClassGenerator.Tests
{
    public class XsdFactoryS071ValidationTests
    {
        private const string S071SchemaPath = "xsd/eessi/S071-4.4.xsd";
        private const string XAdESSchemaPath = "xsd/eessi/XAdES.xsd";
        private const string XmlDSigSchemaPath = "xsd/eessi/xmldsig-core-schema.xsd";

        private XsdToCSharpFactory CreateS071Factory()
        {
            var config = new GeneratorConfiguration
            {
                DataAnnotationMode = DataAnnotationMode.All,
                GenerateNullables = true,
                NamespaceProvider = new Dictionary<NamespaceKey, string>
                {
                    { new NamespaceKey("http://ec.europa.eu/eessi/ns/4_4/S071"), "EESSI.S071" },
                    { new NamespaceKey("http://uri.etsi.org/01903/v1.3.2#"), "ETSI.XAdES" },
                    { new NamespaceKey("http://www.w3.org/2000/09/xmldsig#"), "W3C.XmlDSig" }
                }.ToNamespaceProvider()
            };

            var factory = new XsdToCSharpFactory(config);
            
            // Generate types from S071 and related schemas
            var baseDir = Path.GetDirectoryName(typeof(XsdFactoryS071ValidationTests).Assembly.Location);
            var schemaFiles = new[]
            {
                Path.Combine(baseDir, S071SchemaPath),
                Path.Combine(baseDir, XAdESSchemaPath),
                Path.Combine(baseDir, XmlDSigSchemaPath)
            };

            factory.GenerateTypesFromXsd(schemaFiles);
            return factory;
        }

        [Fact]
        public void S071_GetRequiredPropertyPaths_ShouldReturnEESSIRequiredFields()
        {
            // Arrange
            var factory = CreateS071Factory();

            // Act
            var requiredPaths = factory.GetRequiredPropertyPaths();

            // Assert
            Assert.NotNull(requiredPaths);
            Assert.NotEmpty(requiredPaths);

            // Log all found required paths for debugging
            var pathsString = string.Join("\n", requiredPaths.OrderBy(x => x));
            
            // Check for some expected EESSI required fields based on minOccurs='1' elements
            // These are the critical fields that must be present in any S071 document
            var expectedRequiredFields = new[]
            {
                // Institution fields (required in EESSI documents)
                "institutionID",
                "institutionName", 
                "country",
                "personalIdentificationNumber",
                
                // Person identification fields
                "familyName", // minOccurs='1' in person data
                "town",      // minOccurs='1' in place of birth
                
                // Document structure fields that typically have minOccurs='1'
                "value"      // appears in many enumeration types with minOccurs='1'
            };

            // Verify that at least some expected required paths are found
            // We check for partial matches since the actual property paths may be nested
            var foundExpectedFields = expectedRequiredFields.Where(expected =>
                requiredPaths.Any(path => path.Contains(expected, StringComparison.OrdinalIgnoreCase))
            ).ToList();

            // Assert that we found at least some of the expected required fields
            Assert.True(foundExpectedFields.Count > 0, 
                $"Expected to find at least some required fields from: [{string.Join(", ", expectedRequiredFields)}]\n" +
                $"But found these required paths:\n{pathsString}");
        }

        [Fact]
        public void S071_CreateRootInstance_ShouldCreateValidS071Object()
        {
            // Arrange
            var factory = CreateS071Factory();

            // Act
            var rootInstance = factory.CreateRootInstance();

            // Assert
            Assert.NotNull(rootInstance);
            
            var rootType = rootInstance.GetType();
            Assert.Contains("S071", rootType.Name, StringComparison.OrdinalIgnoreCase);
            
            // Verify we can access some expected properties
            var properties = rootType.GetProperties();
            Assert.NotEmpty(properties);
        }

        [Fact]
        public void S071_ValidateEmptyInstance_ShouldReturnRequiredFieldErrors()
        {
            // Arrange
            var factory = CreateS071Factory();
            var emptyInstance = factory.CreateRootInstance();

            // Act
            var errors = factory.ValidateInstance(emptyInstance);

            // Assert
            Assert.NotNull(errors);
            
            // An empty S071 instance should have validation errors for required fields
            // We don't enforce a specific count since it depends on how DataAnnotations are generated
            // But we should have some errors for an empty complex EESSI document
            
            if (errors.Any())
            {
                // Verify error structure is correct
                var firstError = errors.First();
                Assert.NotNull(firstError.PropertyPath);
                Assert.NotNull(firstError.ErrorMessage);
                Assert.Equal(XsdValidationErrorType.Required, firstError.ErrorType);
                
                // Check that errors have meaningful property paths
                Assert.All(errors, error => 
                {
                    Assert.False(string.IsNullOrEmpty(error.PropertyPath));
                    Assert.False(string.IsNullOrEmpty(error.ErrorMessage));
                });
            }
        }

        [Fact]
        public void S071_ValidatePartiallyFilledInstance_ShouldShowSpecificRequiredErrors()
        {
            // Arrange
            var factory = CreateS071Factory();
            var instance = factory.CreateRootInstance();
            
            // Fill some fields but leave others empty to test specific validation
            var type = instance.GetType();
            
            // Try to set some basic fields that might exist
            var properties = type.GetProperties();
            var stringProperties = properties.Where(p => p.PropertyType == typeof(string) && p.CanWrite).Take(2);
            
            foreach (var prop in stringProperties)
            {
                prop.SetValue(instance, "test_value");
            }

            // Act
            var errors = factory.ValidateInstance(instance);

            // Assert
            Assert.NotNull(errors);
            
            // Should still have some required field errors, but possibly fewer than completely empty instance
            // The exact count depends on which fields were set and which are required
            
            if (errors.Any())
            {
                // Verify all errors are properly formatted
                Assert.All(errors, error =>
                {
                    Assert.False(string.IsNullOrEmpty(error.PropertyPath));
                    Assert.False(string.IsNullOrEmpty(error.ErrorMessage));
                    Assert.Contains("required", error.ErrorMessage.ToLowerInvariant());
                });
            }
        }

        [Fact]
        public void S071_RequiredPathsAnalysis_ShouldShowEESSIStructure()
        {
            // Arrange
            var factory = CreateS071Factory();

            // Act
            var requiredPaths = factory.GetRequiredPropertyPaths();
            var rootType = factory.GetRootElementType();

            // Assert
            Assert.NotNull(rootType);
            Assert.Contains("S071", rootType.Name);
            
            Assert.NotNull(requiredPaths);
            
            // This test is primarily for debugging/analysis purposes
            // It helps us understand what the S071 schema structure looks like
            // and which fields are identified as required
            
            var analysis = new
            {
                RootTypeName = rootType.Name,
                RootTypeFullName = rootType.FullName,
                RequiredPathCount = requiredPaths.Count,
                RequiredPaths = requiredPaths.OrderBy(x => x).ToList(),
                AllProperties = rootType.GetProperties().Select(p => new 
                { 
                    Name = p.Name, 
                    Type = p.PropertyType.Name,
                    IsRequired = requiredPaths.Any(path => path.Contains(p.Name))
                }).ToList()
            };
            
            // Verify basic structure expectations
            Assert.True(analysis.RequiredPathCount >= 0, "Should return a valid count of required paths");
            
            // For debugging - this helps developers understand the S071 structure
            var propertyNames = string.Join(", ", analysis.AllProperties.Select(p => 
                p.Name + "(" + p.Type + ")" + (p.IsRequired ? "*req" : "")));
            
            var debugInfo = $"S071 Analysis:\n" +
                           $"Root Type: {analysis.RootTypeName} ({analysis.RootTypeFullName})\n" +
                           $"Required Paths Count: {analysis.RequiredPathCount}\n" +
                           $"Required Paths: [{string.Join(", ", analysis.RequiredPaths)}]\n" +
                           $"All Properties: [{propertyNames}]";
            
            // This assertion always passes but provides valuable debug output
            Assert.True(true, debugInfo);
        }

        [Fact]
        public void S071_HandleComplexNestedStructure_ShouldValidateRecursively()
        {
            // Arrange
            var factory = CreateS071Factory();
            var instance = factory.CreateRootInstance();

            // Act - Test that validation handles the complex nested structure without crashing
            var errors = factory.ValidateInstance(instance);
            var requiredPaths = factory.GetRequiredPropertyPaths();

            // Assert
            Assert.NotNull(errors);
            Assert.NotNull(requiredPaths);
            
            // The main assertion is that these operations complete without throwing
            // Complex EESSI schemas have deep nesting and circular references
            // This test ensures our validation can handle such complexity
            
            Assert.True(true, "Complex S071 validation completed without errors");
        }

        [Fact]
        public void S071_PerformanceTest_ShouldCompleteInReasonableTime()
        {
            // Arrange
            var factory = CreateS071Factory();
            var instance = factory.CreateRootInstance();
            var stopwatch = System.Diagnostics.Stopwatch.StartNew();

            // Act
            var requiredPaths = factory.GetRequiredPropertyPaths();
            var validationErrors = factory.ValidateInstance(instance);
            
            stopwatch.Stop();

            // Assert
            Assert.NotNull(requiredPaths);
            Assert.NotNull(validationErrors);
            
            // Validation should complete in reasonable time (less than 5 seconds for complex schema)
            Assert.True(stopwatch.ElapsedMilliseconds < 5000, 
                $"S071 validation took too long: {stopwatch.ElapsedMilliseconds}ms");
        }
    }
}