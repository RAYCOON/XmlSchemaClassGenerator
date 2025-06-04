# XsdToCSharpFactory - Dokumentation

## Überblick

Die `XsdToCSharpFactory` ist eine Komponente des XmlSchemaClassGenerator-Projekts, die es ermöglicht, zur Laufzeit C#-Klassen aus XSD-Schemas zu generieren und diese dynamisch zu verwenden. Sie bietet eine programmatische API für die Erstellung von stark typisierten Objekten basierend auf XML-Schema-Definitionen.

## Architektur

```
XSD Schema File
      ↓
XsdToCSharpFactory
      ↓
Generated C# Code
      ↓
Roslyn Compilation
      ↓
Runtime Types (Dictionary<string, Type>)
      ↓
Dynamic Object Creation & Manipulation
```

## Kernkomponenten

### 1. XsdToCSharpFactory

Die Hauptklasse, die den gesamten Workflow orchestriert:

```csharp
public class XsdToCSharpFactory
{
    // Konstruktor mit optionaler Konfiguration
    public XsdToCSharpFactory(GeneratorConfiguration configuration = null)
    
    // Hauptmethode: Generiert Types aus XSD
    public Dictionary<string, Type> GenerateTypesFromXsd(string xsdFilePath)
    
    // Serialisierung von Objekten zu XML
    public string SerializeToXml<T>(T obj)
    
    // Deserialisierung von XML zu Objekten
    public T DeserializeXml<T>(string xmlContent)
    public object DeserializeXml(string xmlContent, Type targetType)
}
```

### 2. Workflow-Schritte

#### Schritt 1: XSD-Verarbeitung
```csharp
var factory = new XsdToCSharpFactory();
var types = factory.GenerateTypesFromXsd("path/to/schema.xsd");
```

Die Factory:
1. Liest die XSD-Datei ein
2. Nutzt den bestehenden `Generator` zur C#-Code-Generierung
3. Verwendet `MemoryOutputWriter` zur Code-Erfassung
4. Kompiliert den generierten Code mit Roslyn
5. Gibt ein Dictionary mit Typ-Namen und `Type`-Objekten zurück

#### Schritt 2: Dynamische Objekterstellung
```csharp
var customerType = types["CustomerType"];
var customer = Activator.CreateInstance(customerType);
```

#### Schritt 3: Property-Manipulation
```csharp
// Property setzen
var nameProperty = customerType.GetProperty("Name");
nameProperty.SetValue(customer, "Max Mustermann");

// Property lesen
var nameValue = nameProperty.GetValue(customer);
```

## Technische Details

### Code-Generierung

Die Factory nutzt die bestehende `Generator`-Infrastruktur:

```csharp
var config = new GeneratorConfiguration
{
    GenerateNullables = true,
    NamespacePrefix = "Generated",
    DataAnnotationMode = DataAnnotationMode.All
};

var memoryWriter = new MemoryOutputWriter();
config.OutputWriter = memoryWriter;

var generator = new Generator
{
    GenerateNullables = config.GenerateNullables,
    NamespacePrefix = config.NamespacePrefix,
    DataAnnotationMode = config.DataAnnotationMode
};

generator.Generate(new[] { xsdFilePath });
```

### Roslyn-Kompilierung

Der generierte C#-Code wird mit Microsoft.CodeAnalysis kompiliert:

```csharp
var syntaxTree = CSharpSyntaxTree.ParseText(sourceCode);

var references = new List<MetadataReference>
{
    MetadataReference.CreateFromFile(typeof(object).Assembly.Location),
    MetadataReference.CreateFromFile(typeof(XmlDocument).Assembly.Location),
    MetadataReference.CreateFromFile(typeof(XmlSerializer).Assembly.Location),
    // ... weitere Referenzen
};

var compilation = CSharpCompilation.Create(
    "DynamicXsdAssembly",
    new[] { syntaxTree },
    references,
    new CSharpCompilationOptions(OutputKind.DynamicallyLinkedLibrary));

var result = compilation.Emit(memoryStream);
var assembly = Assembly.Load(memoryStream.ToArray());
```

### MemoryOutputWriter

Eine spezielle Implementierung des `OutputWriter` zur Code-Erfassung:

```csharp
private class MemoryOutputWriter : OutputWriter
{
    public Dictionary<string, string> GeneratedCode { get; } = new Dictionary<string, string>();

    public override void Write(CodeNamespace codeNamespace)
    {
        using var writer = new StringWriter();
        using var provider = CodeDomProvider.CreateProvider("CSharp");
        
        provider.GenerateCodeFromNamespace(codeNamespace, writer, options);
        
        var namespaceName = string.IsNullOrEmpty(codeNamespace.Name) ? "Generated" : codeNamespace.Name;
        GeneratedCode[namespaceName] = writer.ToString();
    }
}
```

## Verwendungsbeispiele

### Einfache Objekterstellung

