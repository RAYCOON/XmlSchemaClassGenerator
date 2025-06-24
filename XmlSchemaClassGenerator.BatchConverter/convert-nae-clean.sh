#!/bin/bash

# Clean conversion of NAE schemas with proper isolation

echo "========================================="
echo "NAE Clean Schema Conversion"
echo "========================================="

# Function to convert a single schema
convert_single_schema() {
    local xsd_file=$1
    local schema_name=$2
    local group=$3
    local output_dir="output/NAE-Individual/$group/$schema_name"
    
    # Create config for this single schema
    cat > temp-single-config.json << EOF
{
  "name": "$schema_name",
  "outputDirectory": "$output_dir",
  "globalSettings": {
    "namespacePrefix": "NAE.$group",
    "generateNullables": true,
    "enableDataBinding": false,
    "generateInterfaces": false,
    "usePascalCase": true,
    "separateFiles": true,
    "separateNamespaceHierarchy": false,
    "collectionType": "System.Collections.Generic.List<>",
    "collectionSettersMode": "Public",
    "generateDescriptionAttribute": false,
    "uniqueTypeNames": true,
    "useShouldSerializePattern": false,
    "enumAsString": false,
    "enableUpaCheck": false,
    "doNotForceIsNullable": true,
    "compactTypeNames": true,
    "disableComments": true,
    "generateDesignerCategoryAttribute": false,
    "generateSerializableAttribute": false,
    "generateDebuggerStepThroughAttribute": false,
    "namespaceMappings": []
  },
  "schemas": [
    {
      "name": "$schema_name",
      "sourcePath": "$xsd_file",
      "enabled": true
    }
  ]
}
EOF
    
    # Try to convert
    if dotnet run --no-build -- temp-single-config.json > /dev/null 2>&1; then
        echo "✓ $schema_name"
        return 0
    else
        echo "✗ $schema_name (conversion failed)"
        return 1
    fi
}

# Clean output directory
rm -rf output/NAE-Individual
mkdir -p output/NAE-Individual

# Convert basic types first (others may depend on these)
echo ""
echo "Phase 1: Converting base types..."
for xsd in schemas/NAE/*Types*.xsd schemas/NAE/*Identification*.xsd schemas/NAE/*Scope*.xsd; do
    if [ -f "$xsd" ]; then
        filename=$(basename "$xsd")
        name="${filename%.xsd}"
        convert_single_schema "$xsd" "$name" "Types"
    fi
done

# Convert common components
echo ""
echo "Phase 2: Converting common components..."
for xsd in schemas/NAE/CC-*.xsd; do
    if [ -f "$xsd" ]; then
        filename=$(basename "$xsd")
        name="${filename%.xsd}"
        convert_single_schema "$xsd" "$name" "CommonComponents"
    fi
done

# Convert message schemas
echo ""
echo "Phase 3: Converting message schemas..."
for prefix in A H R S X; do
    echo "  Converting ${prefix} messages..."
    for xsd in schemas/NAE/${prefix}*.xsd; do
        if [ -f "$xsd" ] && [[ ! "$xsd" =~ Types|CC- ]]; then
            filename=$(basename "$xsd")
            name="${filename%.xsd}"
            convert_single_schema "$xsd" "$name" "${prefix}_Messages"
        fi
    done
done

# Convert BUC schemas
echo ""
echo "Phase 4: Converting BUC schemas..."
for xsd in schemas/NAE/GKV_BUC_*.xsd; do
    if [ -f "$xsd" ]; then
        filename=$(basename "$xsd")
        name="${filename%.xsd}"
        # Extract BUC number
        if [[ $filename =~ BUC_([0-9]+) ]]; then
            buc_num="${BASH_REMATCH[1]}"
            convert_single_schema "$xsd" "$name" "BUC_$buc_num"
        else
            convert_single_schema "$xsd" "$name" "BUC_Other"
        fi
    fi
done

# Clean up
rm -f temp-single-config.json

# Summary
echo ""
echo "========================================="
echo "Conversion Summary"
echo "========================================="

if [ -d "output/NAE-Individual" ]; then
    # Count files by directory
    echo "Generated files by category:"
    for dir in output/NAE-Individual/*; do
        if [ -d "$dir" ]; then
            category=$(basename "$dir")
            count=$(find "$dir" -name "*.cs" -type f | wc -l)
            echo "  $category: $count files"
        fi
    done
    
    total=$(find output/NAE-Individual -name "*.cs" -type f | wc -l)
    echo ""
    echo "Total C# files generated: $total"
fi

echo ""
echo "To use these generated classes:"
echo "1. Each schema is in its own namespace (NAE.[Group])"
echo "2. Add references between projects as needed"
echo "3. Consider creating a shared base project for Types"