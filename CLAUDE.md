# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

XmlSchemaClassGenerator is a .NET library and console application that generates XmlSerializer-compatible C# classes from XML Schema (XSD) files. The project uses a multi-stage builder pattern to transform XSD schemas into C# code.

## Common Development Commands

### Build Commands
```bash
# Restore dependencies and build
dotnet restore
dotnet build

# Build in Release mode
dotnet build -c Release

# Create NuGet packages
dotnet pack --include-symbols --include-source -c Release XmlSchemaClassGenerator
dotnet pack --include-symbols --include-source -c Release XmlSchemaClassGenerator.Console
dotnet pack --include-symbols --include-source -c Release xscgen
```

### Test Commands
```bash
# Run all tests
dotnet test

# Run tests with code coverage
dotnet test /p:CollectCoverage=true XmlSchemaClassGenerator.Tests\XmlSchemaClassGenerator.Tests.csproj /p:Include="[XmlSchemaClassGenerator]*" -f net8.0

# Run a single test
dotnet test --filter "FullyQualifiedName~TestClassName.TestMethodName"
```

### Running the Console Application
```bash
cd XmlSchemaClassGenerator.Console
dotnet run -- [options] path/to/schema.xsd

# Example with namespace mapping
dotnet run -- -n "http://example.com=Example.Namespace" -o output schema.xsd
```

## Architecture Overview

### Core Processing Pipeline

The code generation follows a multi-stage pipeline:

1. **Schema Loading** - Loads and validates XSD files using `XmlSchemaSet`
2. **Model Building** (`ModelBuilder.cs`) - Main orchestrator that:
   - Creates type models from XSD elements
   - Manages namespace mappings and type resolution
   - Builds property models with XML serialization attributes
   - Handles complex scenarios (substitution groups, choices, interfaces)
3. **Code Generation** (`Generator.cs`) - Outputs C# code using CodeDOM
4. **Factory Pattern** (`XsdToCSharpFactory.cs`) - High-level API wrapper providing:
   - Type navigation capabilities (`XsdTypeNavigator`)
   - Runtime type compilation and instantiation
   - XML serialization/deserialization helpers

### Key Design Patterns

- **Builder Pattern**: `ModelBuilder` coordinates the construction of complex type models
- **Factory Pattern**: `XsdToCSharpFactory` provides simplified API for common workflows  
- **Visitor Pattern**: Used for traversing XML schema elements
- **Strategy Pattern**: Pluggable naming providers and output writers

### Model Hierarchy

Core models in the domain:
- `TypeModel` (abstract base) → `ClassModel`, `EnumModel`, `SimpleModel`, `InterfaceModel`
- `PropertyModel` represents class properties with XML serialization attributes
- `NamespaceModel` groups types by namespace
- `GeneratorModel` is the root containing all namespaces

### Configuration System

`GeneratorConfiguration` provides extensive customization:
- Namespace mapping strategies (`NamespaceProvider`)
- Collection type preferences
- Naming schemes (Pascal, Direct, Legacy)
- Code generation options (nullables, data binding, EF support)
- Output formatting (single file vs. multiple files)

### Factory Architecture (New)

The `XsdToCSharpFactory` provides a high-level API that:
- Wraps the existing Generator/ModelBuilder pipeline
- Generates runtime-accessible type models via `XsdTypeNavigator`
- Supports XPath-like navigation through generated types
- Provides instance creation and XML serialization capabilities
- Offers dynamic property access and manipulation

## Important Notes

- The project supports both .NET Framework 4.6.2 and .NET Standard 2.0
- Tests use xUnit and target .NET 8.0
- The console app uses Mono.Options for argument parsing
- Generated code uses XmlSerializer attributes for serialization control
- Choice elements are currently handled as sequences (developer must ensure schema validity)
- Complex restrictions and recursive choices have limited support