# EESSI-Dateien Generierung mit XmlSchemaClassGenerator

## Übersicht

Diese Anleitung beschreibt, wie man EESSI-Dateien (z.B. A008, A009) mit dem XmlSchemaClassGenerator generiert, um xsd.exe-kompatiblen Code zu erzeugen.

## Empfohlene Optionen für EESSI

Für die Generierung von EESSI-Dateien, die mit xsd.exe kompatibel sind, verwenden Sie folgende Optionen:

```bash
dotnet run -- --single-file --gi --ua --ctor \
  -n "XML_NAMESPACE=C#_NAMESPACE" \
  -o OUTPUT.cs PATH/TO/SCHEMA.xsd
```

### Optionserklärung

- `--single-file`: Generiert alle Klassen in einer einzigen Datei
- `--gi` (oder `--generateChoiceItemProperty`): Generiert Item/ItemElementName Properties für Choice-Elemente (xsd.exe-kompatibel)
- `--ua` (oder `--use-arrays`): Verwendet Arrays statt Collections für Sequenzen
- `--ctor` (oder `--initializeComplexTypes`): Initialisiert komplexe Typen in Konstruktoren
- `-n` (oder `--namespace`): Mappt XML-Namespace zu C#-Namespace (WICHTIG für EESSI!)
- `-o OUTPUT.cs`: Ausgabedatei

## EESSI Namespace-Format

EESSI verwendet ein spezifisches Namespace-Format:
```
ITSG.EESSI.Tstelle.XML.SED.{DocumentType}.V{Version}
```

Wobei:
- `{DocumentType}` = A008, A009, DA008, etc.
- `{Version}` = Version mit Unterstrichen statt Punkten (z.B. 4.4.0 → V4_4_0)

## Beispiele

### A008 Version 4.4.0 generieren
```bash
cd XmlSchemaClassGenerator.Console
dotnet run -- --single-file --gi --ua --ctor \
  -n "http://ec.europa.eu/eessi/ns/4_4/A008=ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0" \
  -o A008.cs ../XmlSchemaClassGenerator.Tests/xsd/eessi/A008-4.4.0-20241203T114133.xsd
```

### A009 Version 4.4.1 generieren
```bash
cd XmlSchemaClassGenerator.Console
dotnet run -- --single-file --gi --ua --ctor \
  -n "http://ec.europa.eu/eessi/ns/4_4/A009=ITSG.EESSI.Tstelle.XML.SED.A009.V4_4_1" \
  -o A009.cs ../XmlSchemaClassGenerator.Tests/xsd/eessi/A009-4.4.1-20250507T153911.xsd
```

## Wichtige Unterschiede zu xsd.exe

### Mit den empfohlenen Optionen:

1. **Arrays statt Collections**: 
   - xsd.exe: `public EESSIPINClassType[] PINPersonInEachInstitution`
   - XmlSchemaClassGenerator mit `--ua`: `public EessipinClassType[] PinPersonInEachInstitution`

2. **Konstruktor-Initialisierung**:
   - Nur komplexe Typen werden initialisiert
   - Arrays werden NICHT initialisiert (wie bei xsd.exe)

3. **Choice-Elemente**:
   - Mit `--gi` werden Item/ItemElementName Properties generiert (xsd.exe-kompatibel)

## Zusätzliche Namespace-Mappings

Falls mehrere Namespaces (z.B. für importierte Schemas) gemappt werden müssen:

```bash
dotnet run -- --single-file --gi --ua --ctor \
  -n "http://ec.europa.eu/eessi/ns/4_4/A008=ITSG.EESSI.Tstelle.XML.SED.A008.V4_4_0" \
  -n "http://www.w3.org/2000/09/xmldsig#=ITSG.EESSI.Tstelle.XML.XMLDSig" \
  -n "http://uri.etsi.org/01903/v1.3.2#=ITSG.EESSI.Tstelle.XML.XAdES" \
  -o A008.cs schema.xsd
```

## Fehlerbehebung

### "Namespace not provided" Fehler
Der Generator erstellt automatisch Namespaces aus der XML-Namespace-URL. Dies sollte nicht mehr auftreten.

### Form-Attribut Fehler in ASP.NET
Dies wurde behoben. XmlIgnoreAttribute erhält keine Form-Parameter mehr.

### Doppelte Typdefinitionen
Bei Single-File-Generierung können bei mehreren Schemas mit gemeinsamen Imports Duplikate entstehen. Generieren Sie diese separat oder verwenden Sie die Standard-Ausgabe (mehrere Dateien).

## Batch-Konvertierung

### Methode 1: Mit Pattern-basierter Namespace-Generierung (NEU)

Die neue Pattern-basierte Namespace-Generierung ermöglicht automatische Extraktion von Dokumenttyp und Version:

