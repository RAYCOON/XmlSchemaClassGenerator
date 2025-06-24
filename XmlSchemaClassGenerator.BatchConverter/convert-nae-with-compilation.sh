#!/bin/bash

# Convert NAE schemas and test compilation

echo "========================================="
echo "NAE Schema Conversion with Compilation Test"
echo "========================================="

# Function to test compilation of generated files
test_compilation() {
    local dir=$1
    local name=$2
    
    if [ ! -d "$dir" ]; then
        echo "Directory not found: $dir"
        return 1
    fi
    
    # Count CS files
    local cs_count=$(find "$dir" -name "*.cs" | wc -l)
    if [ $cs_count -eq 0 ]; then
        echo "No C# files found in $dir"
        return 1
    fi
    
    echo "Testing compilation of $cs_count files in $name..."
    
    # Create temp project
    cat > temp-compile.csproj << EOF
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
    <Nullable>enable</Nullable>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <NoWarn>CS8981;CS0612;CS0618</NoWarn>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="$dir/**/*.cs" />
  </ItemGroup>
</Project>
EOF
    
    # Try to compile
    if dotnet build temp-compile.csproj -nologo -v q > compile-log.txt 2>&1; then
        echo "✓ Compilation successful for $name"
        rm -f temp-compile.csproj compile-log.txt
        rm -rf bin obj
        return 0
    else
        echo "✗ Compilation failed for $name"
        echo "See compile-log.txt for details"
        rm -f temp-compile.csproj
        rm -rf bin obj
        return 1
    fi
}

# Clean previous output
echo "Cleaning previous output..."
rm -rf output/NAE-Clean
mkdir -p output/NAE-Clean

# Convert schemas with individual configs to avoid conflicts
for schema_type in "Types" "A_Messages" "CommonComponents"; do
    echo ""
    echo "Converting $schema_type schemas..."
    
    case $schema_type in
        "Types")
            schemas=("BasicTypes-1.2.xsd" "BusinessScope-1.2.xsd" "DocumentIdentification-1.2.xsd")
            ;;
        "A_Messages")
            schemas=("A100N-6.0.xsd" "ACK900N-6.0.xsd")
            ;;
        "CommonComponents")
            schemas=("CC-4.4.xsd")
            ;;
    esac
    
    for xsd in "${schemas[@]}"; do
        name="${xsd%.xsd}"
        echo -n "Converting $name... "
        
        # Create individual config
        cat > temp-schema-config.json << EOF
{
  "name": "$name Conversion",
  "outputDirectory": "./output/NAE-Clean/$schema_type/$name",
  "globalSettings": {
    "namespacePrefix": "NAE.$schema_type.$name",
    "generateNullables": true,
    "enableDataBinding": false,
    "generateInterfaces": false,
    "usePascalCase": true,
    "separateFiles": true,
    "collectionType": "System.Collections.Generic.List<>",
    "collectionSettersMode": "Public",
    "generateDescriptionAttribute": false,
    "uniqueTypeNames": true,
    "enableUpaCheck": false,
    "disableComments": true,
    "compactTypeNames": true,
    "namespaceMappings": []
  },
  "schemas": [
    {
      "name": "$name",
      "sourcePath": "schemas/NAE/$xsd",
      "enabled": true
    }
  ]
}
EOF
        
        if dotnet run --no-build -- temp-schema-config.json > /dev/null 2>&1; then
            echo "✓"
            
            # Test compilation
            test_compilation "output/NAE-Clean/$schema_type/$name" "$name"
        else
            echo "✗"
        fi
        
        rm -f temp-schema-config.json
    done
done

echo ""
echo "========================================="
echo "Summary"
echo "========================================="

# Count total generated files
if [ -d "output/NAE-Clean" ]; then
    total_files=$(find output/NAE-Clean -name "*.cs" | wc -l)
    echo "Total C# files generated: $total_files"
    echo ""
    echo "Directory structure:"
    tree -d output/NAE-Clean 2>/dev/null || ls -la output/NAE-Clean/
fi