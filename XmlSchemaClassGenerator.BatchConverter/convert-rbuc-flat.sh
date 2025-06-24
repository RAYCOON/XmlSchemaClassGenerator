#!/bin/bash

# Convert R_BUC schemas from flat structure with all dependencies

echo "Converting R_BUC schemas with all dependencies..."
echo ""

# Create output directory
mkdir -p output/R_BUC_ALL

# First, convert all base schemas that R_BUC depends on
echo "Phase 1: Converting base dependencies..."
base_schemas=(
    "BasicTypes-1.2.xsd"
    "BusinessScope-1.2.xsd"
    "DocumentIdentification-1.2.xsd"
    "StandardBusinessDocumentHeader-1.2.xsd"
    "CC-4.4.xsd"
)

for schema in "${base_schemas[@]}"; do
    if [ -f "schemas/NAE/$schema" ]; then
        echo -n "Converting $schema... "
        if dotnet run --project ../XmlSchemaClassGenerator.Console -- \
            -n "http://eessi.dgempl.ec.europa.eu/namespaces/sbdh=NAE.SBDH" \
            -n "http://ec.europa.eu/eessi/ns/4_4/CC=NAE.CC" \
            -n "http://www.w3.org/2000/09/xmldsig#=NAE.XmlDSig" \
            -o output/R_BUC_ALL \
            "schemas/NAE/$schema" > /dev/null 2>&1; then
            echo "✓"
        else
            echo "✗"
        fi
    fi
done

# Convert X050 schemas
echo ""
echo "Phase 2: Converting X050 schemas..."
for x050 in schemas/NAE/X050*.xsd; do
    if [ -f "$x050" ]; then
        filename=$(basename "$x050")
        echo -n "Converting $filename... "
        if dotnet run --project ../XmlSchemaClassGenerator.Console -- \
            -n "https://www.gkv-spitzenverband.de/4_4/X050N=NAE.GKV.X050N" \
            -n "https://www.gkv-spitzenverband.de/4_4/X050=NAE.GKV.X050" \
            -n "https://www.gkv-spitzenverband.de/6_0/X050N=NAE.GKV.X050N" \
            -n "https://www.gkv-spitzenverband.de/6_0/X050=NAE.GKV.X050" \
            -n "http://www.w3.org/2000/09/xmldsig#=NAE.XmlDSig" \
            -o output/R_BUC_ALL \
            "$x050" > /dev/null 2>&1; then
            echo "✓"
        else
            echo "✗"
        fi
    fi
done

# Now try R_BUC schemas
echo ""
echo "Phase 3: Converting R_BUC schemas..."
count=0
success=0
for rbuc in schemas/NAE/R_BUC_*.xsd; do
    if [ -f "$rbuc" ]; then
        ((count++))
        filename=$(basename "$rbuc")
        echo -n "[$count] Converting $filename... "
        
        if dotnet run --project ../XmlSchemaClassGenerator.Console -- \
            -n "http://eessi.dgempl.ec.europa.eu/namespaces/sbdh=NAE.SBDH" \
            -n "https://www.gkv-spitzenverband.de/4_4/X050N=NAE.GKV.X050N" \
            -n "https://www.gkv-spitzenverband.de/4_4/X050=NAE.GKV.X050" \
            -n "http://ec.europa.eu/eessi/ns/4_4/CC=NAE.CC" \
            -n "http://www.w3.org/2000/09/xmldsig#=NAE.XmlDSig" \
            -o output/R_BUC_ALL \
            "$rbuc" > /dev/null 2>&1; then
            echo "✓"
            ((success++))
        else
            echo "✗"
        fi
    fi
done

echo ""
echo "========================================="
echo "R_BUC Conversion Summary"
echo "========================================="
echo "Total R_BUC schemas: $count"
echo "Successfully converted: $success"
echo "Failed: $((count - success))"
echo ""
echo "Total generated files:"
find output/R_BUC_ALL -name "*.cs" | wc -l