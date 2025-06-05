# XSD Validation Limitations

## Overview

This document outlines the current limitations of the XSD validation implementation in `XsdToCSharpFactory` and provides guidance for handling complex XSD constructs.

## Choice Element Limitations

### Problem Description

XSD Choice elements represent mutually exclusive options where exactly ONE element from the choice group must be present. However, current validation logic treats Choice elements as if they were Sequence elements.

### Technical Details

**XSD Schema Example:**
```xml
<xs:complexType name="ContactType">
  <xs:sequence>
    <xs:element name="Name" type="xs:string" minOccurs="1"/>
    
    <!-- Choice: Exactly ONE of these must be present -->
    <xs:choice minOccurs="1" maxOccurs="1">
      <xs:element name="Email" type="xs:string"/>
      <xs:element name="Phone" type="xs:string"/>
      <xs:element name="Address" type="AddressType"/>
    </xs:choice>
  </xs:sequence>
</xs:complexType>

<xs:complexType name="AddressType">
  <xs:sequence>
    <xs:element name="Street" type="xs:string" minOccurs="1"/>
    <xs:element name="City" type="xs:string" minOccurs="1"/>
  </xs:sequence>
</xs:complexType>
```

### Current Behavior (Incorrect)

**`GetRequiredPropertyPaths()` returns:**
```csharp
[
  "Name",           // ✅ Correct - always required
  "Email",          // ❌ Wrong - only if Email choice is selected
  "Phone",          // ❌ Wrong - only if Phone choice is selected  
  "Address.Street", // ❌ Wrong - only if Address choice is selected
  "Address.City"    // ❌ Wrong - only if Address choice is selected
]
```

**`ValidateInstance()` behavior:**
- Reports ALL choice options as required
- Reports nested required fields even when their parent choice is not selected
- Cannot enforce "exactly one choice" constraint

### Expected Behavior (Correct)

**`GetRequiredPropertyPaths()` should return:**
```csharp
[
  "Name",              // ✅ Always required
  "Email|Phone|Address" // ✅ Exactly ONE of these choices required
]
```

**`ValidateInstance()` should:**
1. Validate that exactly ONE choice option is present
2. ONLY validate required fields within the selected choice branch
3. Return choice-specific validation errors

### Root Cause

The underlying XmlSchemaClassGenerator treats Choice elements as Sequence elements due to inherent complexity in representing XSD choice semantics in object-oriented code. This is a **design limitation**, not a bug.

## Workarounds

### 1. Application-Level Choice Validation

Implement custom validation logic in your application:

```csharp
public class ContactValidator
{
    public List<ValidationError> ValidateContact(ContactType contact)
    {
        var errors = new List<ValidationError>();
        
        // Validate choice constraint
        var choiceCount = new[] 
        { 
            !string.IsNullOrEmpty(contact.Email),
            !string.IsNullOrEmpty(contact.Phone),
            contact.Address != null
        }.Count(x => x);
        
        if (choiceCount == 0)
        {
            errors.Add(new ValidationError("Contact must have Email, Phone, or Address"));
        }
        else if (choiceCount > 1)
        {
            errors.Add(new ValidationError("Contact must have exactly one of: Email, Phone, or Address"));
        }
        
        // Validate conditional required fields
        if (contact.Address != null)
        {
            if (string.IsNullOrEmpty(contact.Address.Street))
                errors.Add(new ValidationError("Address.Street is required when Address is provided"));
            if (string.IsNullOrEmpty(contact.Address.City))
                errors.Add(new ValidationError("Address.City is required when Address is provided"));
        }
        
        return errors;
    }
}
```

### 2. Custom Validation Attributes

Create reusable validation attributes:

