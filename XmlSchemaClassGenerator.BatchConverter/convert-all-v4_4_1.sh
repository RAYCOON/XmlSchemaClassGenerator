#!/bin/bash

XSD_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd"
OUTPUT_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source"
XSCGEN="/Users/svenhaude/RiderProjects/Raycoon/XmlSchemaClassGenerator_new/XmlSchemaClassGenerator.Console/bin/Debug/net462/XmlSchemaClassGenerator.Console.exe"
NAMESPACE_FILE="/Users/svenhaude/RiderProjects/Raycoon/XmlSchemaClassGenerator_new/XmlSchemaClassGenerator.BatchConverter/eessi-v4_4_1-namespaces.txt"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Count files
total_files=$(ls "$XSD_DIR"/*.xsd 2>/dev/null | wc -l | tr -d ' ')
current=0

echo "Converting $total_files XSD files from V4.4.1..."

# Process each XSD file
for xsd_file in "$XSD_DIR"/*.xsd; do
    if [ -f "$xsd_file" ]; then
        filename=$(basename "$xsd_file")
        schema_id=$(echo "$filename" | sed -E 's/^(.+)-[0-9]+\.[0-9]+\.xsd$/\1/')
        
        current=$((current + 1))
        echo "[$current/$total_files] Processing $filename..."
        
        # Generate C# code
        mono "$XSCGEN" \
            -nf "$NAMESPACE_FILE" \
            --ctor \
            -sf \
            -o "$OUTPUT_DIR" \
            "$xsd_file"
        
        if [ $? -eq 0 ]; then
            echo "  ✓ Generated successfully"
        else
            echo "  ✗ Failed to generate"
        fi
    fi
done

echo "Conversion complete!"
echo "Generated files in: $OUTPUT_DIR"