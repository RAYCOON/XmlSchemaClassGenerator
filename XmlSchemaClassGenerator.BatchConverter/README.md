# XmlSchemaClassGenerator Batch Converter

A batch conversion tool for processing multiple XSD files with XmlSchemaClassGenerator.

## Features

- **Batch Processing**: Convert multiple XSD files in one run
- **Configuration-Based**: JSON configuration for reusable conversion settings
- **Progress Tracking**: Visual progress indicators with Spectre.Console
- **Error Handling**: Graceful handling of invalid schemas with detailed error reporting
- **Flexible Settings**: Global and per-schema configuration options
- **Choice Element Support**: Handles XSD choice elements (as sequences)

## Usage

```bash
cd XmlSchemaClassGenerator.BatchConverter
dotnet run [config-file.json]
```

If no configuration file is specified, it looks for `batch-config.json`. If the file doesn't exist, an example configuration is created.

## Configuration Structure

```json
{
  "name": "My XSD Batch Conversion",
  "outputDirectory": "./generated",
  "globalSettings": {
    "namespacePrefix": "MyCompany",
    "generateNullables": true,
    "enableDataBinding": true,
    "generateInterfaces": true,
    "usePascalCase": true,
    "separateFiles": true,
    "collectionType": "System.Collections.Generic.List<>",
    "collectionSettersMode": "Public",
    "namespaceMappings": [
      {
        "xmlNamespace": "http://example.com/schema",
        "cSharpNamespace": "MyCompany.Schema"
      }
    ]
  },
  "schemas": [
    {
      "name": "Order Schema",
      "sourcePath": "schemas/order.xsd",
      "outputSubDirectory": "Order",
      "enabled": true,
      "settings": {
        "separateSubstitutes": true,
        "useShouldSerializePattern": true
      }
    }
  ]
}
```

## Settings Options

### Global Settings
- `namespacePrefix`: Prefix for auto-generated namespaces
- `generateNullables`: Generate nullable properties
- `enableDataBinding`: Enable INotifyPropertyChanged
- `generateInterfaces`: Generate interfaces for groups
- `usePascalCase`: Use Pascal case naming
- `separateFiles`: Generate separate file per class
- `collectionType`: Collection type to use
- `collectionSettersMode`: Collection setter visibility
- `namespaceMappings`: XML to C# namespace mappings

### Per-Schema Settings
All global settings can be overridden per schema, plus:
- `separateSubstitutes`: Separate properties for substitution groups
- `handleChoicesAsSequence`: Currently always treats choices as sequences

## Example Configurations

### Simple Batch
```json
{
  "name": "Simple Conversion",
  "outputDirectory": "./output",
  "schemas": [
    { "name": "Schema1", "sourcePath": "schema1.xsd", "enabled": true },
    { "name": "Schema2", "sourcePath": "schema2.xsd", "enabled": true }
  ]
}
```

### Complex Schemas with Choices
```json
{
  "name": "Complex Schemas",
  "outputDirectory": "./generated",
  "globalSettings": {
    "generateNullables": true,
    "separateFiles": true,
    "useShouldSerializePattern": true
  },
  "schemas": [
    {
      "name": "Schema with Choices",
      "sourcePath": "complex.xsd",
      "settings": {
        "separateSubstitutes": true,
        "uniqueTypeNames": true
      }
    }
  ]
}
```

## Building

```bash
dotnet build
```

## Note on Choice Elements

The XmlSchemaClassGenerator currently handles XSD choice elements as sequences. This means all choice options will be generated as properties. Developers must ensure only one choice option is used at runtime according to the schema constraints.