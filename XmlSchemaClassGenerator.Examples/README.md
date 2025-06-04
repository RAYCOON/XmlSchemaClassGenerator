# XmlSchemaClassGenerator Examples

This project contains comprehensive examples demonstrating the capabilities of the XmlSchemaClassGenerator library and its new features.

## Running the Examples

### Run All Examples
```bash
dotnet run
```

### Run Specific Example
```bash
dotnet run [example-name]
```

## Available Examples

### 1. Array Index Navigation Example
**Command:** `dotnet run array` or `dotnet run 1`

Demonstrates the enhanced XsdTypeNavigator functionality with array-index support:
- Property paths like `"Person[0].Name"` for reading and writing
- Automatic collection expansion
- Deep nested array navigation
- Out-of-bounds handling

**Features Shown:**
- `navigator.GetPropertyValue(instance, "Person[0].Name")`
- `navigator.SetPropertyValue(instance, "Person[0].Address.Street", "Main St")`
- Array index syntax: `Customer.Orders[2].Items[1].ProductName`

### 2. XsdToCSharpFactory Basic Example
**Command:** `dotnet run factory` or `dotnet run 2`

Shows basic and advanced usage of the XsdToCSharpFactory:
- Simple schema generation
- Custom configuration
- Complex nested objects
- XML serialization and deserialization

**Features Shown:**
- `factory.GenerateTypesFromXsd(xsdFile)`
- `factory.CreateInstance("TypeName")`
- `navigator.SerializeToXml(instance)`
- Custom GeneratorConfiguration

### 3. Auto Property Initialization Example
**Command:** `dotnet run auto` or `dotnet run 3`

Demonstrates automatic property initialization features:
- Deep path navigation with automatic object creation
- Collection auto-expansion
- Bulk property initialization
- Collection size management

**Features Shown:**
- `navigator.InitializeAllProperties(instance)`
- `navigator.EnsureCollectionSize(instance, "Orders", 5)`
- `navigator.InitializeCollectionProperty(instance, "Items", 3)`
- Automatic null property creation

### 4. Dynamic Access Example
**Command:** `dotnet run dynamic` or `dotnet run 4`

Shows dynamic access to XSD-generated types:
- Schema exploration and introspection
- Pattern-based property search
- Type metadata retrieval
- Runtime type manipulation

**Features Shown:**
- `navigator.GetAllTypeNames()`
- `navigator.SelectProperties("*", "*Name*")`
- `navigator.GetTypeMetadata("TypeName")`
- `navigator.GetTypeHierarchy("TypeName")`

### 5. XPath Navigation Example
**Command:** `dotnet run xpath` or `dotnet run 5`

Demonstrates XPath-like navigation capabilities:
- Complex nested object navigation
- Collection handling with indices
- Advanced search patterns
- Type relationship exploration

**Features Shown:**
- Deep navigation: `Customer.Address.City`
- Array notation: `Items.Item[0].ProductName`
- Pattern matching: `SelectProperties("*Type", "*Name*")`
- Hierarchical data structures

## Key Features Demonstrated

### Enhanced Navigation
- **Simple Properties:** `Name`, `Age`, `Email`
- **Nested Objects:** `Customer.Address.Street`
- **Array Indices:** `Orders[0].Total`
- **Deep Nesting:** `Customer.Orders[1].Items[2].ProductName`

### Automatic Initialization
- **Null Object Creation:** Automatically creates intermediate objects
- **Collection Expansion:** Expands collections when accessing out-of-bounds indices
- **Bulk Initialization:** Initializes entire object graphs
- **Type-Aware Creation:** Creates appropriate collection types (List<T>, Collection<T>, etc.)

### Schema Introspection
- **Type Discovery:** Find all types and their properties
- **Pattern Matching:** Search properties by patterns
- **Metadata Access:** Get type information and documentation
- **Hierarchy Navigation:** Explore inheritance relationships

### XML Integration
- **Serialization:** Convert objects to schema-valid XML
- **Deserialization:** Load XML into strongly-typed objects
- **Namespace Handling:** Custom namespace mappings
- **Validation:** Validate XML against original schemas

## Sample Schemas

The examples use various sample schemas to demonstrate different scenarios:
- Simple person/customer schemas
- Complex business objects (orders, companies)
- Nested collections and arrays
- Optional and required elements
- Enumerations and restrictions

## Building and Testing

```bash
# Build the examples project
dotnet build

# Run all examples
dotnet run

# Run with specific example
dotnet run array

# Available options:
# 1, array, arrayindex     - Array Index Navigation
# 2, factory, xsdtocsharp  - XsdToCSharpFactory Basic
# 3, auto, autoprop        - Auto Property Initialization  
# 4, dynamic               - Dynamic Access
# 5, xpath, navigation     - XPath Navigation
```

## Integration with Main Library

These examples demonstrate features of the main XmlSchemaClassGenerator library:
- **XsdToCSharpFactory:** High-level API for code generation
- **XsdTypeNavigator:** Runtime navigation and manipulation
- **GeneratorConfiguration:** Customization options
- **ModelBuilder:** Low-level type model construction

## Contributing

When adding new examples:
1. Create a new class in the Examples namespace
2. Implement a static `Run()` method
3. Add the example to `Program.cs`
4. Update this README with documentation
5. Include sample schemas if needed

## Dependencies

- **XmlSchemaClassGenerator:** Main library for code generation
- **.NET 8.0:** Target framework
- **System.Xml:** XML processing
- **System.Reflection:** Runtime type manipulation