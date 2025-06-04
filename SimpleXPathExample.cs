// Einfaches Beispiel für XPath-ähnliche Schema-Navigation

// Gegeben: Ein XSD Schema mit verschachtelten Typen
// CustomerType -> Address -> Street, City
// OrderType -> Customer -> Address -> Street

var factory = new XsdToCSharpFactory();
var navigator = factory.GenerateTypesFromXsd("customer.xsd");

// === XPath-ähnliche Navigation ===

// 1. Direct Type Access (wie XPath //CustomerType)
var customerType = navigator.SelectType("CustomerType");
Console.WriteLine($"Typ gefunden: {customerType.Name}");

// 2. Simple Property Path (wie XPath /CustomerType/Name)
var nameProperty = navigator.SelectProperty("CustomerType/Name");
Console.WriteLine($"Property: {nameProperty.Name} vom Typ {nameProperty.Type.Name}");

// 3. Nested Path Navigation (wie XPath /CustomerType/Address/Street)
var streetProperty = navigator.SelectProperty("CustomerType/Address/Street");
Console.WriteLine($"Nested Property: {streetProperty.Name}");

// 4. Wildcard Search (wie XPath //*[contains(@name,'Email')])
var emailProperties = navigator.SelectProperties("*", "*Email*");
Console.WriteLine($"Alle Email-Properties: {string.Join(", ", emailProperties.Select(p => p.Name))}");

// 5. Type Pattern Search (wie XPath //Customer*)
var customerProperties = navigator.SelectProperties("Customer*", "*");
Console.WriteLine($"Alle Customer-Type Properties: {customerProperties.Count()}");

// 6. Virtual Instance Navigation
var instance = navigator.CreateInstance("CustomerType");
instance.SetProperty("Name", "Max Mustermann");
instance.SetProperty("Email", "max@example.com");

var retrievedName = instance.GetProperty("Name");
Console.WriteLine($"Virtual Instance Name: {retrievedName}");

// === Navigation Syntax Vergleich ===
/*
XPath:                           XsdTypeNavigator:
//CustomerType                   navigator.SelectType("CustomerType")
/CustomerType/Name               navigator.SelectProperty("CustomerType/Name")
/CustomerType/Address/Street     navigator.SelectProperty("CustomerType/Address/Street")
//*[contains(@name,'Email')]     navigator.SelectProperties("*", "*Email*")
//Customer*                      navigator.SelectProperties("Customer*", "*")
*/