```csharp
// XSD Schema definieren
const string xsd = @"<?xml version=""1.0"" encoding=""UTF-8""?>
<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
    <xs:element name=""Person"" type=""PersonType""/>
    <xs:complexType name=""PersonType"">
        <xs:sequence>
            <xs:element name=""Name"" type=""xs:string""/>
            <xs:element name=""Age"" type=""xs:int""/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>";

// Factory erstellen und Types generieren
var factory = new XsdToCSharpFactory();
var types = factory.GenerateTypesFromXsd(xsdFilePath);

// Objekt erstellen und verwenden
var personType = types["PersonType"];
var person = Activator.CreateInstance(personType);

// Properties setzen
var nameProperty = personType.GetProperty("Name");
var ageProperty = personType.GetProperty("Age");

nameProperty.SetValue(person, "John Doe");
ageProperty.SetValue(person, 30);

// Properties lesen
var name = nameProperty.GetValue(person); // "John Doe"
var age = ageProperty.GetValue(person);   // 30
```

### Komplexe verschachtelte Objekte

```csharp
// Geschäftsobjekt erstellen
var customerType = types["CustomerType"];
var addressType = types["AddressType"];

var customer = Activator.CreateInstance(customerType);
var address = Activator.CreateInstance(addressType);

// Adresse konfigurieren
SetProperty(address, "Street", "Musterstraße 123");
SetProperty(address, "City", "Berlin");
SetProperty(address, "PostalCode", "10115");

// Kunde konfigurieren
SetProperty(customer, "Name", "Max Mustermann");
SetProperty(customer, "Email", "max@example.com");
SetProperty(customer, "Address", address);

// Verschachtelte Navigation
var customerAddress = GetProperty(customer, "Address");
var street = GetProperty(customerAddress, "Street"); // "Musterstraße 123"
```

### XML-Serialisierung

```csharp
// Objekt zu XML serialisieren
var xml = factory.SerializeToXml(customer);

// XML zurück zu Objekt deserialisieren
var deserializedCustomer = factory.DeserializeXml(xml, customerType);

// Werte vergleichen
var originalName = GetProperty(customer, "Name");
var deserializedName = GetProperty(deserializedCustomer, "Name");
Assert.Equal(originalName, deserializedName);
```

## Konfigurationsmöglichkeiten

### GeneratorConfiguration

```csharp
var config = new GeneratorConfiguration
{
    // Nullable-Types generieren
    GenerateNullables = true,
    
    // Data Annotations hinzufügen
    DataAnnotationMode = DataAnnotationMode.All,
    
    // Namespace-Präfix
    NamespacePrefix = "MyProject.Generated",
    
    // Choice-Properties generieren
    GenerateChoiceItemProperty = true,
    
    // Serializable-Attribute
    GenerateSerializableAttribute = true,
    
    // Element-Reihenfolge ausgeben
    EmitOrder = true
};

var factory = new XsdToCSharpFactory(config);
```

### Naming-Provider

```csharp
var config = new GeneratorConfiguration
{
    NamespaceProvider = new NamespaceProvider
    {
        GenerateNamespace = key => key.XmlSchemaNamespace switch
        {
            "http://example.com/orders" => "MyProject.Orders",
            "http://example.com/customers" => "MyProject.Customers",
            _ => "MyProject.Generated"
        }
    }
};
```

## Unterstützte XSD-Features

### Komplexe Typen
- ✅ Verschachtelte Objekte
- ✅ Attribute und Elemente
- ✅ Collections (unbounded elements)
- ✅ Optionale Elemente (minOccurs="0")

### Einfache Typen
- ✅ String, Int, Boolean, Decimal, DateTime
- ✅ Enumerationen
- ✅ Restrictions mit Validierung

### Erweiterte Features
- ✅ Choice-Elemente
- ✅ Inheritance (komplexe Vererbung)
- ✅ Abstract Types
- ✅ Multiple Namespaces
- ✅ Mixed Content

### XML Schema Patterns
- ✅ Attributes mit Default-Werten
- ✅ Required vs. Optional Elemente
- ✅ Union Types
- ✅ Recursive Types

## Helper-Methoden

### Property-Manipulation

```csharp
// Property setzen (mit Fehlerbehandlung)
public static void SetProperty(object obj, string propertyName, object value)
{
    var property = obj.GetType().GetProperty(propertyName);
    if (property != null && property.CanWrite)
    {
        property.SetValue(obj, value);
    }
}

// Property lesen (mit Fehlerbehandlung)
public static object GetProperty(object obj, string propertyName)
{
    var property = obj.GetType().GetProperty(propertyName);
    return property?.GetValue(obj);
}

// Property-Typ prüfen
public static Type GetPropertyType(Type objectType, string propertyName)
{
    var property = objectType.GetProperty(propertyName);
    return property?.PropertyType;
}
```

### Typ-Introspection

