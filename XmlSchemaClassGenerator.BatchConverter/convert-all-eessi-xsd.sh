#!/bin/bash

# Convert ALL EESSI XSD Schemas to C# Classes with Pattern-Based Namespaces
# Source: XmlSchemaClassGenerator.Tests/xsd/eessi

# Default paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_DIR="$SCRIPT_DIR/../XmlSchemaClassGenerator.Tests/xsd/eessi"
OUTPUT_PATH="$SCRIPT_DIR/generated-eessi"
SCHEMAS_DIR="$SCRIPT_DIR/schemas/eessi"
TEST_MODE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output)
            OUTPUT_PATH="$2"
            shift 2
            ;;
        -t|--test)
            TEST_MODE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  -o, --output PATH       Output directory path (default: $OUTPUT_PATH)"
            echo "  -t, --test              Test mode - only convert first 10 schemas"
            echo "  -h, --help              Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo -e "\033[36mEESSI All Schemas Converter (Pattern-Based)\033[0m"
echo -e "\033[36m==========================================\033[0m"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "\033[31mError: Source directory not found: $SOURCE_DIR\033[0m"
    exit 1
fi

# Create schemas directory
mkdir -p "$SCHEMAS_DIR"

# Copy XSD files to schemas directory
echo -e "\033[32mCopying XSD files from test directory...\033[0m"
cp "$SOURCE_DIR"/*.xsd "$SCHEMAS_DIR/"

# Count XSD files (excluding XAdES and xmldsig)
XSD_COUNT=$(find "$SCHEMAS_DIR" -name "[A-Z]*-*.xsd" ! -name "XAdES.xsd" ! -name "xmldsig*.xsd" | wc -l | tr -d ' ')
echo -e "\033[32mFound $XSD_COUNT EESSI schemas to convert\033[0m"

# Create configuration JSON
CONFIG_FILE="$SCRIPT_DIR/all-eessi-config.json"

# Start building the JSON configuration
cat > "$CONFIG_FILE" << EOF
{
  "Name": "All EESSI Schemas V4.4.1 Conversion (Pattern-Based)",
  "OutputDirectory": "$OUTPUT_PATH",
  "GlobalSettings": {
    "NamespacePrefix": "",
    "GenerateNullables": true,
    "EnableDataBinding": false,
    "GenerateInterfaces": false,
    "UsePascalCase": true,
    "SeparateFiles": false,
    "SeparateNamespaceHierarchy": false,
    "CollectionType": "System.Collections.Generic.List<>",
    "CollectionSettersMode": "Private",
    "GenerateDescriptionAttribute": false,
    "InitializeComplexTypesInConstructor": true,
    "GenerateChoiceItemProperty": true,
    "UniqueTypeNames": false,
    "UseShouldSerializePattern": false,
    "EnumAsString": false,
    "NamespaceMappings": [
      {
        "XmlNamespace": "http://www.w3.org/2000/09/xmldsig#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XmlDsig"
      },
      {
        "XmlNamespace": "http://uri.etsi.org/01903/v1.3.2#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.Etsi"
      },
      {
        "XmlNamespace": "http://uri.etsi.org/01903/v1.4.1#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.Etsi141"
      },
      {
        "XmlNamespace": "http://uri.etsi.org/02231/v2#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.Etsi2"
      },
      {
        "XmlNamespace": "http://www.w3.org/2001/04/xmlenc#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XmlEnc"
      }
    ],
    "NamespacePatterns": [
      {
        "XmlPattern": "http://ec.europa.eu/eessi/ns/4_4/{id}",
        "CSharpTemplate": "ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1"
      },
      {
        "XmlPattern": "http://ec.europa.eu/eessi/ns/4_4",
        "CSharpTemplate": "ITSG.EESSI.Tstelle.XML.SED.V4_4_1"
      }
    ],
    "FileNameMappings": [
      {
        "Namespace": "ITSG.EESSI.Tstelle.XML.XmlDsig",
        "FileName": "XmlDsig"
      },
      {
        "Namespace": "ITSG.EESSI.Tstelle.XML.Etsi",
        "FileName": "XAdES"
      }
    ]
  },
  "Schemas": [
EOF

# Add schemas
SCHEMA_COUNT=0
FIRST=true

# Process all EESSI schema files (excluding XAdES and xmldsig)
for xsd_file in $(find "$SCHEMAS_DIR" -name "[A-Z]*-*.xsd" ! -name "XAdES.xsd" ! -name "xmldsig*.xsd" | sort); do
    filename=$(basename "$xsd_file")
    
    # Extract schema ID (e.g., S071, A001, DA003, etc.)
    if [[ $filename =~ ^([A-Z][A-Z0-9]+)-.*\.xsd$ ]]; then
        schema_id="${BASH_REMATCH[1]}"
        
        # Add comma if not first entry
        if [ "$FIRST" = false ]; then
            echo "," >> "$CONFIG_FILE"
        else
            FIRST=false
        fi
        
        # Add schema entry
        cat >> "$CONFIG_FILE" << EOF
    {
      "Name": "$schema_id Schema",
      "SourcePath": "schemas/eessi/$filename",
      "OutputSubDirectory": ".",
      "Settings": {
        "NamespaceMappings": [
          {
            "XmlNamespace": "http://www.w3.org/2000/09/xmldsig#",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XmlDsig"
          },
          {
            "XmlNamespace": "http://uri.etsi.org/01903/v1.3.2#",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.Etsi"
          },
          {
            "XmlNamespace": "http://uri.etsi.org/01903/v1.4.1#",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.Etsi141"
          }
        ],
        "NamespacePatterns": [
          {
            "XmlPattern": "http://ec.europa.eu/eessi/ns/4_4/{id}",
            "CSharpTemplate": "ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1"
          }
        ],
        "FileNameMappings": [
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.SED.$schema_id.V4_4_1",
            "FileName": "$schema_id"
          },
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.XmlDsig",
            "FileName": "XmlDsig"
          },
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.Etsi",
            "FileName": "XAdES"
          }
        ]
      },
      "Enabled": true
    }
EOF
        
        SCHEMA_COUNT=$((SCHEMA_COUNT + 1))
        
        # Check test mode limit
        if [ "$TEST_MODE" = true ] && [ $SCHEMA_COUNT -ge 10 ]; then
            echo -e "\033[33mTest mode: Limited to 10 schemas\033[0m"
            break
        fi
    fi
done

# Add dependency schemas (XAdES and xmldsig)
echo "," >> "$CONFIG_FILE"
cat >> "$CONFIG_FILE" << 'EOF'
    {
      "Name": "XAdES Schema",
      "SourcePath": "schemas/eessi/XAdES.xsd",
      "OutputSubDirectory": ".",
      "Settings": null,
      "Enabled": true
    },
    {
      "Name": "XML Digital Signature Schema",
      "SourcePath": "schemas/eessi/xmldsig-core-schema.xsd",
      "OutputSubDirectory": ".",
      "Settings": null,
      "Enabled": true
    }
EOF

# Close JSON
cat >> "$CONFIG_FILE" << 'EOF'

  ]
}
EOF

echo -e "\033[32mConfigured $SCHEMA_COUNT EESSI schemas + 2 dependency schemas for conversion\033[0m"
echo -e "\033[32mAll files will be generated in: $OUTPUT_PATH\033[0m"
echo -e "\033[32mConfiguration saved to: $CONFIG_FILE\033[0m"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_PATH" ]; then
    mkdir -p "$OUTPUT_PATH"
    echo -e "\033[32mCreated output directory: $OUTPUT_PATH\033[0m"
fi

# Run the batch converter
echo -e "\n\033[36mStarting batch conversion...\033[0m"
cd "$SCRIPT_DIR"
dotnet run -- all-eessi-config.json
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo -e "\n\033[32mConversion completed successfully!\033[0m"
    
    # Count generated files
    CS_COUNT=$(find "$OUTPUT_PATH" -name "*.cs" -type f | wc -l | tr -d ' ')
    echo -e "\n\033[36mGenerated $CS_COUNT C# files:\033[0m"
    
    # List generated files (first 10)
    find "$OUTPUT_PATH" -name "*.cs" -type f | sort | head -10 | while read -r file; do
        echo -e "  \033[90m- ${file#$OUTPUT_PATH/}\033[0m"
    done
    
    if [ $CS_COUNT -gt 10 ]; then
        echo -e "  \033[90m... and $((CS_COUNT - 10)) more files\033[0m"
    fi
    
    # Show namespace pattern examples
    echo -e "\n\033[36mNamespace pattern applied:\033[0m"
    echo -e "  XML: http://ec.europa.eu/eessi/ns/4_4/{id}"
    echo -e "  C#:  ITSG.EESSI.Tstelle.XML.SED.{id}.V4_4_1"
    echo -e "\n\033[36mExamples:\033[0m"
    echo -e "  A008 → ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_1"
    echo -e "  S071 → ITSG.EESSI.Tstelle.XML.SED.S071.V4_4_1"
    echo -e "  DA003 → ITSG.EESSI.Tstelle.XML.SED.DA003.V4_4_1"
else
    echo -e "\n\033[31mConversion failed with exit code: $EXIT_CODE\033[0m"
fi

echo -e "\n\033[32mDone!\033[0m"