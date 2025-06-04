# XsdTypeNavigator - Array-Index Navigation Erweiterung

## ✨ **Neue Funktionalität**

Der `XsdTypeNavigator` wurde erweitert um **Array-Index-Unterstützung** für Property-Pfade, um einfaches Lesen und Schreiben von Eigenschaften in verschachtelten Datenstrukturen zu ermöglichen.

## 🚀 **Neue Methoden**

### **1. SelectPropertyWithPath()**
```csharp
// XPath-ähnliche Navigation mit Array-Index-Unterstützung
var property = navigator.SelectPropertyWithPath("S071.Person[0].Name");
var property = navigator.SelectPropertyWithPath("Customer.Orders[2].Items[1].ProductName");
```

### **2. GetPropertyValue()**
```csharp
// Lesen von Property-Werten mit Array-Index-Pfaden
var name = navigator.GetPropertyValue(instance, "Person[0].Name");
var street = navigator.GetPropertyValue(instance, "Person[0].Address.Street");
var productName = navigator.GetPropertyValue(instance, "Orders[1].Items[2].ProductName");
```

### **3. SetPropertyValue()**
```csharp
// Schreiben von Property-Werten mit Array-Index-Pfaden
bool success = navigator.SetPropertyValue(instance, "Person[0].Name", "John Doe");
bool success = navigator.SetPropertyValue(instance, "Person[0].Address.City", "Berlin");
bool success = navigator.SetPropertyValue(instance, "Orders[0].Items[1].Quantity", 5);
```

## 📝 **Unterstützte Syntax**

| **Syntax** | **Beschreibung** | **Beispiel** |
|------------|------------------|--------------|
| `Type.Property` | Einfache Property | `S071.OrderNumber` |
| `Type.Property[index]` | Array-Element | `S071.Person[0]` |
| `Type.Property[index].NestedProperty` | Verschachtelte Property in Array | `S071.Person[0].Name` |
| `Type.Property[index].Nested[index].Deep` | Mehrfach verschachtelt | `Order.Items[2].SubItems[1].Name` |
| `Type.Property.Nested.Deep` | Ohne Array-Index | `Person.Address.Street` |

## 🔧 **Implementierungsdetails**

### **PropertyPathSegment Class**
```csharp
public class PropertyPathSegment
{
    public string PropertyName { get; set; }      // "Person", "Items"
    public int? ArrayIndex { get; set; }          // 0, 1, 2, ...
    public bool IsArray => ArrayIndex.HasValue;  // true wenn [index] angegeben
}
```

### **PropertyPathInfo Class**
```csharp
public class PropertyPathInfo
{
    public List<PropertyPathSegment> PathSegments { get; set; }
    public string OriginalPath { get; set; }  // "S071.Person[0].Name"
}
```

### **Path-Parsing mit Regex**
```csharp
// Erkennt Patterns wie "PropertyName[123]"
var arrayMatch = Regex.Match(segment, @"^(.+?)\[(\d+)\]$");
```

## 🎯 **Anwendungsbeispiele**

### **EESSI S071 Navigation**
```csharp
// EESSI S071 Schema mit Person-Arrays
var factory = new XsdToCSharpFactory();
var navigator = factory.GenerateTypesFromXsd("S071-4.4.xsd");

// Erstelle S071-Instanz
var s071Instance = CreateS071Instance();

// Lese erste Person
var firstName = navigator.GetPropertyValue(s071Instance, "Person[0].Name");
var address = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");

// Setze Eigenschaften
navigator.SetPropertyValue(s071Instance, "Person[0].Name", "Max Mustermann");
navigator.SetPropertyValue(s071Instance, "Person[0].Address.City", "Berlin");
navigator.SetPropertyValue(s071Instance, "Person[1].Age", 35);
```

