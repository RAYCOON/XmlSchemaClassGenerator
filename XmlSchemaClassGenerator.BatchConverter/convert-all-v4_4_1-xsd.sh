#!/bin/bash

# Convert all XSD files from V4_4_1/xsd to C# Classes
# Using namespace and filename conventions from V4_4_0 but with V4_4_1

SOURCE_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd"
OUTPUT_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo -e "\033[36mV4.4.1 XSD to C# Converter\033[0m"
echo -e "\033[36m=========================\033[0m"
echo "Source: $SOURCE_DIR"
echo "Output: $OUTPUT_DIR"
echo ""

# Count XSD files
TOTAL_FILES=$(find "$SOURCE_DIR" -name "*.xsd" -type f | wc -l)
echo -e "\033[32mFound $TOTAL_FILES XSD files to convert\033[0m"

# Create configuration file
CONFIG_FILE="$SCRIPT_DIR/all-v4_4_1-config.json"

# Start building the JSON configuration
cat > "$CONFIG_FILE" << 'EOF'
{
  "Name": "EESSI V4.4.1 Complete Conversion",
  "OutputDirectory": "OUTPUT_PATH_PLACEHOLDER",
  "GlobalSettings": {
    "NamespacePrefix": "ITSG.EESSI.Tstelle.XML",
    "GenerateNullables": true,
    "EnableDataBinding": false,
    "GenerateInterfaces": false,
    "UsePascalCase": true,
    "SeparateFiles": true,
    "SeparateNamespaceHierarchy": false,
    "CollectionType": "System.Collections.Generic.List<>",
    "CollectionSettersMode": "Private",
    "GenerateDescriptionAttribute": true,
    "InitializeComplexTypesInConstructor": true,
    "UniqueTypeNames": false,
    "UseShouldSerializePattern": false,
    "GenerateDesignerFile": true,
    "EnumAsString": false,
    "NamespaceMappings": [
      {
        "XmlNamespace": "http://www.w3.org/2000/09/xmldsig#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XMLDSig"
      },
      {
        "XmlNamespace": "http://uri.etsi.org/01903/v1.3.2#",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XAdES"
      }
    ],
    "FileNameMappings": []
  },
  "Schemas": [
EOF

# Replace output path
sed -i.bak "s|OUTPUT_PATH_PLACEHOLDER|$OUTPUT_DIR|g" "$CONFIG_FILE" && rm "$CONFIG_FILE.bak"

# Add schemas
SCHEMA_COUNT=0
FIRST=true

# Process all XSD files
for xsd_file in $(find "$SOURCE_DIR" -name "*.xsd" -type f | sort); do
    filename=$(basename "$xsd_file")
    
    # Skip xmldsig and XAdES as they're handled globally
    if [[ $filename == "xmldsig-core-schema.xsd" ]] || [[ $filename == "XAdES.xsd" ]]; then
        continue
    fi
    
    # Extract schema identifier (e.g., S055, A001, DA001, etc.)
    if [[ $filename =~ ^([A-Z][A-Z]?[0-9]+[A-Z]?[A-Z]?)-4\.4\.xsd$ ]]; then
        schema_id="${BASH_REMATCH[1]}"
    elif [[ $filename =~ ^([A-Z][A-Z]?[0-9]+_[A-Z][A-Z])-4\.4\.xsd$ ]]; then
        # Handle P3000_XX format
        schema_id="${BASH_REMATCH[1]}"
    elif [[ $filename == "CC-4.4.xsd" ]]; then
        schema_id="CC"
    else
        echo -e "\033[33mSkipping unrecognized file format: $filename\033[0m"
        continue
    fi
    
    # Add comma if not first entry
    if [ "$FIRST" = false ]; then
        echo "," >> "$CONFIG_FILE"
    else
        FIRST=false
    fi
    
    # All schemas go into SED namespace with their schema ID
    namespace_suffix="SED.$schema_id.V4_4_1"
    
    # Determine XML namespace based on schema type
    if [[ $schema_id =~ ^S[0-9]{3}[A-Z]?$ ]]; then
        # S-series have specific XML namespace
        xml_namespace="http://ec.europa.eu/eessi/ns/4_4/$schema_id"
    else
        # All other schemas use the base namespace
        xml_namespace="http://ec.europa.eu/eessi/ns/4_4"
    fi
    
    # Add schema entry
    cat >> "$CONFIG_FILE" << EOF
    {
      "Name": "$schema_id Schema",
      "SourcePath": "$xsd_file",
      "OutputSubDirectory": ".",
      "Settings": {
        "NamespaceMappings": [
          {
            "XmlNamespace": "$xml_namespace",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.$namespace_suffix"
          },
          {
            "XmlNamespace": "http://www.w3.org/2000/09/xmldsig#",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XMLDSig"
          },
          {
            "XmlNamespace": "http://uri.etsi.org/01903/v1.3.2#",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.XAdES"
          }
        ],
        "FileNameMappings": [
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.$namespace_suffix",
            "FileName": "${schema_id}-4.4"
          },
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.XMLDSig",
            "FileName": "XMLDSig-4.4"
          },
          {
            "Namespace": "ITSG.EESSI.Tstelle.XML.XAdES",
            "FileName": "XAdES-4.4"
          }
        ]
      },
      "Enabled": true
    }
EOF
    
    SCHEMA_COUNT=$((SCHEMA_COUNT + 1))
done

# Close JSON
cat >> "$CONFIG_FILE" << 'EOF'

  ]
}
EOF

echo -e "\033[32mConfigured $SCHEMA_COUNT schemas for conversion\033[0m"
echo -e "\033[32mConfiguration saved to: $CONFIG_FILE\033[0m"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
    echo -e "\033[32mCreated output directory: $OUTPUT_DIR\033[0m"
fi

# Run the batch converter
echo -e "\n\033[36mStarting batch conversion...\033[0m"
cd "$SCRIPT_DIR"
dotnet run -- all-v4_4_1-config.json
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo -e "\n\033[32mConversion completed successfully!\033[0m"
    
    # Count generated files
    CS_COUNT=$(find "$OUTPUT_DIR" -name "*.cs" -type f | wc -l | tr -d ' ')
    echo -e "\n\033[36mGenerated $CS_COUNT C# files\033[0m"
    
    # Clean up duplicate XMLDSig and XAdES files if any
    echo -e "\n\033[36mCleaning up duplicate shared files...\033[0m"
    cd "$OUTPUT_DIR"
    
    # Keep only one copy of XMLDSig-4.4.Designer.cs
    xmldsig_files=$(find . -name "XMLDSig-4.4.Designer.cs" -type f)
    xmldsig_count=$(echo "$xmldsig_files" | wc -l)
    if [ $xmldsig_count -gt 1 ]; then
        echo "$xmldsig_files" | tail -n +2 | xargs rm -f
        echo -e "\033[32mRemoved $((xmldsig_count - 1)) duplicate XMLDSig files\033[0m"
    fi
    
    # Keep only one copy of XAdES-4.4.Designer.cs
    xades_files=$(find . -name "XAdES-4.4.Designer.cs" -type f)
    xades_count=$(echo "$xades_files" | wc -l)
    if [ $xades_count -gt 1 ]; then
        echo "$xades_files" | tail -n +2 | xargs rm -f
        echo -e "\033[32mRemoved $((xades_count - 1)) duplicate XAdES files\033[0m"
    fi
else
    echo -e "\n\033[31mConversion failed with exit code: $EXIT_CODE\033[0m"
fi

echo -e "\n\033[32mDone!\033[0m"