#!/bin/bash

# Base directories
XSD_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd"
OUTPUT_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source"
XSCGEN="/Users/svenhaude/RiderProjects/Raycoon/XmlSchemaClassGenerator_new/XmlSchemaClassGenerator.Console/bin/Debug/net462/XmlSchemaClassGenerator.Console.exe"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Counter for progress
total_files=$(ls "$XSD_DIR"/*.xsd 2>/dev/null | wc -l)
current=0

echo "Converting $total_files XSD files from V4.4.1..."

# Process each XSD file
for xsd_file in "$XSD_DIR"/*.xsd; do
    if [ -f "$xsd_file" ]; then
        filename=$(basename "$xsd_file")
        # Extract schema ID from filename (e.g., S055 from S055-4.4.xsd)
        schema_id=$(echo "$filename" | sed -E 's/^(.+)-[0-9]+\.[0-9]+\.xsd$/\1/')
        
        current=$((current + 1))
        echo "[$current/$total_files] Processing $filename -> SED.$schema_id.V4_4_1"
        
        # Get the target namespace from the XSD file
        target_ns=$(grep -oP 'targetNamespace="\K[^"]+' "$xsd_file" | head -1)
        
        # Build namespace mappings
        namespace_mappings=""
        
        # Main namespace mapping
        if [ ! -z "$target_ns" ]; then
            namespace_mappings="$namespace_mappings -n \"$target_ns=ITSG.EESSI.Tstelle.XML.SED.$schema_id.V4_4_1\""
        fi
        
        # Add common namespace mappings
        namespace_mappings="$namespace_mappings -n \"http://www.w3.org/2000/09/xmldsig#=ITSG.EESSI.Tstelle.XML.XmlDsig\""
        namespace_mappings="$namespace_mappings -n \"http://uri.etsi.org/01903/v1.3.2#=ITSG.EESSI.Tstelle.XML.Etsi\""
        namespace_mappings="$namespace_mappings -n \"http://uri.etsi.org/02231/v2#=ITSG.EESSI.Tstelle.XML.Etsi2\""
        namespace_mappings="$namespace_mappings -n \"http://www.w3.org/2001/04/xmlenc#=ITSG.EESSI.Tstelle.XML.XmlEnc\""
        
        # Generate C# code with specific output filename
        output_file="$OUTPUT_DIR/${schema_id}-4.4.Designer.cs"
        
        # Run the generator
        eval "mono \"$XSCGEN\" $namespace_mappings --ctor -o \"$OUTPUT_DIR\" -sf \"$xsd_file\""
        
        # Rename the generated files to match the expected pattern
        # The generator creates files based on namespace, so we need to find and rename them
        generated_files=$(find "$OUTPUT_DIR" -name "*.cs" -newer "$xsd_file" -type f 2>/dev/null)
        
        if [ ! -z "$generated_files" ]; then
            # Find the main generated file (should contain the schema_id in namespace)
            for gen_file in $generated_files; do
                if grep -q "namespace.*SED\.$schema_id\.V4_4_1" "$gen_file" 2>/dev/null; then
                    mv "$gen_file" "$output_file"
                    echo "  Generated: $output_file"
                    break
                fi
            done
        fi
    fi
done

echo "Conversion complete!"