#!/usr/bin/env pwsh

# Convert EESSI Single File Schemas to C# Classes
# Target: /Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source

param(
    [string]$OutputPath = "/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/source",
    [string]$XsdOutputPath = "/Users/svenhaude/RiderProjects/Teststelle_NAE_20250122/ITSG.EESSI.Tstelle.XML/Model/SED/V4_4_1/xsd",
    [switch]$TestMode = $false,
    [switch]$NoXsd = $false
)

Write-Host "EESSI Single File Schema Converter" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan

# Get all single file schemas
$schemasPath = Join-Path $PSScriptRoot "schemas/Single Files"
$xsdFiles = Get-ChildItem -Path $schemasPath -Filter "*.xsd" | Where-Object { $_.Name -match "^S\d{3}-" }

Write-Host "Found $($xsdFiles.Count) EESSI single file schemas" -ForegroundColor Green

# Create configuration object
$config = @{
    Name = "EESSI Single Files V4.4.1 Conversion"
    OutputDirectory = $OutputPath
    GlobalSettings = @{
        NamespacePrefix = "ITSG.EESSI.Tstelle.XML.SED"
        GenerateNullables = $true
        EnableDataBinding = $false
        GenerateInterfaces = $false
        UsePascalCase = $true
        SeparateFiles = $true
        SeparateNamespaceHierarchy = $false
        CollectionType = "System.Collections.Generic.List<>"
        CollectionSettersMode = "Private"
        GenerateDescriptionAttribute = $true
        InitializeComplexTypesInConstructor = $true
        UniqueTypeNames = $false
        UseShouldSerializePattern = $false
        EnumAsString = $false
        NamespaceMappings = @(
            @{
                XmlNamespace = "http://ec.europa.eu/eessi/ns/4_4"
                CSharpNamespace = "ITSG.EESSI.Tstelle.XML.SED.V4_4_1"
            },
            @{
                XmlNamespace = "http://www.w3.org/2000/09/xmldsig#"
                CSharpNamespace = "ITSG.EESSI.Tstelle.XML.XMLDSig"
            },
            @{
                XmlNamespace = "http://uri.etsi.org/01903/v1.3.2#"
                CSharpNamespace = "ITSG.EESSI.Tstelle.XML.XAdES"
            }
        )
        FileNameMappings = @()
    }
    Schemas = @()
}

# Add each schema to configuration
foreach ($xsdFile in $xsdFiles) {
    # Extract schema number (e.g., S001 from S001-4.4.0-20241203T114125.xsd)
    if ($xsdFile.Name -match "^(S\d{3})") {
        $schemaNumber = $Matches[1]
        
        $schema = @{
            Name = "$schemaNumber Single File Schema"
            SourcePath = "schemas/Single Files/$($xsdFile.Name)"
            OutputSubDirectory = "."
            Settings = @{
                NamespaceMappings = @(
                    @{
                        XmlNamespace = "http://ec.europa.eu/eessi/ns/4_4/$schemaNumber"
                        CSharpNamespace = "ITSG.EESSI.Tstelle.XML.SED.$schemaNumber.V4_4_1"
                    },
                    @{
                        XmlNamespace = "http://www.w3.org/2000/09/xmldsig#"
                        CSharpNamespace = "ITSG.EESSI.Tstelle.XML.XMLDSig"
                    },
                    @{
                        XmlNamespace = "http://uri.etsi.org/01903/v1.3.2#"
                        CSharpNamespace = "ITSG.EESSI.Tstelle.XML.XAdES"
                    }
                )
                FileNameMappings = @(
                    @{
                        Namespace = "ITSG.EESSI.Tstelle.XML.SED.$schemaNumber.V4_4_1"
                        FileName = "$schemaNumber-4.4"
                    },
                    @{
                        Namespace = "ITSG.EESSI.Tstelle.XML.XMLDSig"
                        FileName = "XMLDSig-4.4"
                    },
                    @{
                        Namespace = "ITSG.EESSI.Tstelle.XML.XAdES"
                        FileName = "XAdES-4.4"
                    }
                )
            }
            Enabled = $true
        }
        
        $config.Schemas += $schema
        
        if ($TestMode -and $config.Schemas.Count -ge 3) {
            Write-Host "Test mode: Limited to 3 schemas" -ForegroundColor Yellow
            break
        }
    }
}

Write-Host "Configured $($config.Schemas.Count) schemas for conversion" -ForegroundColor Green
Write-Host "All files will be generated in: $OutputPath" -ForegroundColor Green

# Save configuration
$configPath = Join-Path $PSScriptRoot "eessi-single-files-config.json"
$config | ConvertTo-Json -Depth 10 | Set-Content -Path $configPath -Encoding UTF8

Write-Host "Configuration saved to: $configPath" -ForegroundColor Green

# Create output directory if it doesn't exist
if (!(Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    Write-Host "Created output directory: $OutputPath" -ForegroundColor Green
}

# Run the batch converter
Write-Host "`nStarting batch conversion..." -ForegroundColor Cyan
Push-Location $PSScriptRoot
try {
    dotnet run -- eessi-single-files-config.json
    $exitCode = $LASTEXITCODE
    
    if ($exitCode -eq 0) {
        Write-Host "`nConversion completed successfully!" -ForegroundColor Green
        
        # List generated files
        $generatedFiles = Get-ChildItem -Path $OutputPath -Filter "*.cs" -Recurse
        Write-Host "`nGenerated $($generatedFiles.Count) C# files:" -ForegroundColor Cyan
        $generatedFiles | ForEach-Object { 
            Write-Host "  - $($_.FullName.Replace($OutputPath, ''))" -ForegroundColor Gray 
        }
    } else {
        Write-Host "`nConversion failed with exit code: $exitCode" -ForegroundColor Red
    }
} finally {
    Pop-Location
}

# Copy XSD files if enabled
if (!$NoXsd -and $exitCode -eq 0) {
    Write-Host "`nCopying XSD files to $XsdOutputPath..." -ForegroundColor Cyan
    
    # Create XSD output directory if it doesn't exist
    if (!(Test-Path $XsdOutputPath)) {
        New-Item -ItemType Directory -Path $XsdOutputPath -Force | Out-Null
        Write-Host "Created XSD output directory: $XsdOutputPath" -ForegroundColor Green
    }
    
    # Copy and rename XSD files
    $copiedCount = 0
    foreach ($xsdFile in $xsdFiles) {
        if ($xsdFile.Name -match "^(S\d{3})") {
            $schemaNumber = $Matches[1]
            $newFileName = "$schemaNumber-4.4.xsd"
            
            Copy-Item -Path $xsdFile.FullName -Destination (Join-Path $XsdOutputPath $newFileName) -Force
            $copiedCount++
            
            # Check test mode limit for XSD copy
            if ($TestMode -and $copiedCount -ge 3) {
                break
            }
        }
    }
    
    Write-Host "Copied $copiedCount XSD files" -ForegroundColor Green
}

Write-Host "`nDone!" -ForegroundColor Green