```bash
# Einzelne Datei mit Filename-Pattern
dotnet run -- --single-file --gi --ua --ctor \
    --file-pattern "(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}" \
    --pattern-transform "ver=dots_to_underscores" \
    -o A008.cs A008-4.4.0-20241203T114133.xsd

# Ganzes Verzeichnis mit automatischer Pattern-Erkennung
dotnet run -- --directory ../XmlSchemaClassGenerator.Tests/xsd/eessi \
    --single-file --gi --ua --ctor \
    --file-pattern "(?<doc>[A-Z]+[0-9]+)-(?<ver>\d+\.\d+\.\d+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}" \
    --pattern-transform "ver=dots_to_underscores"

# Mit XML-Namespace-Pattern (falls der Namespace die Information enthält)
dotnet run -- --single-file --gi --ua --ctor \
    --xml-pattern "http://ec\.europa\.eu/eessi/ns/(?<ver>[^/]+)/(?<doc>[A-Z]+[0-9]+)=ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}" \
    --pattern-transform "ver=dots_to_underscores" \
    -o output.cs schema.xsd
```

### Methode 2: Mit traditionellem Shell-Script

Für mehrere EESSI-Dateien mit automatischer Namespace-Generierung:

```bash
#!/bin/bash
for xsd in ../XmlSchemaClassGenerator.Tests/xsd/eessi/*.xsd; do
    filename=$(basename "$xsd" .xsd)
    # Extrahiere Dokumenttyp und Version aus Dateiname (z.B. A008-4.4.0-20241203T114133.xsd)
    doctype=$(echo "$filename" | grep -oE '^[A-Z]+[0-9]+')
    version=$(echo "$filename" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | tr '.' '_')
    
    # Generiere mit korrektem Namespace
    dotnet run -- --single-file --gi --ua --ctor \
        -n "http://ec.europa.eu/eessi/ns/4_4/$doctype=ITSG.EESSI.Tstelle.XML.SED.$doctype.V$version" \
        -o "$doctype.cs" "$xsd"
done
```

### Pattern-basierte Optionen erklärt

- `--file-pattern` / `-fp`: Regex-Pattern für Dateinamen mit Template
  - `(?<doc>[A-Z]+[0-9]+)`: Erfasst Dokumenttyp (z.B. A008)
  - `(?<ver>\d+\.\d+\.\d+)`: Erfasst Version (z.B. 4.4.0)
  - Template: `ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}`

- `--xml-pattern` / `-xp`: Regex-Pattern für XML-Namespaces
  - Funktioniert analog zu file-pattern, aber auf XML-Namespace angewendet

- `--pattern-transform` / `-pt`: Transformationen für erfasste Gruppen
  - `ver=dots_to_underscores`: Wandelt 4.4.0 in 4_4_0 um
  - Weitere: `uppercase`, `lowercase`, `titlecase`, `remove_hyphens`

- `--default-namespace-strategy` / `-dns`: Fallback-Strategie
  - `AutoGenerate`: Automatische Generierung (Standard)
  - `UseFilename`: Nutzt Dateinamen als Basis
  - `UseXmlNamespace`: Nutzt letztes Segment des XML-Namespace
  - `ThrowException`: Fehler wenn kein Pattern passt
  - `UseTemplate`: Nutzt `--default-namespace-template`

### Konfigurationsdatei-Beispiel

Für wiederholte Verwendung können Sie eine JSON-Konfigurationsdatei erstellen:

```json
{
  "OutputDirectory": "generated",
  "GenerateNullables": true,
  "GenerateChoiceItemProperty": true,
  "UsePascalCase": true,
  "SeparateFiles": false,
  "FilenamePatterns": [
    {
      "Pattern": "(?<doc>[A-Z]+[0-9]+)-(?<ver>\\d+\\.\\d+\\.\\d+)",
      "Template": "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
      "Transforms": {
        "ver": "dots_to_underscores"
      },
      "Priority": 1
    }
  ],
  "XmlNamespacePatterns": [
    {
      "Pattern": "http://ec\\.europa\\.eu/eessi/ns/(?<ver>[^/]+)/(?<doc>[A-Z]+[0-9]+)",
      "Template": "ITSG.EESSI.Tstelle.XML.SED.{doc}.V{ver}",
      "Transforms": {
        "ver": "dots_to_underscores"
      }
    }
  ],
  "DefaultNamespaceStrategy": "UseFilename",
  "SourceDirectories": ["../XmlSchemaClassGenerator.Tests/xsd/eessi"]
}
```

Verwendung:
```bash
dotnet run -- --config eessi-config.json --ua --ctor
```

## Vergleich mit Standard-Optionen

Ohne spezielle Optionen:
- Collections statt Arrays
- Private Setter für Collections
- Automatische Collection-Initialisierung im Konstruktor
- Specified-Pattern für optionale Collections

Mit empfohlenen Optionen (xsd.exe-kompatibel):
- Arrays mit public Settern
- Keine Array-Initialisierung
- Nur komplexe Typen werden initialisiert
- Kein Specified-Pattern für Arrays