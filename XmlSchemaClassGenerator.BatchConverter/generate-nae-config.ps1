# NAE Schema Configuration Generator for PowerShell

$schemasDir = "schemas/NAE"
$outputConfig = "nae-batch-config.json"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "NAE Configuration Generator" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Get all XSD files
$xsdFiles = Get-ChildItem -Path $schemasDir -Filter "*.xsd" | Select-Object -ExpandProperty Name | Sort-Object

Write-Host "Found $($xsdFiles.Count) XSD files in $schemasDir" -ForegroundColor Green

# Create configuration object
$config = @{
    name = "NAE 4.4.1/6.0.1 RC1 Complete Schema Conversion"
    outputDirectory = "./output/NAE"
    globalSettings = @{
        namespacePrefix = "NAE"
        generateNullables = $true
        enableDataBinding = $false
        generateInterfaces = $true
        usePascalCase = $true
        separateFiles = $true
        separateNamespaceHierarchy = $true
        collectionType = "System.Collections.Generic.List<>"
        collectionSettersMode = "Public"
        generateDescriptionAttribute = $true
        uniqueTypeNames = $true
        useShouldSerializePattern = $false
        enumAsString = $false
        namespaceMappings = @(
            @{
                xmlNamespace = ""
                cSharpNamespace = "NAE.Common"
            }
        )
    }
    schemas = @()
}

# Group schemas by prefix
$groups = @{}
foreach ($xsdFile in $xsdFiles) {
    $group = "Other"
    
    if ($xsdFile.StartsWith("GKV_BUC_")) { $group = "GKV_BUC" }
    elseif ($xsdFile.StartsWith("H")) { $group = "H_Messages" }
    elseif ($xsdFile.StartsWith("X")) { $group = "X_Messages" }
    elseif ($xsdFile.StartsWith("A")) { $group = "A_Messages" }
    elseif ($xsdFile.StartsWith("R")) { $group = "R_Messages" }
    elseif ($xsdFile.StartsWith("S")) { $group = "S_Messages" }
    elseif ($xsdFile -like "*Types*") { $group = "Types" }
    elseif ($xsdFile -like "*CC-*") { $group = "CommonComponents" }
    
    if (-not $groups.ContainsKey($group)) {
        $groups[$group] = @()
    }
    $groups[$group] += $xsdFile
}

# Create schema configurations
foreach ($group in $groups.Keys | Sort-Object) {
    foreach ($xsdFile in $groups[$group] | Sort-Object) {
        $schemaName = [System.IO.Path]::GetFileNameWithoutExtension($xsdFile)
        
        $schemaConfig = @{
            name = $schemaName
            sourcePath = "$schemasDir/$xsdFile"
            outputSubDirectory = $group
            enabled = $true
        }
        
        # Add special settings for complex schemas
        if ($xsdFile -like "*BUC*" -or $xsdFile -like "*Message*" -or $xsdFile -like "*Types*") {
            $schemaConfig.settings = @{
                separateSubstitutes = $true
                useShouldSerializePattern = $true
            }
        }
        
        $config.schemas += $schemaConfig
    }
}

# Save configuration
$json = $config | ConvertTo-Json -Depth 10
Set-Content -Path $outputConfig -Value $json

Write-Host ""
Write-Host "Configuration saved to: $outputConfig" -ForegroundColor Green
Write-Host "Total schemas configured: $($config.schemas.Count)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Groups:" -ForegroundColor Cyan
foreach ($group in $groups.Keys | Sort-Object) {
    Write-Host "  - $group ($($groups[$group].Count) files)" -ForegroundColor White
}

Write-Host ""
Write-Host "To convert all schemas, run:" -ForegroundColor Cyan
Write-Host "  dotnet run -- nae-batch-config.json" -ForegroundColor Yellow