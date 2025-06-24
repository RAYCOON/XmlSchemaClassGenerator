#!/bin/bash

# Fix NAE structure issues

echo "Fixing NAE structure issues..."
echo ""

# 1. Create missing X050N-4.4.xsd as a copy of X050N-6.0.xsd
if [ ! -f "schemas/NAE-structured/sed/X050N-4.4.xsd" ]; then
    echo "Creating missing X050N-4.4.xsd..."
    cp schemas/NAE-structured/sed/X050N-6.0.xsd schemas/NAE-structured/sed/X050N-4.4.xsd
    echo "✓ Created X050N-4.4.xsd"
fi

# 2. Find all X050 variations needed
echo ""
echo "Checking for other missing X050 variants..."
grep -h "schemaLocation.*X050" schemas/NAE-structured/transactions/*.xsd | \
    grep -o 'X050[^"]*\.xsd' | sort -u | while read -r needed_file; do
    
    if [ ! -f "schemas/NAE-structured/sed/$needed_file" ]; then
        echo "Creating missing $needed_file..."
        # Use X050N-6.0.xsd as template
        cp schemas/NAE-structured/sed/X050N-6.0.xsd "schemas/NAE-structured/sed/$needed_file"
        echo "✓ Created $needed_file"
    fi
done

# 3. Test R_BUC again with namespace mappings
echo ""
echo "Testing R_BUC with namespace mappings..."

cat > test-rbuc-with-namespaces.json << EOF
{
  "name": "Test R_BUC with Namespaces",
  "outputDirectory": "./output/test-rbuc-fixed",
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
    "namespaceMappings": [
      {
        "xmlNamespace": "http://www.w3.org/2000/09/xmldsig#",
        "cSharpNamespace": "NAE.XmlDSig"
      },
      {
        "xmlNamespace": "http://eessi.dgempl.ec.europa.eu/namespaces/sbdh",
        "cSharpNamespace": "NAE.SBDH"
      },
      {
        "xmlNamespace": "https://www.gkv-spitzenverband.de/4_4/X050N",
        "cSharpNamespace": "NAE.GKV.X050N"
      },
      {
        "xmlNamespace": "https://www.gkv-spitzenverband.de/4_4/X050",
        "cSharpNamespace": "NAE.GKV.X050"
      }
    ]
  },
  "schemas": [
    {
      "name": "R_BUC_01_Fixed",
      "sourcePath": "schemas/NAE-structured/transactions/R_BUC_01-4.4-Counterparty-CaseOwner-New-X050N-4.4.1-20250606T150014.xsd",
      "enabled": true
    }
  ]
}
EOF

echo "Running conversion..."
if dotnet run --no-build -- test-rbuc-with-namespaces.json; then
    echo ""
    echo "✓ Conversion successful!"
    echo "Generated files:"
    find output/test-rbuc-fixed -name "*.cs" | wc -l
else
    echo ""
    echo "✗ Still failing. Checking for more missing dependencies..."
fi

# Cleanup
rm -f test-rbuc-with-namespaces.json