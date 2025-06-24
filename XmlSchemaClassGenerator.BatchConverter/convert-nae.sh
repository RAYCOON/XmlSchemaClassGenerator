#!/bin/bash

# NAE Schema Batch Conversion Script
# This script converts all NAE XSD files to C# classes

echo "========================================="
echo "NAE Schema to C# Conversion"
echo "========================================="

# Check if we're in the right directory
if [ ! -f "XmlSchemaClassGenerator.BatchConverter.csproj" ]; then
    echo "Error: Please run this script from the XmlSchemaClassGenerator.BatchConverter directory"
    exit 1
fi

# Step 1: Generate configuration if it doesn't exist
if [ ! -f "nae-batch-config.json" ]; then
    echo "Generating NAE batch configuration..."
    dotnet run --project . --no-build -- generate-nae-config
    
    # Actually, let's use a simpler approach - run the C# config generator
    dotnet build -c Release
    dotnet bin/Release/net8.0/xscgen-batch.dll generate-nae-config 2>/dev/null || {
        # If that doesn't work, compile and run the generator
        echo "Compiling configuration generator..."
        dotnet build GenerateNaeConfig.cs -o temp-build
        dotnet temp-build/GenerateNaeConfig.dll
        rm -rf temp-build
    }
fi

# Step 2: Create output directory
echo "Creating output directory..."
mkdir -p output/NAE

# Step 3: Run the batch converter
echo "Starting batch conversion..."
echo ""
dotnet run -- nae-batch-config.json

# Step 4: Summary
echo ""
echo "========================================="
echo "Conversion Complete!"
echo "========================================="
echo "Generated C# files are in: output/NAE/"
echo ""

# Count generated files
if [ -d "output/NAE" ]; then
    file_count=$(find output/NAE -name "*.cs" -type f | wc -l)
    echo "Total C# files generated: $file_count"
    
    # Show directory structure
    echo ""
    echo "Directory structure:"
    ls -la output/NAE/
fi