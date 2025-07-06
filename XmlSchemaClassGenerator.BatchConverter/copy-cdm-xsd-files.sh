#!/bin/bash

# Script to copy XSD files from Complete CDM Package to V4_4_1/xsd
# Based on reference directory V4_4_0/xsd

SOURCE_BASE="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/Schemata/EESSI.CDM.4.4.1 - Complete CDM v4.4 Package"
TARGET_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd"
REFERENCE_DIR="/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_0/xsd"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}XSD File Copy Script${NC}"
echo -e "${GREEN}===================${NC}"
echo "Source: $SOURCE_BASE"
echo "Target: $TARGET_DIR"
echo "Reference: $REFERENCE_DIR"
echo ""

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo -e "${GREEN}Created target directory: $TARGET_DIR${NC}"
fi

# Function to find and copy XSD file
find_and_copy_xsd() {
    local xsd_name="$1"
    local base_name="${xsd_name%.xsd}"
    
    # Search for the file in the source directory
    # Look for patterns like S055-4.4.0.xsd or S055.xsd
    local found_files=$(find "$SOURCE_BASE" -type f \( -name "${base_name}.0.xsd" -o -name "${base_name}.1.xsd" -o -name "$xsd_name" \) 2>/dev/null)
    
    if [ -n "$found_files" ]; then
        # Take the first match
        local source_file=$(echo "$found_files" | head -n 1)
        cp "$source_file" "$TARGET_DIR/$xsd_name"
        echo -e "${GREEN}✓${NC} Copied: $xsd_name"
        return 0
    else
        echo -e "${RED}✗${NC} Not found: $xsd_name"
        return 1
    fi
}

# Count files
total_files=$(ls -1 "$REFERENCE_DIR"/*.xsd 2>/dev/null | wc -l)
copied_count=0
not_found_count=0

echo -e "\n${YELLOW}Starting copy process for $total_files files...${NC}\n"

# Copy each XSD file from reference directory
for ref_file in "$REFERENCE_DIR"/*.xsd; do
    if [ -f "$ref_file" ]; then
        xsd_filename=$(basename "$ref_file")
        
        if find_and_copy_xsd "$xsd_filename"; then
            ((copied_count++))
        else
            ((not_found_count++))
        fi
    fi
done

# Summary
echo -e "\n${GREEN}Copy process completed!${NC}"
echo -e "Total files in reference: $total_files"
echo -e "${GREEN}Successfully copied: $copied_count${NC}"
if [ $not_found_count -gt 0 ]; then
    echo -e "${RED}Not found: $not_found_count${NC}"
fi

# List files that were not found
if [ $not_found_count -gt 0 ]; then
    echo -e "\n${YELLOW}Files not found in source:${NC}"
    for ref_file in "$REFERENCE_DIR"/*.xsd; do
        if [ -f "$ref_file" ]; then
            xsd_filename=$(basename "$ref_file")
            if [ ! -f "$TARGET_DIR/$xsd_filename" ]; then
                echo "  - $xsd_filename"
            fi
        fi
    done
fi