### **E-Commerce Order Navigation**
```csharp
// E-Commerce Schema mit Orders und Items
var orderNumber = navigator.GetPropertyValue(order, "OrderNumber");
var firstItem = navigator.GetPropertyValue(order, "Items[0].ProductName");
var secondItemQty = navigator.GetPropertyValue(order, "Items[1].Quantity");

// Bestellung bearbeiten
navigator.SetPropertyValue(order, "Items[0].Quantity", 10);
navigator.SetPropertyValue(order, "Items[1].Price", 99.99m);
navigator.SetPropertyValue(order, "Customer.Address.Street", "Neue Straße 456");
```

## ⚡ **Vorteile**

### **1. Vereinfachte Syntax**
```csharp
// VORHER (traditionell):
var personCollection = s071Instance.Person;
var person = personCollection[0];
var address = person.Address;
var street = address.Street;

// NACHHER (mit Array-Index-Navigation):
var street = navigator.GetPropertyValue(s071Instance, "Person[0].Address.Street");
```

### **2. Dynamische Property-Pfade**
```csharp
// Property-Pfade können zur Laufzeit konstruiert werden
string propertyPath = $"Person[{index}].{propertyName}";
var value = navigator.GetPropertyValue(instance, propertyPath);
```

### **3. Robuste Fehlerbehandlung**
```csharp
// Out-of-bounds-Zugriff gibt null zurück (statt Exception)
var value = navigator.GetPropertyValue(instance, "Person[999].Name"); // → null
var success = navigator.SetPropertyValue(instance, "Person[999].Name", "Test"); // → false
```

### **4. Collection-Unterstützung**
- ✅ `IList<T>` (z.B. `List<Person>`)
- ✅ `Collection<T>` (z.B. `ObservableCollection<Person>`)
- ✅ `IEnumerable<T>` (mit LINQ `.ToList()`)
- ✅ Arrays (`Person[]`)

## 🧪 **Tests**

### **Unit Tests erstellt:**
- `XsdTypeNavigatorArrayIndexTests.cs`
  - ✅ Path-Parsing-Tests
  - ✅ Get/Set Property-Value-Tests  
  - ✅ Out-of-bounds-Tests
  - ✅ EESSI-Integration-Tests

### **Ausführung:**
```bash
dotnet test --filter "FullyQualifiedName~XsdTypeNavigatorArrayIndexTests"
# Result: 4 Tests bestanden
```

## 🔄 **Kompatibilität**

- ✅ **Rückwärtskompatibel**: Alle existierenden Methoden funktionieren unverändert
- ✅ **Zusätzliche Funktionalität**: Neue Methoden erweitern die bestehende API
- ✅ **Keine Breaking Changes**: Bestehender Code läuft weiterhin

## 📊 **Performance**

- **Path-Parsing**: Einmalig beim Aufruf via Regex
- **Reflection**: Optimiert mit Property-Caching
- **Array-Zugriff**: Direct Index-Access für `IList<T>`
- **LINQ-Fallback**: Für `IEnumerable<T>` ohne Index-Support

## 🛠️ **Verwendung**

```csharp
// 1. XsdTypeNavigator erstellen
var factory = new XsdToCSharpFactory();
var navigator = factory.GenerateTypesFromXsd("schema.xsd");

// 2. Instanz erstellen (mit vorhandenem Code)
var instance = CreateYourInstance();

// 3. Array-Index-Navigation verwenden
var value = navigator.GetPropertyValue(instance, "Property[0].NestedProperty");
navigator.SetPropertyValue(instance, "Property[1].NestedProperty", newValue);
```

## 🎉 **Fazit**

Die Array-Index-Navigation macht den `XsdTypeNavigator` noch mächtiger und benutzerfreundlicher für komplexe, verschachtelte Datenstrukturen. Besonders für EESSI-Schemas mit vielen Collection-Properties ist dies eine erhebliche Verbesserung der Developer Experience.

**Syntax-Beispiele:**
- `S071.Person[0].Name` ← **Ihr gewünschtes Format!**
- `Order.Items[2].SubItems[1].ProductName`
- `Customer.Addresses[0].Street`
- `Document.Sections[3].Paragraphs[5].Text`