```csharp
// Alle Properties eines Types auflisten
public static PropertyInfo[] GetAllProperties(Type type)
{
    return type.GetProperties(BindingFlags.Public | BindingFlags.Instance);
}

// Nur schreibbare Properties
public static PropertyInfo[] GetWritableProperties(Type type)
{
    return type.GetProperties(BindingFlags.Public | BindingFlags.Instance)
               .Where(p => p.CanWrite)
               .ToArray();
}

// Property-Attribute prüfen
public static bool IsRequired(PropertyInfo property)
{
    return property.GetCustomAttribute<RequiredAttribute>() != null;
}
```

## Performance-Überlegungen

### Kompilierung
- ⚠️ **Erste Generierung**: Kann 100-500ms dauern (einmalig)
- ✅ **Nachfolgende Nutzung**: Sehr schnell (typisierte Objekte)
- ✅ **Memory-Footprint**: Moderat (Assembly im Speicher)

### Optimierungen
```csharp
// Factory wiederverwenden für mehrere Schemas
var factory = new XsdToCSharpFactory(config);
var types1 = factory.GenerateTypesFromXsd("schema1.xsd");
var types2 = factory.GenerateTypesFromXsd("schema2.xsd");

// Types cachen für wiederholte Nutzung
private static readonly Dictionary<string, Dictionary<string, Type>> _typeCache 
    = new Dictionary<string, Dictionary<string, Type>>();

public Dictionary<string, Type> GetOrCreateTypes(string xsdPath)
{
    if (!_typeCache.ContainsKey(xsdPath))
    {
        _typeCache[xsdPath] = factory.GenerateTypesFromXsd(xsdPath);
    }
    return _typeCache[xsdPath];
}
```

## Limitierungen

### Plattform-Abhängigkeiten
- ⚠️ **CodeDomProvider**: Nicht auf allen Plattformen verfügbar
- ✅ **Roslyn**: Bessere Cross-Platform-Unterstützung
- ⚠️ **Memory-Kompilierung**: Kann bei großen Schemas Memory-intensiv sein

### XSD-Einschränkungen
- ❌ **Komplexe Constraints**: Werden nicht zur Laufzeit validiert
- ❌ **Custom Facets**: Begrenzte Unterstützung
- ❌ **XSD 1.1 Features**: Nur XSD 1.0 unterstützt

### Runtime-Einschränkungen
- ⚠️ **Dynamic Loading**: Erfordert Full Trust oder entsprechende Permissions
- ⚠️ **Assembly Unloading**: Schwierig in .NET Framework
- ⚠️ **IntelliSense**: Keine Compile-Time-Unterstützung für generierte Types

## Troubleshooting

### Häufige Probleme

#### "No code was generated from XSD file"
```csharp
// Lösung: XSD-Datei und Generator-Konfiguration prüfen
var generator = new Generator();
generator.Generate(new[] { xsdFilePath }); // Debugging ohne Factory
```

#### "Failed to compile generated code"
```csharp
// Lösung: Kompilierungsfehler anzeigen
var result = compilation.Emit(ms);
if (!result.Success)
{
    foreach (var diagnostic in result.Diagnostics)
    {
        Console.WriteLine($"{diagnostic.Id}: {diagnostic.GetMessage()}");
    }
}
```

#### "PlatformNotSupportedException"
```csharp
// Lösung: Roslyn statt CodeDomProvider verwenden
// (bereits in aktueller Implementierung integriert)
```

### Debug-Tipps

```csharp
// Generierten Code ausgeben für Debugging
var factory = new XsdToCSharpFactory();
var memoryWriter = new MemoryOutputWriter();
// ... Code-Generierung ...
foreach (var kvp in memoryWriter.GeneratedCode)
{
    Console.WriteLine($"Namespace: {kvp.Key}");
    Console.WriteLine($"Code:\n{kvp.Value}");
}
```

## Vergleich zu Alternativen

| Feature | XsdToCSharpFactory | xsd.exe | svcutil.exe | Manual Parsing |
|---------|-------------------|---------|-------------|----------------|
| Runtime Generation | ✅ | ❌ | ❌ | ❌ |
| Strong Typing | ✅ | ✅ | ✅ | ❌ |
| IntelliSense | ❌ | ✅ | ✅ | ❌ |
| Deployment | Simple | Build-Time | Build-Time | Simple |
| Flexibility | High | Low | Medium | Very High |
| Performance | Good | Excellent | Excellent | Variable |

## Fazit

Die `XsdToCSharpFactory` bietet eine mächtige Lösung für die dynamische Generierung von C#-Klassen aus XSD-Schemas zur Laufzeit. Sie kombiniert die Typsicherheit von generierten Klassen mit der Flexibilität der Runtime-Generierung und ist besonders nützlich für Szenarien, in denen:

- XSD-Schemas zur Laufzeit bekannt werden
- Dynamische XML-Verarbeitung erforderlich ist
- Starke Typisierung gewünscht wird
- XML-Serialisierung/Deserialisierung benötigt wird

Die Factory abstrahiert die Komplexität der Code-Generierung und -Kompilierung und bietet eine saubere, einfach zu verwendende API für die Arbeit mit dynamisch generierten Typen.