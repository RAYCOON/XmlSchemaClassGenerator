#!/bin/bash

# Create NAE batch configuration
echo "Creating NAE batch configuration..."

cat > nae-batch-config.json << 'EOF'
{
  "name": "NAE 4.4.1/6.0.1 RC1 Schema Conversion",
  "outputDirectory": "./output/NAE",
  "globalSettings": {
    "namespacePrefix": "NAE",
    "generateNullables": true,
    "enableDataBinding": false,
    "generateInterfaces": true,
    "usePascalCase": true,
    "separateFiles": true,
    "separateNamespaceHierarchy": true,
    "collectionType": "System.Collections.Generic.List<>",
    "collectionSettersMode": "Public",
    "generateDescriptionAttribute": true,
    "uniqueTypeNames": true,
    "useShouldSerializePattern": false,
    "enumAsString": false,
    "namespaceMappings": [
      {
        "xmlNamespace": "",
        "cSharpNamespace": "NAE.Common"
      }
    ]
  },
  "schemas": [
EOF

# Add all XSD files from schemas/NAE
first=true
for xsd in schemas/NAE/*.xsd; do
    if [ -f "$xsd" ]; then
        filename=$(basename "$xsd")
        name="${filename%.xsd}"
        
        # Determine output subdirectory based on prefix
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
        
        # Add comma if not first entry
        if [ "$first" = true ]; then
            first=false
        else
            echo "," >> nae-batch-config.json
        fi
        
        # Add schema entry
        cat >> nae-batch-config.json << EOF
    {
      "name": "$name",
      "sourcePath": "$xsd",
      "outputSubDirectory": "$subdir",
      "enabled": true
    }
EOF
    fi
done

# Close JSON
cat >> nae-batch-config.json << 'EOF'

  ]
}
EOF

echo "Created nae-batch-config.json with $(ls schemas/NAE/*.xsd | wc -l) schemas"
echo "Run: dotnet run -- nae-batch-config.json"