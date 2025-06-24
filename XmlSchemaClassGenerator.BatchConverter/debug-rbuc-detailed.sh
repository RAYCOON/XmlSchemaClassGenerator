#!/bin/bash

# Detailed debugging for R_BUC schemas

echo "=== Debugging R_BUC Schema Issues ==="
echo ""

# Test with verbose output
test_schema="schemas/NAE-structured/transactions/R_BUC_01-4.4-Counterparty-CaseOwner-New-X050N-4.4.1-20250606T150014.xsd"

echo "1. Checking schema structure:"
echo "----------------------------"
head -50 "$test_schema"

echo ""
echo "2. Checking all imports/includes:"
echo "---------------------------------"
grep -E "(import|include|redefine)" "$test_schema"

echo ""
echo "3. Checking if referenced files exist:"
echo "--------------------------------------"
# Extract schemaLocation values
grep -E "schemaLocation" "$test_schema" | grep -o 'schemaLocation="[^"]*"' | cut -d'"' -f2 | while read -r ref; do
    # Resolve relative path
    base_dir=$(dirname "$test_schema")
    resolved_path="$base_dir/$ref"
    resolved_path=$(realpath "$resolved_path" 2>/dev/null || echo "$resolved_path")
    
    if [ -f "$resolved_path" ]; then
        echo "✓ Found: $ref -> $resolved_path"
    else
        echo "✗ Missing: $ref (looked in $resolved_path)"
    fi
done

echo ""
echo "4. Testing with validation disabled:"
echo "------------------------------------"
# Create test config without validation
cat > test-rbuc-no-validation.json << EOF
{
  "name": "Test R_BUC No Validation",
  "outputDirectory": "./output/test-rbuc-no-validation",
  "globalSettings": {
    "namespacePrefix": "NAE.RBUC",
    "generateNullables": true,
    "enableDataBinding": false,
    "generateInterfaces": false,
    "usePascalCase": true,
    "separateFiles": true,
    "enableUpaCheck": false,
    "generateDescriptionAttribute": false,
    "disableComments": true,
    "namespaceMappings": []
  },
  "schemas": [
    {
      "name": "R_BUC_01_Test",
      "sourcePath": "$test_schema",
      "enabled": true
    }
  ]
}
EOF

echo "Running conversion with validation disabled..."
if dotnet run --no-build -- test-rbuc-no-validation.json 2>&1 | tee rbuc-debug.log; then
    echo "✓ Conversion completed"
    find output/test-rbuc-no-validation -name "*.cs" | wc -l | xargs echo "Generated files:"
else
    echo "✗ Conversion failed"
    echo "Last 20 lines of error:"
    tail -20 rbuc-debug.log
fi

echo ""
echo "5. Checking for circular dependencies:"
echo "--------------------------------------"
# Look for potential circular references
echo "Files that reference X050N:"
grep -l "X050N" schemas/NAE-structured/transactions/*.xsd | wc -l

echo ""
echo "6. Try converting just the sed type:"
# Find the actual SED definition
sed_file=$(find schemas/NAE-structured -name "X050N*.xsd" -type f | head -1)
if [ -n "$sed_file" ]; then
    echo "Found SED file: $sed_file"
    dotnet run --project ../XmlSchemaClassGenerator.Console -- -o output/test-sed "$sed_file" 2>&1 | head -20
else
    echo "No X050N SED file found"
fi

# Cleanup
rm -f test-rbuc-no-validation.json rbuc-debug.log