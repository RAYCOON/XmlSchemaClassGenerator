# XmlSampleGenerator

## Overview

XmlSampleGenerator is a utility library that generates sample XML instances from XML Schema Definition (XSD) files. It's similar to the functionality provided by Microsoft's `xsd.exe` tool with the `/c` parameter, but implemented as a standalone library.

## Purpose

This project **is NOT for examples** - it's a separate utility tool. The main purposes are:

1. **XML Sample Generation**: Create valid XML instances from XSD schemas
2. **Schema Testing**: Generate test data for XML schemas
3. **Documentation**: Provide example XML structures for schema documentation
4. **Prototyping**: Quick XML instance creation for development and testing

## Key Features

### Core Functionality
- **Schema-based Generation**: Creates XML instances that conform to XSD schemas
- **Complex Type Support**: Handles complex types, nested elements, and attributes
- **Substitution Groups**: Supports XSD substitution group mechanisms
- **Facet Handling**: Respects XSD facets and restrictions
- **Namespace Support**: Handles multiple namespaces and prefixes

### Generation Options
- **Configurable Limits**: Control maximum occurrences and list lengths
- **Recursive Handling**: Manages recursive schema definitions
- **Optional Elements**: Intelligent handling of optional vs required elements
- **Data Type Awareness**: Generates appropriate sample data for different XSD types

## Architecture

### Main Classes

#### `XmlSampleGenerator`
- **Purpose**: Main class for generating XML samples
- **Namespace**: `Microsoft.Xml.XMLGen`
- **Key Properties**:
  - `maxThreshold`: Maximum number of occurrences (default: 5)
  - `listLength`: Default length for lists (default: 3)

#### `InstanceElement`
- **Purpose**: Represents an element instance in the generated XML
- **Features**: Handles element content, attributes, and child elements

#### `InstanceAttribute`
- **Purpose**: Represents an attribute instance
- **Features**: Manages attribute values and namespaces

#### `InstanceGroup`
- **Purpose**: Handles XSD group constructs (sequence, choice, all)
- **Features**: Manages element groupings and occurrence constraints

#### Supporting Classes
- **`Facets`**: Handles XSD facet constraints
- **`InstanceObject`**: Base class for instance objects
- **`SubstitutionGroupWrapper`**: Manages substitution groups

## Usage Examples

### Basic Usage
```csharp
using Microsoft.Xml.XMLGen;

// Load schema
var schemaSet = new XmlSchemaSet();
schemaSet.Add("http://example.com", "schema.xsd");
schemaSet.Compile();

// Create generator
var generator = new XmlSampleGenerator(schemaSet);

// Generate sample XML
var xmlDocument = generator.GenerateInstance("RootElementName");
```

### Advanced Configuration
```csharp
var generator = new XmlSampleGenerator(schemaSet)
{
    MaxThreshold = 3,      // Limit repeated elements
    ListLength = 2         // Shorter lists
};

// Generate with specific options
var sample = generator.GenerateInstance("ElementName", "http://target.namespace");
```

## Relationship to Main Project

### Different from XmlSchemaClassGenerator
- **XmlSchemaClassGenerator**: Generates C# classes from XSD
- **XmlSampleGenerator**: Generates XML instances from XSD

### Complementary Tools
- Use **XmlSchemaClassGenerator** to create C# types
- Use **XmlSampleGenerator** to create test XML data
- Both work with the same XSD schemas

### Integration Possibilities
```csharp
// 1. Generate C# classes
var classGenerator = new Generator();
var assembly = classGenerator.GenerateFiles("Test", xsdFiles, config);

// 2. Generate sample XML
var xmlGenerator = new XmlSampleGenerator(schemaSet);
var sampleXml = xmlGenerator.GenerateInstance("RootElement");

// 3. Deserialize sample XML using generated classes
var serializer = new XmlSerializer(generatedType);
var instance = serializer.Deserialize(new StringReader(sampleXml));
```

## Build and Dependencies

### Target Framework
- **.NET Standard 2.0**: For broad compatibility

### Dependencies
- **System.Xml**: Core XML processing
- **System.Xml.Schema**: XSD schema handling
- **Microsoft.SourceLink.GitHub**: Source linking for debugging

### Build Configuration
```xml
<PropertyGroup>
  <TargetFrameworks>netstandard2.0</TargetFrameworks>
  <SonarQubeExclude>true</SonarQubeExclude>
  <RunCodeAnalysis>false</RunCodeAnalysis>
</PropertyGroup>
```

## Key Differences from Examples

| Aspect | XmlSampleGenerator | Examples Project |
|--------|-------------------|------------------|
| **Purpose** | XML generation utility | Usage demonstrations |
| **Output** | XML instances | Console output |
| **Target** | End users needing XML samples | Developers learning the library |
| **Complexity** | Production-ready tool | Educational code |
| **Namespace** | `Microsoft.Xml.XMLGen` | `XmlSchemaClassGenerator.Examples` |

## Common Use Cases

### 1. API Documentation
Generate sample XML payloads for REST API documentation:
```csharp
var sampleRequest = generator.GenerateInstance("CreateOrderRequest");
var sampleResponse = generator.GenerateInstance("CreateOrderResponse");
```

### 2. Unit Testing
Create test data for XML processing:
```csharp
// Generate various test cases
var validXml = generator.GenerateInstance("TestCase");
var minimalXml = generator.GenerateMinimalInstance("TestCase");
```

### 3. Schema Validation
Test schema definitions with generated samples:
```csharp
var samples = generator.GenerateMultipleVariations("RootElement", 5);
foreach (var sample in samples)
{
    ValidateAgainstSchema(sample);
}
```

### 4. Prototyping
Quick XML generation for development:
```csharp
// Generate sample data for new schema
var prototype = generator.GenerateInstance("NewDataStructure");
// Use for initial development and testing
```

## Historical Context

This implementation is based on Microsoft's XML sample generation approach, providing:
- **Schema compliance**: Generated XML always validates against source XSD
- **Realistic data**: Intelligent sample value generation
- **Industry standards**: Follows XML and XSD best practices
- **Production quality**: Robust error handling and edge case management

## License and Attribution

- Includes EULA.rtf for licensing terms
- Based on Microsoft XML technologies
- Part of the XmlSchemaClassGenerator ecosystem