# XmlSchemaClassGenerator Batch Converter

A batch conversion tool for processing multiple XSD files with XmlSchemaClassGenerator.

## Features

- **Batch Processing**: Convert multiple XSD files in one run
- **Configuration-Based**: JSON configuration for reusable conversion settings
- **Progress Tracking**: Visual progress indicators with Spectre.Console
- **Error Handling**: Graceful handling of invalid schemas with detailed error reporting
- **Flexible Settings**: Global and per-schema configuration options
- **Choice Element Support**: Handles XSD choice elements with two modes (sequences or xsd.exe-compatible)

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
- `generateChoiceItemProperty`: Generate Item property for choice elements like xsd.exe (default: false)
- `namespaceMappings`: XML to C# namespace mappings

### Per-Schema Settings
All global settings can be overridden per schema, plus:
- `separateSubstitutes`: Separate properties for substitution groups

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

### Converting an Entire Directory
```json
{
  "name": "Convert All XSD Files in Directory",
  "outputDirectory": "./generated",
  "globalSettings": {
    "generateNullables": true,
    "separateFiles": true,
    "generateChoiceItemProperty": true,
    "collectionType": "System.Collections.Generic.List<>",
    "namespaceMappings": [
      {
        "xmlNamespace": "http://example.com/common",
        "cSharpNamespace": "MyCompany.Common"
      }
    ]
  },
  "schemas": [
    { "name": "Order", "sourcePath": "schemas/order/*.xsd", "enabled": true },
    { "name": "Customer", "sourcePath": "schemas/customer/*.xsd", "enabled": true },
    { "name": "Product", "sourcePath": "schemas/product/*.xsd", "enabled": true }
  ]
}
```

### Using Namespace Patterns
```json
{
  "name": "Pattern-Based Namespace Mapping",
  "outputDirectory": "./output",
  "globalSettings": {
    "namespacePatterns": [
      {
        "xmlPattern": "http://example.com/schemas/{module}/{version}",
        "cSharpTemplate": "MyCompany.{module}.V{version}"
      }
    ]
  },
  "schemas": [
    { "name": "All Schemas", "sourcePath": "schemas/**/*.xsd", "enabled": true }
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

XmlSchemaClassGenerator offers two modes for handling choice elements:

1. **Default Mode**: Treats choices as sequences - all choice options are generated as separate properties. Developers must ensure only one choice option is used at runtime.

2. **xsd.exe Compatible Mode**: Set `"generateChoiceItemProperty": true` to generate a single `Item` property with an `ItemElementName` enum property, similar to xsd.exe behavior. This provides better type safety and runtime validation.

Example configuration with choice support:
```json
{
  "globalSettings": {
    "generateChoiceItemProperty": true
  }
}
```

## Shell Script Examples

### Converting All XSD Files in a Directory

For more complex scenarios, you can use shell scripts to dynamically generate configurations. Here's an example that converts all XSD files in a directory:

```bash
#!/bin/bash
# convert-directory.sh

SOURCE_DIR="./schemas"
OUTPUT_DIR="./generated"
CONFIG_FILE="batch-config.json"

# Create JSON configuration
cat > "$CONFIG_FILE" << EOF
{
  "name": "Directory Conversion",
  "outputDirectory": "$OUTPUT_DIR",
  "globalSettings": {
    "generateNullables": true,
    "separateFiles": true,
    "generateChoiceItemProperty": true
  },
  "schemas": [
EOF

# Find all XSD files and add them to config
FIRST=true
for xsd_file in $(find "$SOURCE_DIR" -name "*.xsd" | sort); do
    filename=$(basename "$xsd_file")
    name="${filename%.*}"
    
    if [ "$FIRST" = false ]; then
        echo "," >> "$CONFIG_FILE"
    else
        FIRST=false
    fi
    
    cat >> "$CONFIG_FILE" << EOF
    {
      "name": "$name",
      "sourcePath": "$xsd_file",
      "enabled": true
    }
EOF
done

# Close JSON
cat >> "$CONFIG_FILE" << EOF

  ]
}
EOF

# Run the converter
dotnet run "$CONFIG_FILE"
```

### Using Pattern-Based Namespace Mapping

For schemas with predictable namespace patterns (like versioned APIs), use pattern-based mapping:

```bash
# Example: Convert EESSI schemas with pattern-based namespaces
# XSD namespace: http://ec.europa.eu/eessi/ns/4_4/S001
# C# namespace: ITSG.EESSI.Tstelle.XML.SED.S001.V4_4_1

{
  "globalSettings": {
    "namespacePatterns": [
      {
        "xmlPattern": "http://ec.europa.eu/eessi/ns/4_4/{id}",
        "cSharpTemplate": "ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1"
      }
    ]
  }
}
```