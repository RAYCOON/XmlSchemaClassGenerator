#!/bin/bash

# Convert NAE schemas individually to avoid validation conflicts

echo "========================================="
echo "NAE Individual Schema Conversion"
echo "========================================="

# Create output directory
mkdir -p output/NAE

# Counter for progress
total=$(ls schemas/NAE/*.xsd 2>/dev/null | wc -l)
current=0
success=0
failed=0

# Create a log file
log_file="nae-conversion-$(date +%Y%m%d-%H%M%S).log"

echo "Converting $total XSD files individually..."
echo "Log file: $log_file"
echo ""

# Convert each XSD file individually
for xsd in schemas/NAE/*.xsd; do
    if [ -f "$xsd" ]; then
        ((current++))
        filename=$(basename "$xsd")
        name="${filename%.xsd}"
        
        # Determine output subdirectory
        subdir="Other"
        if [[ $filename == GKV_BUC_* ]]; then subdir="GKV_BUC"
        elif [[ $filename == H* ]]; then subdir="H_Messages"
        elif [[ $filename == X* ]]; then subdir="X_Messages"
        elif [[ $filename == A* ]]; then subdir="A_Messages"
        elif [[ $filename == R* ]]; then subdir="R_Messages"
        elif [[ $filename == S* ]]; then subdir="S_Messages"
        elif [[ $filename == *Types* ]]; then subdir="Types"
        elif [[ $filename == *CC-* ]]; then subdir="CommonComponents"
        fi
        
        # Create temp config for this schema
        cat > temp-nae-config.json << EOF
{
  "name": "NAE Single Schema: $name",
  "outputDirectory": "./output/NAE/$subdir",
  "globalSettings": {
    "namespacePrefix": "NAE.$subdir",
    "generateNullables": true,
    "enableDataBinding": false,
    "generateInterfaces": true,
    "usePascalCase": true,
    "separateFiles": true,
    "collectionType": "System.Collections.Generic.List<>",
    "collectionSettersMode": "Public",
    "generateDescriptionAttribute": true,
    "uniqueTypeNames": true,
    "enableUpaCheck": false,
    "namespaceMappings": []
  },
  "schemas": [
    {
      "name": "$name",
      "sourcePath": "$xsd",
      "enabled": true
    }
  ]
}
EOF
        
        echo -n "[$current/$total] Converting $name... "
        
        # Run conversion and capture output
        if dotnet run --no-build -- temp-nae-config.json > /dev/null 2>&1; then
            echo "✓"
            ((success++))
            echo "[$current/$total] SUCCESS: $name" >> "$log_file"
        else
            echo "✗"
            ((failed++))
            echo "[$current/$total] FAILED: $name" >> "$log_file"
            # Capture error details
            dotnet run --no-build -- temp-nae-config.json >> "$log_file" 2>&1
        fi
        
        # Clean up temp config
        rm -f temp-nae-config.json
    fi
done

echo ""
echo "========================================="
echo "Conversion Summary"
echo "========================================="
echo "Total schemas: $total"
echo "Successful: $success"
echo "Failed: $failed"
echo ""
echo "Check $log_file for details"

# Show generated files
if [ -d "output/NAE" ]; then
    file_count=$(find output/NAE -name "*.cs" -type f 2>/dev/null | wc -l)
    echo "Total C# files generated: $file_count"
fi