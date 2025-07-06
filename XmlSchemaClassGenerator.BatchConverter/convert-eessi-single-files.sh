#!/bin/bash

# Convert EESSI Single File Schemas to C# Classes
# Target: /Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source

# Default output path
OUTPUT_PATH="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source"
XSD_OUTPUT_PATH="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd"
TEST_MODE=false
COPY_XSD=true

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output)
            OUTPUT_PATH="$2"
            shift 2
            ;;
        --xsd-output)
            XSD_OUTPUT_PATH="$2"
            shift 2
            ;;
        --no-xsd)
            COPY_XSD=false
            shift
            ;;
        -t|--test)
            TEST_MODE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  -o, --output PATH       Output directory path (default: $OUTPUT_PATH)"
            echo "  --xsd-output PATH       XSD output directory path (default: $XSD_OUTPUT_PATH)"
            echo "  --no-xsd                Do not copy XSD files"
            echo "  -t, --test              Test mode - only convert first 3 schemas"
            echo "  -h, --help              Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo -e "\033[36mEESSI Single File Schema Converter\033[0m"
echo -e "\033[36m===================================\033[0m"

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCHEMAS_DIR="$SCRIPT_DIR/schemas/Single Files"

# Count XSD files
XSD_COUNT=$(find "$SCHEMAS_DIR" -name "S[0-9][0-9][0-9]-*.xsd" | wc -l | tr -d ' ')
echo -e "\033[32mFound $XSD_COUNT EESSI single file schemas\033[0m"

# Create configuration JSON
CONFIG_FILE="$SCRIPT_DIR/eessi-single-files-config.json"

# Start building the JSON configuration
cat > "$CONFIG_FILE" << 'EOF'
{
  "Name": "EESSI Single Files V4.4.1 Conversion",
  "OutputDirectory": "OUTPUT_PATH_PLACEHOLDER",
  "GlobalSettings": {
    "NamespacePrefix": "ITSG.EESSI.Tstelle.XML.SED",
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
    "EnumAsString": false,
    "NamespaceMappings": [
      {
        "XmlNamespace": "http://ec.europa.eu/eessi/ns/4_4",
        "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.SED.V4_4_1"
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
    "FileNameMappings": []
  },
  "Schemas": [
EOF

# Replace output path
sed -i.bak "s|OUTPUT_PATH_PLACEHOLDER|$OUTPUT_PATH|g" "$CONFIG_FILE" && rm "$CONFIG_FILE.bak"

# Add schemas
SCHEMA_COUNT=0
FIRST=true
for xsd_file in $(find "$SCHEMAS_DIR" -name "S[0-9][0-9][0-9]-*.xsd" | sort); do
    # Extract schema number
    filename=$(basename "$xsd_file")
    if [[ $filename =~ ^(S[0-9]{3}) ]]; then
        schema_number="${BASH_REMATCH[1]}"
        
        # Add comma if not first entry
        if [ "$FIRST" = false ]; then
            echo "," >> "$CONFIG_FILE"
        else
            FIRST=false
        fi
        
        # Add schema entry
        cat >> "$CONFIG_FILE" << EOF
    {
      "Name": "$schema_number Single File Schema",
      "SourcePath": "schemas/Single Files/$filename",
      "OutputSubDirectory": ".",
      "Settings": {
        "NamespaceMappings": [
          {
            "XmlNamespace": "http://ec.europa.eu/eessi/ns/4_4/$schema_number",
            "CSharpNamespace": "ITSG.EESSI.Tstelle.XML.SED.$schema_number.V4_4_1"
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
            "Namespace": "ITSG.EESSI.Tstelle.XML.SED.$schema_number.V4_4_1",
            "FileName": "$schema_number-4.4"
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
        
        # Check test mode limit
        if [ "$TEST_MODE" = true ] && [ $SCHEMA_COUNT -ge 3 ]; then
            echo -e "\033[33mTest mode: Limited to 3 schemas\033[0m"
            break
        fi
    fi
done

# Close JSON
cat >> "$CONFIG_FILE" << 'EOF'

  ]
}
EOF

echo -e "\033[32mConfigured $SCHEMA_COUNT schemas for conversion\033[0m"
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
dotnet run -- eessi-single-files-config.json
EXIT_CODE=$?

# Clean up duplicate XMLDSig and XAdES files
if [ $EXIT_CODE -eq 0 ]; then
    echo -e "\n\033[36mCleaning up duplicate XMLDSig and XAdES files...\033[0m"
    cd "$OUTPUT_PATH"
    # Keep only one copy of each shared file
    XMLDSIG_COUNT=$(ls XMLDSig-4.4.Designer.cs 2>/dev/null | wc -l)
    XADES_COUNT=$(ls XAdES-4.4.Designer.cs 2>/dev/null | wc -l)
    if [ $XMLDSIG_COUNT -gt 0 ] || [ $XADES_COUNT -gt 0 ]; then
        echo -e "\033[32mShared files already exist, no duplicates to remove\033[0m"
    fi
fi

if [ $EXIT_CODE -eq 0 ]; then
    echo -e "\n\033[32mConversion completed successfully!\033[0m"
    
    # Count generated files
    CS_COUNT=$(find "$OUTPUT_PATH" -name "*.cs" -type f | wc -l | tr -d ' ')
    echo -e "\n\033[36mGenerated $CS_COUNT C# files:\033[0m"
    
    # List generated files (first 10)
    find "$OUTPUT_PATH" -name "*.cs" -type f | head -10 | while read -r file; do
        echo -e "  \033[90m- ${file#$OUTPUT_PATH/}\033[0m"
    done
    
    if [ $CS_COUNT -gt 10 ]; then
        echo -e "  \033[90m... and $((CS_COUNT - 10)) more files\033[0m"
    fi
else
    echo -e "\n\033[31mConversion failed with exit code: $EXIT_CODE\033[0m"
fi

# Copy XSD files if enabled
if [ "$COPY_XSD" = true ] && [ $EXIT_CODE -eq 0 ]; then
    echo -e "\n\033[36mCopying XSD files to $XSD_OUTPUT_PATH...\033[0m"
    
    # Create XSD output directory if it doesn't exist
    if [ ! -d "$XSD_OUTPUT_PATH" ]; then
        mkdir -p "$XSD_OUTPUT_PATH"
        echo -e "\033[32mCreated XSD output directory: $XSD_OUTPUT_PATH\033[0m"
    fi
    
    # Copy and rename XSD files
    COPIED_COUNT=0
    for xsd_file in "$SCHEMAS_DIR"/S[0-9][0-9][0-9]-*.xsd; do
        if [ -f "$xsd_file" ]; then
            filename=$(basename "$xsd_file")
            if [[ $filename =~ ^(S[0-9]{3}) ]]; then
                schema_number="${BASH_REMATCH[1]}"
                new_filename="${schema_number}-4.4.xsd"
                
                cp "$xsd_file" "$XSD_OUTPUT_PATH/$new_filename"
                COPIED_COUNT=$((COPIED_COUNT + 1))
                
                # Check test mode limit for XSD copy
                if [ "$TEST_MODE" = true ] && [ $COPIED_COUNT -ge 3 ]; then
                    break
                fi
            fi
        fi
    done
    
    echo -e "\033[32mCopied $COPIED_COUNT XSD files\033[0m"
fi

echo -e "\n\033[32mDone!\033[0m"