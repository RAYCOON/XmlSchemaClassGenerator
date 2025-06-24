#!/bin/bash

# Analyze why R_BUC schemas fail

echo "Analyzing R_BUC schema problems..."
echo ""

# Check what xs:redefine does in these schemas
echo "1. Checking xs:redefine usage:"
echo "------------------------------"
test_file="schemas/NAE/R_BUC_01-4.4-Counterparty-CaseOwner-New-X050N-4.4.1-20250606T150014.xsd"
echo "In $test_file:"
sed -n '/<xs:redefine/,/<\/xs:redefine>/p' "$test_file" | head -20

echo ""
echo "2. The problem:"
echo "---------------"
echo "xs:redefine is a complex XSD feature that:"
echo "- Takes an existing schema and modifies its types"
echo "- Is not well supported by many code generators"
echo "- XmlSchemaClassGenerator appears to not fully support it"

echo ""
echo "3. Checking which schemas use xs:redefine:"
echo "------------------------------------------"
grep -l "xs:redefine" schemas/NAE/R_*.xsd | wc -l | xargs echo "R_BUC schemas with xs:redefine:"
grep -l "xs:redefine" schemas/NAE/S_*.xsd | wc -l | xargs echo "S_BUC schemas with xs:redefine:"
grep -l "xs:redefine" schemas/NAE/H_*.xsd | wc -l | xargs echo "H_BUC schemas with xs:redefine:"

echo ""
echo "4. Alternative solutions:"
echo "------------------------"
echo "a) Use a different code generator that supports xs:redefine (e.g., xsd.exe, JAXB)"
echo "b) Manually flatten the schemas by applying the redefinitions"
echo "c) Use the working schemas (non-BUC) and manually code the BUC types"
echo "d) Contact the schema provider for pre-flattened versions"

echo ""
echo "5. What you have that works:"
echo "----------------------------"
echo "Successfully generated from previous run:"
find output -name "*.cs" 2>/dev/null | wc -l | xargs echo "- Total C# files:"
echo "- BasicTypes, CommonComponents, many S_Messages"
echo "- These can be used for non-BUC workflows"