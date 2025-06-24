#!/bin/bash

# Debug script to find out why BUC schemas fail

echo "Debugging BUC schema conversion errors..."
echo "========================================"

# Test one specific failing schema
test_schema="schemas/NAE/R_BUC_01-4.4-Counterparty-CaseOwner-New-X050N-4.4.1-20250606T150014.xsd"

if [ ! -f "$test_schema" ]; then
    echo "Test schema not found: $test_schema"
    exit 1
fi

echo "Testing: $test_schema"
echo ""

# Create debug config with verbose output
cat > debug-config.json << EOF
{
  "name": "Debug BUC Schema",
  "outputDirectory": "./output/debug",
  "globalSettings": {
    "namespacePrefix": "Debug",
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
    "doNotForceIsNullable": true,
    "namespaceMappings": []
  },
  "schemas": [
    {
      "name": "R_BUC_01_Debug",
      "sourcePath": "$test_schema",
      "enabled": true
    }
  ]
}
EOF

# Run with full output to see the error
echo "Running conversion with full output..."
dotnet run -- debug-config.json 2>&1 | tee debug-output.log

echo ""
echo "Checking XSD file structure..."
# Look at the first 50 lines of the XSD to see imports/includes
head -50 "$test_schema"

# Check for imports or includes
echo ""
echo "Checking for imports/includes in the XSD:"
grep -E "(import|include)" "$test_schema"

# Clean up
rm -f debug-config.json