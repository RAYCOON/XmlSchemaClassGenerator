using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Xml.Schema;

namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Provides XPath-like navigation through XSD-derived TypeModel objects
    /// </summary>
    public class XsdTypeNavigator
    {
        private readonly ModelBuilder _modelBuilder;
        private readonly Dictionary<string, TypeModel> _allTypes;
        private readonly Dictionary<NamespaceKey, NamespaceModel> _namespaces;

        internal XsdTypeNavigator(ModelBuilder modelBuilder)
        {
            _modelBuilder = modelBuilder;
            _allTypes = modelBuilder.Types;
            _namespaces = modelBuilder.Namespaces;
        }

        /// <summary>
        /// Get all available type names
        /// </summary>
        public IEnumerable<string> GetAllTypeNames()
        {
            return _namespaces.Values.SelectMany(ns => ns.Types.Values).Select(t => t.Name).Distinct();
        }

        /// <summary>
        /// Get all TypeModels grouped by namespace
        /// </summary>
        public Dictionary<string, IEnumerable<TypeModel>> GetTypesByNamespace()
        {
            return _namespaces.ToDictionary(
                kvp => kvp.Value.Name ?? "Default",
                kvp => kvp.Value.Types.Values.AsEnumerable()
            );
        }

        /// <summary>
        /// XPath-like navigation: Get a type by name
        /// Usage: navigator.SelectType("CustomerType")
        /// </summary>
        public TypeModel SelectType(string typeName)
        {
            return _namespaces.Values
                .SelectMany(ns => ns.Types.Values)
                .FirstOrDefault(t => t.Name == typeName);
        }

        /// <summary>
        /// XPath-like navigation: Get a type by namespace and name
        /// Usage: navigator.SelectType("http://example.com", "CustomerType")
        /// </summary>
        public TypeModel SelectType(string namespaceName, string typeName)
        {
            var targetNamespace = _namespaces.Values.FirstOrDefault(ns => 
                ns.Key.XmlSchemaNamespace == namespaceName || ns.Name == namespaceName);
            
            return targetNamespace?.Types.Values.FirstOrDefault(t => t.Name == typeName);
        }

        /// <summary>
        /// XPath-like navigation: Get all properties of a type
        /// Usage: navigator.SelectProperties("CustomerType")
        /// </summary>
        public IEnumerable<PropertyModel> SelectProperties(string typeName)
        {
            var type = SelectType(typeName);
            if (type is ClassModel classModel)
            {
                return classModel.Properties;
            }
            return Enumerable.Empty<PropertyModel>();
        }

        /// <summary>
        /// XPath-like navigation: Get a specific property by path
        /// Usage: navigator.SelectProperty("CustomerType/Name")
        /// Usage: navigator.SelectProperty("CustomerType/Address/Street")
        /// </summary>
        public PropertyModel SelectProperty(string propertyPath)
        {
            var pathParts = propertyPath.Split('/');
            if (pathParts.Length < 2)
                return null;

            var typeName = pathParts[0];
            var propertyName = pathParts[1];

            var type = SelectType(typeName);
            if (type is not ClassModel classModel)
                return null;

            var property = classModel.Properties.FirstOrDefault(p => p.Name == propertyName);
            
            // If there are more path parts, navigate deeper
            if (pathParts.Length > 2 && property != null)
            {
                return SelectPropertyRecursive(property.Type, pathParts.Skip(2).ToArray());
            }

            return property;
        }

        /// <summary>
        /// Enhanced property path navigation with array index support
        /// Usage: navigator.SelectPropertyWithPath("S071.Person[0].Name")
        /// Usage: navigator.SelectPropertyWithPath("Customer.Orders[2].Items[1].ProductName")
        /// Usage: navigator.SelectPropertyWithPath("Order.Customer.Address.Street")
        /// </summary>
        public PropertyModel SelectPropertyWithPath(string propertyPath)
        {
            var pathInfo = ParsePropertyPath(propertyPath);
            if (pathInfo.PathSegments.Count < 1)
                return null;

            var rootTypeName = pathInfo.PathSegments[0].PropertyName;
            var type = SelectType(rootTypeName);
            
            if (type is not ClassModel classModel)
                return null;

            // If only root type specified, return null (no property selected)
            if (pathInfo.PathSegments.Count == 1)
                return null;

            return SelectPropertyRecursiveWithIndex(classModel, pathInfo.PathSegments.Skip(1).ToList());
        }

        /// <summary>
        /// Get or set property value using enhanced path with array index support
        /// Usage: navigator.GetPropertyValue(instance, "Person[0].Name")
        /// Usage: navigator.GetPropertyValue(instance, "Name") // simple property access
        /// </summary>
        public object GetPropertyValue(object instance, string propertyPath)
        {
            if (instance == null) return null;

            // Handle simple property names (no path separators)
            if (!propertyPath.Contains('.') && !propertyPath.Contains('['))
            {
                try
                {
                    var instanceType = instance.GetType();
                    var property = instanceType.GetProperty(propertyPath);
                    if (property == null)
                    {
                        // Debug: Log available properties if property not found
                        var availableProps = instanceType.GetProperties().Select(p => p.Name).ToArray();
                        System.Diagnostics.Debug.WriteLine($"Property '{propertyPath}' not found on type '{instanceType.Name}'. Available: {string.Join(", ", availableProps)}");
                        return null;
                    }
                    return property.GetValue(instance);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error getting property '{propertyPath}': {ex.Message}");
                    return null;
                }
            }

            var pathInfo = ParsePropertyPath(propertyPath);
            return GetPropertyValueRecursive(instance, pathInfo.PathSegments);
        }

        /// <summary>
        /// Set property value using enhanced path with array index support
        /// Usage: navigator.SetPropertyValue(instance, "Person[0].Name", "John Doe")
        /// Usage: navigator.SetPropertyValue(instance, "Name", "John Doe") // simple property access
        /// </summary>
        public bool SetPropertyValue(object instance, string propertyPath, object value)
        {
            if (instance == null) return false;

            // Handle simple property names (no path separators)
            if (!propertyPath.Contains('.') && !propertyPath.Contains('['))
            {
                try
                {
                    var instanceType = instance.GetType();
                    var property = instanceType.GetProperty(propertyPath);
                    if (property != null && property.CanWrite)
                    {
                        property.SetValue(instance, value);
                        return true;
                    }
                    return false;
                }
                catch
                {
                    return false;
                }
            }

            var pathInfo = ParsePropertyPath(propertyPath);
            return SetPropertyValueRecursive(instance, pathInfo.PathSegments, value);
        }

        /// <summary>
        /// Recursive property navigation for deep paths
        /// </summary>
        private PropertyModel SelectPropertyRecursive(TypeModel currentType, string[] remainingPath)
        {
            if (remainingPath.Length == 0 || currentType is not ClassModel classModel)
                return null;

            var propertyName = remainingPath[0];
            var property = classModel.Properties.FirstOrDefault(p => p.Name == propertyName);

            if (remainingPath.Length == 1)
                return property;

            if (property != null)
                return SelectPropertyRecursive(property.Type, remainingPath.Skip(1).ToArray());

            return null;
        }

        /// <summary>
        /// XPath-like navigation: Get all properties matching a pattern
        /// Usage: navigator.SelectProperties("*", "Email") // All Email properties in any type
        /// Usage: navigator.SelectProperties("Customer*", "*") // All properties in types starting with Customer
        /// </summary>
        public IEnumerable<PropertyModel> SelectProperties(string typePattern = "*", string propertyPattern = "*")
        {
            var types = _namespaces.Values.SelectMany(ns => ns.Types.Values);

            if (typePattern != "*")
            {
                var typeRegex = new System.Text.RegularExpressions.Regex(
                    "^" + typePattern.Replace("*", ".*") + "$", 
                    System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                types = types.Where(t => typeRegex.IsMatch(t.Name));
            }

            var properties = types.OfType<ClassModel>()
                .SelectMany(t => t.Properties);

            if (propertyPattern != "*")
            {
                var propertyRegex = new System.Text.RegularExpressions.Regex(
                    "^" + propertyPattern.Replace("*", ".*") + "$", 
                    System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                properties = properties.Where(p => propertyRegex.IsMatch(p.Name));
            }

            return properties;
        }

        /// <summary>
        /// Get type inheritance hierarchy
        /// Usage: navigator.GetTypeHierarchy("DerivedType")
        /// </summary>
        public IEnumerable<TypeModel> GetTypeHierarchy(string typeName)
        {
            var type = SelectType(typeName);
            var hierarchy = new List<TypeModel>();

            if (type is ClassModel classModel)
            {
                var current = classModel;
                while (current != null)
                {
                    hierarchy.Add(current);
                    current = current.BaseClass as ClassModel;
                }
            }

            return hierarchy;
        }

        /// <summary>
        /// Get all derived types of a base type
        /// Usage: navigator.GetDerivedTypes("BaseType")
        /// </summary>
        public IEnumerable<TypeModel> GetDerivedTypes(string baseTypeName)
        {
            var baseType = SelectType(baseTypeName);
            if (baseType is not ClassModel baseClass)
                return Enumerable.Empty<TypeModel>();

            return _namespaces.Values
                .SelectMany(ns => ns.Types.Values)
                .OfType<ClassModel>()
                .Where(t => IsBaseClassOf(baseClass, t));
        }

        private bool IsBaseClassOf(ClassModel baseClass, ClassModel derivedClass)
        {
            var current = derivedClass.BaseClass as ClassModel;
            while (current != null)
            {
                if (current == baseClass)
                    return true;
                current = current.BaseClass as ClassModel;
            }
            return false;
        }

        /// <summary>
        /// Get all Choice properties in the schema
        /// Usage: navigator.GetChoiceProperties()
        /// </summary>
        public IEnumerable<PropertyModel> GetChoiceProperties()
        {
            return _namespaces.Values
                .SelectMany(ns => ns.Types.Values)
                .OfType<ClassModel>()
                .SelectMany(t => t.Properties)
                .Where(p => p.IsChoice);
        }

        /// <summary>
        /// Get Choice element information for a specific property
        /// Usage: navigator.GetChoiceElementInfo("PaymentType", "PaymentMethod")
        /// </summary>
        public IEnumerable<ChoiceElementInfo> GetChoiceElementInfo(string typeName, string propertyName)
        {
            var property = SelectProperty($"{typeName}/{propertyName}");
            return property?.ChoiceElementTypes ?? Enumerable.Empty<ChoiceElementInfo>();
        }

        /// <summary>
        /// Create a type instance navigation helper
        /// Usage: var instance = navigator.CreateInstance("CustomerType");
        /// </summary>
        public XsdInstanceNavigator CreateInstance(string typeName)
        {
            var typeModel = SelectType(typeName);
            if (typeModel is ClassModel classModel)
            {
                return new XsdInstanceNavigator(classModel, this);
            }
            throw new ArgumentException($"Type '{typeName}' not found or is not a complex type");
        }

        /// <summary>
        /// Get XSD metadata for a type
        /// </summary>
        public XsdTypeMetadata GetTypeMetadata(string typeName)
        {
            var type = SelectType(typeName);
            if (type == null)
                return null;

            return new XsdTypeMetadata
            {
                Name = type.Name,
                XmlSchemaName = type.XmlSchemaName,
                Namespace = type.Namespace?.Name,
                XmlNamespace = type.XmlSchemaName?.Namespace,
                Documentation = type.Documentation?.Select(d => d.Text).ToList() ?? new List<string>(),
                IsAnonymous = type.IsAnonymous,
                IsAbstract = type is ClassModel cm && cm.IsAbstract,
                BaseTypeName = type is ClassModel classModel ? classModel.BaseClass?.Name : null
            };
        }

        /// <summary>
        /// Parse property path with array index support
        /// Examples: "S071.Person[0].Name" -> S071, Person[0], Name
        /// </summary>
        private PropertyPathInfo ParsePropertyPath(string propertyPath)
        {
            var result = new PropertyPathInfo { OriginalPath = propertyPath };
            
            if (string.IsNullOrEmpty(propertyPath))
                return result;

            // Split by dot, but handle array notation
            var segments = propertyPath.Split('.');
            
            foreach (var segment in segments)
            {
                var pathSegment = new PropertyPathSegment();
                
                // Check for array notation: PropertyName[index]
                var arrayMatch = System.Text.RegularExpressions.Regex.Match(segment, @"^(.+?)\[(\d+)\]$");
                if (arrayMatch.Success)
                {
                    pathSegment.PropertyName = arrayMatch.Groups[1].Value;
                    pathSegment.ArrayIndex = int.Parse(arrayMatch.Groups[2].Value);
                }
                else
                {
                    pathSegment.PropertyName = segment;
                }
                
                result.PathSegments.Add(pathSegment);
            }
            
            return result;
        }

        /// <summary>
        /// Recursive property selection with array index support
        /// </summary>
        private PropertyModel SelectPropertyRecursiveWithIndex(ClassModel currentType, List<PropertyPathSegment> remainingPath)
        {
            if (remainingPath.Count == 0 || currentType == null)
                return null;

            var segment = remainingPath[0];
            var property = currentType.Properties.FirstOrDefault(p => p.Name == segment.PropertyName);

            if (property == null)
                return null;

            // If this is the last segment, return the property
            if (remainingPath.Count == 1)
                return property;

            // Navigate deeper
            var nextType = property.Type as ClassModel;
            if (nextType == null)
                return null;

            return SelectPropertyRecursiveWithIndex(nextType, remainingPath.Skip(1).ToList());
        }

        /// <summary>
        /// Get property value recursively with array index support
        /// </summary>
        private object GetPropertyValueRecursive(object instance, List<PropertyPathSegment> pathSegments)
        {
            if (instance == null || pathSegments.Count == 0)
                return null;

            var segment = pathSegments[0];
            var instanceType = instance.GetType();
            var property = instanceType.GetProperty(segment.PropertyName);

            if (property == null)
                return null;

            var value = property.GetValue(instance);

            // Handle array indexing
            if (segment.IsArray && segment.ArrayIndex.HasValue)
            {
                if (value == null)
                    return null;

                // Handle IList, Array, or Collection
                if (value is System.Collections.IList list)
                {
                    if (segment.ArrayIndex.Value >= 0 && segment.ArrayIndex.Value < list.Count)
                    {
                        value = list[segment.ArrayIndex.Value];
                    }
                    else
                    {
                        return null; // Index out of bounds
                    }
                }
                else if (value is System.Collections.IEnumerable enumerable)
                {
                    // Handle IEnumerable (like Collection<T>)
                    var items = enumerable.Cast<object>().ToList();
                    if (segment.ArrayIndex.Value >= 0 && segment.ArrayIndex.Value < items.Count)
                    {
                        value = items[segment.ArrayIndex.Value];
                    }
                    else
                    {
                        return null; // Index out of bounds
                    }
                }
                else
                {
                    return null; // Not a collection
                }
            }

            // If this is the last segment, return the value
            if (pathSegments.Count == 1)
                return value;

            // Continue recursively
            return GetPropertyValueRecursive(value, pathSegments.Skip(1).ToList());
        }

        /// <summary>
        /// Set property value recursively with array index support and automatic property initialization
        /// Automatically initializes null properties to enable deep path navigation
        /// </summary>
        private bool SetPropertyValueRecursive(object instance, List<PropertyPathSegment> pathSegments, object value)
        {
            if (instance == null || pathSegments.Count == 0)
                return false;

            var segment = pathSegments[0];
            var instanceType = instance.GetType();
            var property = instanceType.GetProperty(segment.PropertyName);

            if (property == null || !property.CanWrite)
                return false;

            // If this is the last segment, set the value
            if (pathSegments.Count == 1)
            {
                try
                {
                    property.SetValue(instance, value);
                    return true;
                }
                catch
                {
                    return false;
                }
            }

            // Navigate deeper - get current value
            var currentValue = property.GetValue(instance);

            // AUTOMATIC PROPERTY INITIALIZATION: Initialize null properties to enable deep navigation
            if (currentValue == null && !segment.IsArray)
            {
                // Try to create instance of the property type
                currentValue = TryCreatePropertyInstance(property.PropertyType);
                if (currentValue != null)
                {
                    try
                    {
                        property.SetValue(instance, currentValue);
                    }
                    catch
                    {
                        return false; // Could not set the initialized property
                    }
                }
                else
                {
                    return false; // Could not create instance for null property
                }
            }

            // Handle array indexing
            if (segment.IsArray && segment.ArrayIndex.HasValue)
            {
                if (currentValue == null)
                    return false;

                // Handle IList, Array, or Collection
                if (currentValue is System.Collections.IList list)
                {
                    // AUTOMATIC COLLECTION EXPANSION: Expand collection if index is beyond current size
                    if (segment.ArrayIndex.Value >= list.Count)
                    {
                        var elementType = GetCollectionElementType(list.GetType());
                        if (elementType != null)
                        {
                            // Expand collection to accommodate the index
                            while (list.Count <= segment.ArrayIndex.Value)
                            {
                                var newElement = TryCreatePropertyInstance(elementType);
                                list.Add(newElement);
                            }
                        }
                        else
                        {
                            return false; // Can't determine element type
                        }
                    }

                    if (segment.ArrayIndex.Value >= 0 && segment.ArrayIndex.Value < list.Count)
                    {
                        currentValue = list[segment.ArrayIndex.Value];
                        
                        // AUTOMATIC ELEMENT INITIALIZATION: Initialize null collection elements
                        if (currentValue == null && pathSegments.Count > 1)
                        {
                            var elementType = GetCollectionElementType(list.GetType());
                            if (elementType != null)
                            {
                                currentValue = TryCreatePropertyInstance(elementType);
                                if (currentValue != null)
                                {
                                    try
                                    {
                                        list[segment.ArrayIndex.Value] = currentValue;
                                    }
                                    catch
                                    {
                                        return false;
                                    }
                                }
                                else
                                {
                                    return false;
                                }
                            }
                        }
                    }
                    else
                    {
                        return false; // Index out of bounds
                    }
                }
                else if (currentValue is System.Collections.IEnumerable enumerable)
                {
                    // Handle IEnumerable (like Collection<T>) - read-only access
                    var items = enumerable.Cast<object>().ToList();
                    if (segment.ArrayIndex.Value >= 0 && segment.ArrayIndex.Value < items.Count)
                    {
                        currentValue = items[segment.ArrayIndex.Value];
                        // Note: IEnumerable is read-only, so we can't initialize null elements
                    }
                    else
                    {
                        return false; // Index out of bounds
                    }
                }
                else
                {
                    return false; // Not a collection
                }
            }

            // Continue recursively
            return SetPropertyValueRecursive(currentValue, pathSegments.Skip(1).ToList(), value);
        }

        /// <summary>
        /// Try to create an instance of the specified type for automatic property initialization
        /// Supports various collection types, nullable types, and complex objects
        /// </summary>
        private object TryCreatePropertyInstance(Type propertyType)
        {
            try
            {
                // Skip value types that can't be null (except Nullable<T>)
                if (propertyType.IsValueType && Nullable.GetUnderlyingType(propertyType) == null)
                    return null;

                // Skip abstract classes and interfaces
                if (propertyType.IsAbstract || propertyType.IsInterface)
                    return null;

                // Skip primitive types and strings
                if (propertyType.IsPrimitive || propertyType == typeof(string))
                    return null;

                // Handle DateTime specially - initialize with current time
                if (propertyType == typeof(DateTime) || propertyType == typeof(DateTime?))
                    return null; // Let it remain null initially

                // Handle decimal and other common value types
                if (propertyType == typeof(decimal) || propertyType == typeof(decimal?) ||
                    propertyType == typeof(double) || propertyType == typeof(double?) ||
                    propertyType == typeof(float) || propertyType == typeof(float?) ||
                    propertyType == typeof(int) || propertyType == typeof(int?) ||
                    propertyType == typeof(long) || propertyType == typeof(long?) ||
                    propertyType == typeof(bool) || propertyType == typeof(bool?))
                    return null; // Let value types remain at default values

                // Handle array types
                if (propertyType.IsArray)
                {
                    var elementType = propertyType.GetElementType();
                    if (elementType != null)
                    {
                        // Create empty array
                        return Array.CreateInstance(elementType, 0);
                    }
                }

                // Handle generic collections first
                if (propertyType.IsGenericType)
                {
                    var genericTypeDefinition = propertyType.GetGenericTypeDefinition();
                    var genericArgs = propertyType.GetGenericArguments();

                    // Handle various collection interfaces by creating concrete implementations
                    if (genericTypeDefinition == typeof(IList<>) || 
                        genericTypeDefinition == typeof(ICollection<>) || 
                        genericTypeDefinition == typeof(IEnumerable<>))
                    {
                        var listType = typeof(List<>).MakeGenericType(genericArgs);
                        return Activator.CreateInstance(listType);
                    }

                    // Handle List<T>
                    if (genericTypeDefinition == typeof(List<>))
                    {
                        return Activator.CreateInstance(propertyType);
                    }

                    // Handle Collection<T>
                    if (genericTypeDefinition == typeof(System.Collections.ObjectModel.Collection<>))
                    {
                        return Activator.CreateInstance(propertyType);
                    }

                    // Handle ObservableCollection<T>
                    if (genericTypeDefinition == typeof(System.Collections.ObjectModel.ObservableCollection<>))
                    {
                        return Activator.CreateInstance(propertyType);
                    }

                    // Handle HashSet<T>
                    if (genericTypeDefinition == typeof(HashSet<>))
                    {
                        return Activator.CreateInstance(propertyType);
                    }

                    // Handle Dictionary<TKey, TValue>
                    if (genericTypeDefinition == typeof(Dictionary<,>) || 
                        genericTypeDefinition == typeof(IDictionary<,>))
                    {
                        var dictType = typeof(Dictionary<,>).MakeGenericType(genericArgs);
                        return Activator.CreateInstance(dictType);
                    }

                    // Handle Nullable<T>
                    if (genericTypeDefinition == typeof(Nullable<>))
                    {
                        return null; // Keep nullable types as null initially
                    }
                }

                // Handle non-generic IList (like ArrayList)
                if (typeof(System.Collections.IList).IsAssignableFrom(propertyType) && 
                    !propertyType.IsAbstract && propertyType.GetConstructor(Type.EmptyTypes) != null)
                {
                    return Activator.CreateInstance(propertyType);
                }

                // Try to create instance using parameterless constructor
                if (propertyType.GetConstructor(Type.EmptyTypes) != null)
                {
                    return Activator.CreateInstance(propertyType);
                }

                // Fallback: try direct instantiation
                return Activator.CreateInstance(propertyType);
            }
            catch
            {
                // If instance creation fails, return null
                return null;
            }
        }

        /// <summary>
        /// Initialize a collection property with a specified number of elements
        /// Usage: navigator.InitializeCollectionProperty(instance, "Orders", 3)
        /// </summary>
        public bool InitializeCollectionProperty(object instance, string propertyPath, int elementCount)
        {
            if (instance == null || elementCount < 0)
                return false;

            var pathInfo = ParsePropertyPath(propertyPath);
            if (pathInfo.PathSegments.Count == 0)
                return false;

            try
            {
                var currentValue = GetPropertyValueRecursive(instance, pathInfo.PathSegments);
                if (currentValue is System.Collections.IList list)
                {
                    var elementType = GetCollectionElementType(list.GetType());
                    if (elementType != null)
                    {
                        // Clear existing elements and add new ones
                        list.Clear();
                        for (int i = 0; i < elementCount; i++)
                        {
                            var element = TryCreatePropertyInstance(elementType);
                            list.Add(element);
                        }
                        return true;
                    }
                }
                
                return false;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Ensure a collection has at least the specified number of elements
        /// Usage: navigator.EnsureCollectionSize(instance, "Orders", 5)
        /// </summary>
        public bool EnsureCollectionSize(object instance, string propertyPath, int minimumSize)
        {
            if (instance == null || minimumSize < 0)
                return false;

            var pathInfo = ParsePropertyPath(propertyPath);
            if (pathInfo.PathSegments.Count == 0)
                return false;

            try
            {
                var currentValue = GetPropertyValueRecursive(instance, pathInfo.PathSegments);
                if (currentValue is System.Collections.IList list)
                {
                    var elementType = GetCollectionElementType(list.GetType());
                    if (elementType != null)
                    {
                        // Add elements until we reach minimum size
                        while (list.Count < minimumSize)
                        {
                            var element = TryCreatePropertyInstance(elementType);
                            list.Add(element);
                        }
                        return true;
                    }
                }
                
                return false;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Get the element type of a collection type
        /// </summary>
        private Type GetCollectionElementType(Type collectionType)
        {
            try
            {
                // For generic collections
                if (collectionType.IsGenericType)
                {
                    var genericArgs = collectionType.GetGenericArguments();
                    if (genericArgs.Length > 0)
                        return genericArgs[0];
                }

                // For array types
                if (collectionType.IsArray)
                {
                    return collectionType.GetElementType();
                }

                // For non-generic IList (fallback)
                if (typeof(System.Collections.IList).IsAssignableFrom(collectionType))
                {
                    return typeof(object);
                }

                return null;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Initialize all null properties in an object instance automatically
        /// Recursively initializes complex objects and collections
        /// Usage: navigator.InitializeAllProperties(instance)
        /// Usage: navigator.InitializeAllProperties(instance, maxDepth: 3)
        /// </summary>
        public bool InitializeAllProperties(object instance, int maxDepth = 5, int currentDepth = 0)
        {
            if (instance == null || currentDepth >= maxDepth)
                return false;

            try
            {
                var instanceType = instance.GetType();
                var properties = instanceType.GetProperties();

                foreach (var property in properties)
                {
                    if (!property.CanWrite || !property.CanRead)
                        continue;

                    var currentValue = property.GetValue(instance);
                    
                    // Initialize null properties
                    if (currentValue == null)
                    {
                        var newValue = TryCreatePropertyInstance(property.PropertyType);
                        if (newValue != null)
                        {
                            try
                            {
                                property.SetValue(instance, newValue);
                                currentValue = newValue;
                            }
                            catch
                            {
                                continue; // Skip if setting fails
                            }
                        }
                    }

                    // Recursively initialize complex properties
                    if (currentValue != null && !IsSimpleType(property.PropertyType))
                    {
                        // Handle collections
                        if (currentValue is System.Collections.IList list)
                        {
                            var elementType = GetCollectionElementType(list.GetType());
                            if (elementType != null && !IsSimpleType(elementType))
                            {
                                for (int i = 0; i < list.Count; i++)
                                {
                                    var listItem = list[i];
                                    if (listItem != null)
                                    {
                                        InitializeAllProperties(listItem, maxDepth, currentDepth + 1);
                                    }
                                }
                            }
                        }
                        // Handle complex objects
                        else if (!property.PropertyType.IsValueType && 
                                property.PropertyType != typeof(string))
                        {
                            InitializeAllProperties(currentValue, maxDepth, currentDepth + 1);
                        }
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Check if a type is a simple type (primitive, string, DateTime, etc.)
        /// </summary>
        private bool IsSimpleType(Type type)
        {
            return type.IsPrimitive ||
                   type == typeof(string) ||
                   type == typeof(DateTime) ||
                   type == typeof(DateTime?) ||
                   type == typeof(decimal) ||
                   type == typeof(decimal?) ||
                   type == typeof(Guid) ||
                   type == typeof(Guid?) ||
                   type.IsEnum ||
                   (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>) &&
                    IsSimpleType(Nullable.GetUnderlyingType(type)));
        }

        /// <summary>
        /// Get or create a nested property instance with automatic initialization
        /// Usage: var address = navigator.GetOrCreateProperty(customer, "Address")
        /// </summary>
        public object GetOrCreateProperty(object instance, string propertyName)
        {
            if (instance == null || string.IsNullOrEmpty(propertyName))
                return null;

            try
            {
                var instanceType = instance.GetType();
                var property = instanceType.GetProperty(propertyName);
                
                if (property == null || !property.CanRead)
                    return null;

                var currentValue = property.GetValue(instance);
                
                // If null and property can be written, try to create instance
                if (currentValue == null && property.CanWrite)
                {
                    var newValue = TryCreatePropertyInstance(property.PropertyType);
                    if (newValue != null)
                    {
                        try
                        {
                            property.SetValue(instance, newValue);
                            return newValue;
                        }
                        catch
                        {
                            return null;
                        }
                    }
                }

                return currentValue;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Serialize an object instance to schema-valid XML
        /// Usage: navigator.SerializeToXml(instance)
        /// Usage: navigator.SerializeToXml(instance, "CustomRootElement")
        /// </summary>
        public string SerializeToXml(object instance, string rootElementName = null)
        {
            if (instance == null)
                return null;

            try
            {
                var instanceType = instance.GetType();
                var serializer = new System.Xml.Serialization.XmlSerializer(instanceType, rootElementName);
                
                using (var writer = new System.IO.StringWriter())
                {
                    var settings = new System.Xml.XmlWriterSettings
                    {
                        Indent = true,
                        IndentChars = "  ",
                        OmitXmlDeclaration = false,
                        Encoding = System.Text.Encoding.UTF8
                    };
                    
                    using (var xmlWriter = System.Xml.XmlWriter.Create(writer, settings))
                    {
                        serializer.Serialize(xmlWriter, instance);
                    }
                    
                    return writer.ToString();
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to serialize object to XML: {ex.Message}", ex);
            }
        }

        /// <summary>
        /// Serialize an object instance to schema-valid XML with custom namespaces
        /// Usage: navigator.SerializeToXmlWithNamespaces(instance, namespaces)
        /// </summary>
        public string SerializeToXmlWithNamespaces(object instance, System.Xml.Serialization.XmlSerializerNamespaces namespaces = null)
        {
            if (instance == null)
                return null;

            try
            {
                var instanceType = instance.GetType();
                var serializer = new System.Xml.Serialization.XmlSerializer(instanceType);

                using (var writer = new System.IO.StringWriter())
                {
                    var settings = new System.Xml.XmlWriterSettings
                    {
                        Indent = true,
                        IndentChars = "  ",
                        OmitXmlDeclaration = false,
                        Encoding = System.Text.Encoding.UTF8
                    };

                    using (var xmlWriter = System.Xml.XmlWriter.Create(writer, settings))
                    {
                        if (namespaces != null)
                        {
                            serializer.Serialize(xmlWriter, instance, namespaces);
                        }
                        else
                        {
                            serializer.Serialize(xmlWriter, instance);
                        }
                    }

                    return writer.ToString();
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to serialize object to XML: {ex.Message}", ex);
            }
        }

        /// <summary>
        /// Deserialize XML string to object instance
        /// Usage: navigator.DeserializeFromXml<S071Type>(xmlString)
        /// </summary>
        public T DeserializeFromXml<T>(string xml)
        {
            if (string.IsNullOrEmpty(xml))
                return default(T);

            try
            {
                var serializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                
                using (var reader = new System.IO.StringReader(xml))
                {
                    return (T)serializer.Deserialize(reader);
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to deserialize XML to object: {ex.Message}", ex);
            }
        }

        /// <summary>
        /// Deserialize XML string to object instance of specified type
        /// Usage: navigator.DeserializeFromXml(xmlString, typeof(S071Type))
        /// </summary>
        public object DeserializeFromXml(string xml, Type targetType)
        {
            if (string.IsNullOrEmpty(xml) || targetType == null)
                return null;

            try
            {
                var serializer = new System.Xml.Serialization.XmlSerializer(targetType);
                
                using (var reader = new System.IO.StringReader(xml))
                {
                    return serializer.Deserialize(reader);
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to deserialize XML to object: {ex.Message}", ex);
            }
        }

        /// <summary>
        /// Validate XML against the original XSD schema
        /// Usage: navigator.ValidateXmlAgainstSchema(xmlString, xsdFilePath)
        /// </summary>
        public XmlValidationResult ValidateXmlAgainstSchema(string xml, string xsdFilePath)
        {
            var result = new XmlValidationResult { IsValid = true };
            
            if (string.IsNullOrEmpty(xml) || !System.IO.File.Exists(xsdFilePath))
            {
                result.IsValid = false;
                result.Errors.Add("XML string is empty or XSD file not found");
                return result;
            }

            try
            {
                var schemaSet = new System.Xml.Schema.XmlSchemaSet();
                
                // Read the XSD file and add to schema set
                using (var schemaReader = System.Xml.XmlReader.Create(xsdFilePath))
                {
                    var schema = System.Xml.Schema.XmlSchema.Read(schemaReader, null);
                    if (schema?.TargetNamespace != null)
                    {
                        schemaSet.Add(schema);
                    }
                    else
                    {
                        schemaSet.Add("", xsdFilePath);
                    }
                }
                
                schemaSet.Compile();
                
                var settings = new System.Xml.XmlReaderSettings
                {
                    ValidationType = System.Xml.ValidationType.Schema,
                    Schemas = schemaSet
                };
                
                settings.ValidationEventHandler += (sender, e) =>
                {
                    result.IsValid = false;
                    if (e.Severity == System.Xml.Schema.XmlSeverityType.Error)
                    {
                        result.Errors.Add(e.Message);
                    }
                    else
                    {
                        result.Warnings.Add(e.Message);
                    }
                };

                using (var reader = System.Xml.XmlReader.Create(new System.IO.StringReader(xml), settings))
                {
                    while (reader.Read()) { }
                }
            }
            catch (Exception ex)
            {
                result.IsValid = false;
                result.Errors.Add($"Validation error: {ex.Message}");
            }

            return result;
        }

        /// <summary>
        /// Create a minimal valid XML instance for a given type
        /// Usage: navigator.CreateMinimalXmlInstance("S071Type")
        /// </summary>
        public string CreateMinimalXmlInstance(string typeName)
        {
            var typeModel = SelectType(typeName);
            if (typeModel is not ClassModel classModel)
                return null;

            try
            {
                // This would require runtime type generation, which is complex
                // For now, return a basic template
                var rootElement = typeModel.XmlSchemaName?.Name ?? typeName;
                var xmlNamespace = typeModel.XmlSchemaName?.Namespace;
                
                var sb = new System.Text.StringBuilder();
                sb.AppendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                
                if (!string.IsNullOrEmpty(xmlNamespace))
                {
                    sb.AppendLine($"<{rootElement} xmlns=\"{xmlNamespace}\">");
                }
                else
                {
                    sb.AppendLine($"<{rootElement}>");
                }

                // Add required properties as empty elements
                foreach (var property in classModel.Properties.Where(p => p.IsRequired))
                {
                    var elementName = property.XmlSchemaName?.Name ?? property.Name;
                    sb.AppendLine($"  <{elementName}></{elementName}>");
                }

                sb.AppendLine($"</{rootElement}>");
                
                return sb.ToString();
            }
            catch
            {
                return null;
            }
        }
    }

    /// <summary>
    /// Provides instance-level navigation and property manipulation
    /// </summary>
    public class XsdInstanceNavigator
    {
        private readonly ClassModel _typeModel;
        private readonly XsdTypeNavigator _navigator;
        private readonly Dictionary<string, object> _properties = new Dictionary<string, object>();

        internal XsdInstanceNavigator(ClassModel typeModel, XsdTypeNavigator navigator)
        {
            _typeModel = typeModel;
            _navigator = navigator;
        }

        /// <summary>
        /// Set a property value
        /// Usage: instance.SetProperty("Name", "John Doe")
        /// Usage: instance.SetProperty("Address/Street", "Main St")
        /// </summary>
        public void SetProperty(string propertyPath, object value)
        {
            var property = _navigator.SelectProperty($"{_typeModel.Name}/{propertyPath}");
            if (property == null)
                throw new ArgumentException($"Property '{propertyPath}' not found in type '{_typeModel.Name}'");

            _properties[propertyPath] = value;
        }

        /// <summary>
        /// Get a property value
        /// Usage: var name = instance.GetProperty("Name")
        /// Usage: var street = instance.GetProperty("Address/Street")
        /// </summary>
        public object GetProperty(string propertyPath)
        {
            return _properties.TryGetValue(propertyPath, out var value) ? value : null;
        }

        /// <summary>
        /// Get all set properties
        /// </summary>
        public Dictionary<string, object> GetAllProperties()
        {
            return new Dictionary<string, object>(_properties);
        }

        /// <summary>
        /// Check if a property is required
        /// </summary>
        public bool IsPropertyRequired(string propertyPath)
        {
            var property = _navigator.SelectProperty($"{_typeModel.Name}/{propertyPath}");
            return property?.IsRequired ?? false;
        }

        /// <summary>
        /// Get property type information
        /// </summary>
        public string GetPropertyTypeName(string propertyPath)
        {
            var property = _navigator.SelectProperty($"{_typeModel.Name}/{propertyPath}");
            return property?.Type?.Name;
        }

        /// <summary>
        /// Validate instance against XSD constraints
        /// </summary>
        public ValidationResult Validate()
        {
            var result = new ValidationResult();
            
            foreach (var property in _typeModel.Properties)
            {
                if (property.IsRequired && !_properties.ContainsKey(property.Name))
                {
                    result.Errors.Add($"Required property '{property.Name}' is missing");
                }
            }

            return result;
        }
    }

    /// <summary>
    /// Metadata information about an XSD type
    /// </summary>
    public class XsdTypeMetadata
    {
        public string Name { get; set; }
        public XmlQualifiedName XmlSchemaName { get; set; }
        public string Namespace { get; set; }
        public string XmlNamespace { get; set; }
        public List<string> Documentation { get; set; } = new List<string>();
        public bool IsAnonymous { get; set; }
        public bool IsAbstract { get; set; }
        public string BaseTypeName { get; set; }
    }

    /// <summary>
    /// Validation result for XSD instance validation
    /// </summary>
    public class ValidationResult
    {
        public List<string> Errors { get; set; } = new List<string>();
        public List<string> Warnings { get; set; } = new List<string>();
        public bool IsValid => Errors.Count == 0;
    }

    /// <summary>
    /// Result of XML validation against XSD schema
    /// </summary>
    public class XmlValidationResult
    {
        public bool IsValid { get; set; } = true;
        public List<string> Errors { get; set; } = new List<string>();
        public List<string> Warnings { get; set; } = new List<string>();
        
        public override string ToString()
        {
            if (IsValid)
                return "Valid XML";
            
            var errorCount = Errors.Count;
            var warningCount = Warnings.Count;
            return $"Invalid XML: {errorCount} error(s), {warningCount} warning(s)";
        }
    }

    /// <summary>
    /// Represents a property path segment with optional array index
    /// Examples: "Person", "Person[0]", "Orders[2]"
    /// </summary>
    public class PropertyPathSegment
    {
        public string PropertyName { get; set; }
        public int? ArrayIndex { get; set; }
        public bool IsArray => ArrayIndex.HasValue;

        public override string ToString()
        {
            return IsArray ? $"{PropertyName}[{ArrayIndex}]" : PropertyName;
        }
    }

    /// <summary>
    /// Parsed property path information
    /// </summary>
    public class PropertyPathInfo
    {
        public List<PropertyPathSegment> PathSegments { get; set; } = new List<PropertyPathSegment>();
        public string OriginalPath { get; set; }

        public override string ToString()
        {
            return string.Join(".", PathSegments.Select(s => s.ToString()));
        }
    }
}