```csharp
[AttributeUsage(AttributeTargets.Class)]
public class ChoiceValidationAttribute : ValidationAttribute
{
    private readonly string[] _choiceProperties;
    
    public ChoiceValidationAttribute(params string[] choiceProperties)
    {
        _choiceProperties = choiceProperties;
    }
    
    public override bool IsValid(object value)
    {
        if (value == null) return false;
        
        var type = value.GetType();
        var setCount = _choiceProperties.Count(prop =>
        {
            var property = type.GetProperty(prop);
            var val = property?.GetValue(value);
            return val != null && (val is not string str || !string.IsNullOrEmpty(str));
        });
        
        return setCount == 1; // Exactly one must be set
    }
}

// Usage:
[ChoiceValidation("Email", "Phone", "Address")]
public partial class ContactType
{
    // Generated properties...
}
```

### 3. Factory Extension Methods

Extend the XsdToCSharpFactory with choice-aware validation:

```csharp
public static class XsdFactoryChoiceExtensions
{
    public static List<ChoiceValidationError> ValidateChoiceConstraints(
        this XsdToCSharpFactory factory, 
        object instance)
    {
        // Implementation would require schema metadata analysis
        // to identify choice groups and validate accordingly
        throw new NotImplementedException("Choice validation requires schema metadata");
    }
}
```

## Affected Operations

The following operations are impacted by choice limitations:

### `GetRequiredPropertyPaths()`
- **Impact**: Returns incorrect required paths for choice elements
- **Mitigation**: Filter results and implement custom choice logic
- **Severity**: High - affects form validation and UI requirements

### `ValidateInstance()`
- **Impact**: Cannot enforce choice constraints or conditional requirements
- **Mitigation**: Supplement with custom validation logic
- **Severity**: High - affects data integrity validation

## Alternative Approaches

### 1. Schema Modification

If you control the XSD schema, consider restructuring to avoid complex choices:

```xml
<!-- Instead of choice, use explicit flags -->
<xs:complexType name="ContactType">
  <xs:sequence>
    <xs:element name="Name" type="xs:string" minOccurs="1"/>
    <xs:element name="ContactMethod" type="tns:ContactMethodType" minOccurs="1"/>
  </xs:sequence>
</xs:complexType>

<xs:complexType name="ContactMethodType">
  <xs:choice>
    <xs:element name="Email" type="xs:string"/>
    <xs:element name="Phone" type="xs:string"/>
    <xs:element name="Address" type="tns:AddressType"/>
  </xs:choice>
</xs:complexType>
```

### 2. Separate Validation Library

Consider using a dedicated XSD validation library alongside the generated classes:

```csharp
// Use generated classes for object model
var contact = factory.CreateRootInstance();

// Use separate library for schema validation
var validator = new XmlSchemaValidator(schemaSet);
var xmlDocument = SerializeToXmlDocument(contact);
var validationErrors = validator.Validate(xmlDocument);
```

## Future Enhancements

Potential improvements to address these limitations:

1. **Schema-Aware Validation**: Enhance factory to preserve XSD schema metadata for runtime choice validation
2. **Choice Group Detection**: Automatically identify choice groups in generated types
3. **Conditional Required Analysis**: Build validation rules based on choice selections
4. **Fluent Validation Integration**: Generate FluentValidation rules for complex constraints

## Client Recommendations

### For New Projects
1. **Design schemas to minimize complex choices** where possible
2. **Plan for custom validation logic** in application layer
3. **Consider alternative validation approaches** for critical business rules

### For Existing Projects
1. **Audit current usage** of `GetRequiredPropertyPaths()` and `ValidateInstance()`
2. **Implement supplementary validation** for choice constraints
3. **Document choice elements** that require special handling
4. **Test edge cases** thoroughly, especially around choice validations

### Development Guidelines
1. **Never rely solely** on factory validation for choice elements
2. **Always implement application-level** choice constraint validation
3. **Use factory validation** as a first-pass check, not authoritative validation
4. **Document choice constraints** in code comments and user documentation

## Conclusion

While the XSD-to-C# factory provides powerful validation capabilities, choice elements require additional application-level validation logic. This limitation is inherent to the complexity of mapping XSD choice semantics to object-oriented code structures.

**The factory's validation should be considered a development aid and basic safety net, not a complete replacement for proper schema validation in production systems.**