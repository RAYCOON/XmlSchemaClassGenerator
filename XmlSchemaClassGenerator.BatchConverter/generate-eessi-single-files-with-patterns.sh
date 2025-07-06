#!/bin/bash

# EESSI Single File Schema Converter with Pattern-Based Namespace Mapping
echo -e "\033[36mEESSI Single File Schema Converter (Pattern-Based)\033[0m"
echo -e "\033[36m==================================================\033[0m"

# Set up paths
SCHEMA_DIR="schemas/Single Files"
OUTPUT_BASE="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source"
CONFIG_FILE="eessi-single-files-pattern-config.json"

# Count schema files
SCHEMA_COUNT=$(ls "$SCHEMA_DIR"/S*.xsd 2>/dev/null | wc -l | tr -d ' ')
echo -e "\033[32mFound $SCHEMA_COUNT EESSI single file schemas\033[0m"

# Start creating the configuration JSON
cat > "$CONFIG_FILE" << 'EOF'
{
  "Name": "EESSI Single Files V4.4.1 Conversion (Pattern-Based)",
  "OutputDirectory": "/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source",
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
    "GenerateDescriptionAttribute": true,
    "InitializeComplexTypesInConstructor": true,
    "UniqueTypeNames": false,
    "UseShouldSerializePattern": false,
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
    "FileNameMappings": []
  },
  "Schemas": [
EOF

# Process each schema file
FIRST=true
for xsd_file in "$SCHEMA_DIR"/S*.xsd; do
    if [ -f "$xsd_file" ]; then
        # Extract schema ID from filename (e.g., S055 from S055-4.4.xsd)
        filename=$(basename "$xsd_file")
        schema_id=$(echo "$filename" | grep -o '^S[0-9A-Z]*')
        
        # Add comma if not first entry
        if [ "$FIRST" = true ]; then
            FIRST=false
        else
            echo "," >> "$CONFIG_FILE"
        fi
        
        # Add schema configuration - no specific namespace mappings needed with patterns!
        cat >> "$CONFIG_FILE" << EOF
    {
      "Name": "$schema_id Single File Schema",
      "SourcePath": "$xsd_file",
      "OutputSubDirectory": ".",
      "Settings": null,
      "Enabled": true
    }
EOF
    fi
done

# Close the JSON structure
cat >> "$CONFIG_FILE" << 'EOF'

  ]
}
EOF

CONFIGURED_COUNT=$(grep -c '"Name":' "$CONFIG_FILE" | grep -v "EESSI Single Files")
echo -e "\033[32mConfigured $CONFIGURED_COUNT schemas for conversion\033[0m"
echo -e "\033[32mAll files will be generated in: $OUTPUT_BASE\033[0m"
echo -e "\033[32mConfiguration saved to: $CONFIG_FILE\033[0m"

# Run the batch converter
echo -e "\n\033[36mStarting batch conversion...\033[0m"
dotnet run --project XmlSchemaClassGenerator.BatchConverter -- "$CONFIG_FILE"