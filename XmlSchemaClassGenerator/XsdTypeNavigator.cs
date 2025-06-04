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
}