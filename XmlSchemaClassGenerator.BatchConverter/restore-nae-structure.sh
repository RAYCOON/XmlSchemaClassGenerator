#!/bin/bash

# Restore proper NAE directory structure for XSD dependencies

echo "Restoring NAE directory structure..."

# Clean up
rm -rf schemas/NAE-structured
mkdir -p schemas/NAE-structured

# Copy the entire NAE structure preserving paths
echo "Copying NAE structure from original location..."
cp -r "/Users/svenhaude/CashCows/XmlSchemaClassGenerator/NAE_4.4.1_6.0.1_rc1/Nationales Datenmodell/Nationale_SED_XSD/"* schemas/NAE-structured/

echo "Directory structure:"
find schemas/NAE-structured -type d | head -20

echo ""
echo "XSD files found:"
find schemas/NAE-structured -name "*.xsd" | wc -l

echo ""
echo "Now schemas can be converted with proper dependencies!"