using System;
using System.Collections;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Xml.Linq;
using System.Xml.XPath;

namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Helper-Klasse für den Zugriff auf dynamisch generierte Properties
    /// </summary>
    public class DynamicPropertyHelper
    {
        private readonly object _instance;
        private readonly Type _type;
        private readonly Dictionary<string, PropertyInfo> _propertyCache;

        public DynamicPropertyHelper(object instance)
        {
            _instance = instance ?? throw new ArgumentNullException(nameof(instance));
            _type = instance.GetType();
            _propertyCache = _type.GetProperties().ToDictionary(p => p.Name, p => p);
        }

        /// <summary>
        /// Greift auf eine Property über einen XPath-ähnlichen Pfad zu
        /// Beispiel: "Person/Address/Street" oder "Person.Address.Street"
        /// </summary>
        public object GetValueByPath(string path)
        {
            if (string.IsNullOrEmpty(path))
                return _instance;

            var parts = path.Split(new[] { '/', '.' }, StringSplitOptions.RemoveEmptyEntries);
            object current = _instance;

            foreach (var part in parts)
            {
                if (current == null)
                    return null;

                // Handle array/list access like "PhoneNumbers[0]"
                var match = System.Text.RegularExpressions.Regex.Match(part, @"^(\w+)\[(\d+)\]$");
                if (match.Success)
                {
                    var propName = match.Groups[1].Value;
                    var index = int.Parse(match.Groups[2].Value);
                    
                    var prop = current.GetType().GetProperty(propName);
                    if (prop != null)
                    {
                        var value = prop.GetValue(current);
                        if (value is IList list && index < list.Count)
                        {
                            current = list[index];
                            continue;
                        }
                    }
                }

                // Normal property access
                var property = current.GetType().GetProperty(part);
                if (property != null)
                {
                    current = property.GetValue(current);
                }
                else
                {
                    throw new ArgumentException($"Property '{part}' not found in type '{current.GetType().Name}'");
                }
            }

            return current;
        }

        /// <summary>
        /// Setzt einen Wert über einen XPath-ähnlichen Pfad
        /// </summary>
        public void SetValueByPath(string path, object value)
        {
            var parts = path.Split(new[] { '/', '.' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 0)
                return;

            object current = _instance;
            PropertyInfo lastProperty = null;
            object lastObject = null;

            for (int i = 0; i < parts.Length - 1; i++)
            {
                var property = current.GetType().GetProperty(parts[i]);
                if (property == null)
                    throw new ArgumentException($"Property '{parts[i]}' not found");

                lastObject = current;
                current = property.GetValue(current);
                
                // Create instance if null
                if (current == null && property.CanWrite)
                {
                    current = Activator.CreateInstance(property.PropertyType);
                    property.SetValue(lastObject, current);
                }
            }

            // Set the final property
            lastProperty = current.GetType().GetProperty(parts[parts.Length - 1]);
            if (lastProperty != null && lastProperty.CanWrite)
            {
                lastProperty.SetValue(current, value);
            }
        }

        /// <summary>
        /// Gibt alle Properties als Dictionary zurück
        /// </summary>
        public Dictionary<string, object> ToDictionary(bool includeNested = true)
        {
            return ObjectToDictionary(_instance, includeNested);
        }

        private Dictionary<string, object> ObjectToDictionary(object obj, bool includeNested)
        {
            if (obj == null)
                return null;

            var dict = new Dictionary<string, object>();
            var type = obj.GetType();

            foreach (var prop in type.GetProperties())
            {
                var value = prop.GetValue(obj);
                
                if (value == null)
                {
                    dict[prop.Name] = null;
                }
                else if (IsSimpleType(prop.PropertyType))
                {
                    dict[prop.Name] = value;
                }
                else if (value is IList list)
                {
                    var listItems = new List<object>();
                    foreach (var item in list)
                    {
                        if (includeNested && !IsSimpleType(item.GetType()))
                        {
                            listItems.Add(ObjectToDictionary(item, includeNested));
                        }
                        else
                        {
                            listItems.Add(item);
                        }
                    }
                    dict[prop.Name] = listItems;
                }
                else if (includeNested)
                {
                    dict[prop.Name] = ObjectToDictionary(value, includeNested);
                }
                else
                {
                    dict[prop.Name] = value;
                }
            }

            return dict;
        }

        /// <summary>
        /// Sucht Properties nach einem Muster
        /// </summary>
        public IEnumerable<PropertyInfo> FindProperties(Func<PropertyInfo, bool> predicate)
        {
            return _type.GetProperties().Where(predicate);
        }

        /// <summary>
        /// Gibt eine dynamische Ansicht des Objekts zurück
        /// </summary>
        public dynamic AsDynamic()
        {
            return new DynamicWrapper(_instance);
        }

        /// <summary>
        /// Erstellt einen typsicheren Accessor mit Lambda-Expressions
        /// </summary>
        public PropertyAccessor<T> CreateAccessor<T>(string propertyName)
        {
            return new PropertyAccessor<T>(_instance, propertyName);
        }

        private bool IsSimpleType(Type type)
        {
            return type.IsPrimitive 
                || type.IsEnum 
                || type == typeof(string) 
                || type == typeof(DateTime) 
                || type == typeof(DateTimeOffset)
                || type == typeof(TimeSpan)
                || type == typeof(Guid)
                || type == typeof(decimal);
        }

        /// <summary>
        /// Dynamischer Wrapper für einfacheren Zugriff
        /// </summary>
        private class DynamicWrapper : DynamicObject
        {
            private readonly object _instance;
            private readonly Type _type;

            public DynamicWrapper(object instance)
            {
                _instance = instance;
                _type = instance.GetType();
            }

            public override bool TryGetMember(GetMemberBinder binder, out object result)
            {
                var property = _type.GetProperty(binder.Name);
                if (property != null)
                {
                    result = property.GetValue(_instance);
                    return true;
                }

                result = null;
                return false;
            }

            public override bool TrySetMember(SetMemberBinder binder, object value)
            {
                var property = _type.GetProperty(binder.Name);
                if (property != null && property.CanWrite)
                {
                    property.SetValue(_instance, value);
                    return true;
                }

                return false;
            }
        }
    }

    /// <summary>
    /// Typsicherer Property-Accessor mit kompilierten Expressions für bessere Performance
    /// </summary>
    public class PropertyAccessor<T>
    {
        private readonly Func<object, T> _getter;
        private readonly Action<object, T> _setter;
        private readonly PropertyInfo _propertyInfo;

        public PropertyAccessor(object instance, string propertyName)
        {
            var type = instance.GetType();
            _propertyInfo = type.GetProperty(propertyName) 
                ?? throw new ArgumentException($"Property '{propertyName}' not found");

            // Compile getter
            var param = Expression.Parameter(typeof(object), "obj");
            var cast = Expression.Convert(param, type);
            var propertyAccess = Expression.Property(cast, _propertyInfo);
            var convert = Expression.Convert(propertyAccess, typeof(T));
            _getter = Expression.Lambda<Func<object, T>>(convert, param).Compile();

            // Compile setter if writable
            if (_propertyInfo.CanWrite)
            {
                var valueParam = Expression.Parameter(typeof(T), "value");
                var assign = Expression.Assign(propertyAccess, Expression.Convert(valueParam, _propertyInfo.PropertyType));
                _setter = Expression.Lambda<Action<object, T>>(assign, param, valueParam).Compile();
            }
        }

        public T GetValue(object instance) => _getter(instance);

        public void SetValue(object instance, T value)
        {
            if (_setter == null)
                throw new InvalidOperationException($"Property '{_propertyInfo.Name}' is read-only");
            
            _setter(instance, value);
        }
    }

    /// <summary>
    /// XPath-basierter Navigator für XML-serialisierte Objekte
    /// </summary>
    public class XmlPropertyNavigator
    {
        private readonly XDocument _document;
        private readonly object _instance;
        private readonly Type _type;

        public XmlPropertyNavigator(object instance)
        {
            _instance = instance;
            _type = instance.GetType();
            
            // Serialize to XML for XPath navigation
            var factory = new XsdToCSharpFactory();
            var xml = factory.SerializeToXml(instance);
            _document = XDocument.Parse(xml);
        }

        /// <summary>
        /// Führt eine XPath-Abfrage aus und gibt die Werte zurück
        /// </summary>
        public IEnumerable<string> SelectValues(string xpath)
        {
            return _document.XPathSelectElements(xpath)
                .Select(e => e.Value);
        }

        /// <summary>
        /// Führt eine XPath-Abfrage aus und gibt das erste Ergebnis zurück
        /// </summary>
        public string SelectSingleValue(string xpath)
        {
            return _document.XPathSelectElement(xpath)?.Value;
        }

        /// <summary>
        /// Aktualisiert einen Wert über XPath und synchronisiert mit dem Objekt
        /// </summary>
        public void UpdateValue(string xpath, string newValue)
        {
            var element = _document.XPathSelectElement(xpath);
            if (element != null)
            {
                element.Value = newValue;
                // Hier müsste die Rück-Synchronisierung implementiert werden
            }
        }
    }

    /// <summary>
    /// Fluent API für Property-Zugriff
    /// </summary>
    public class FluentPropertyAccessor
    {
        private object _current;
        private readonly Stack<object> _path = new Stack<object>();

        public FluentPropertyAccessor(object root)
        {
            _current = root ?? throw new ArgumentNullException(nameof(root));
        }

        public FluentPropertyAccessor Navigate(string propertyName)
        {
            if (_current == null)
                throw new InvalidOperationException("Cannot navigate from null object");

            var property = _current.GetType().GetProperty(propertyName);
            if (property == null)
                throw new ArgumentException($"Property '{propertyName}' not found");

            _path.Push(_current);
            _current = property.GetValue(_current);
            
            return this;
        }

        public FluentPropertyAccessor NavigateList(string propertyName, int index)
        {
            Navigate(propertyName);
            
            if (_current is IList list && index < list.Count)
            {
                _path.Push(_current);
                _current = list[index];
            }
            else
            {
                throw new ArgumentException($"Invalid list access at '{propertyName}[{index}]'");
            }
            
            return this;
        }

        public T GetValue<T>()
        {
            if (_current == null)
                return default(T);
            
            return (T)Convert.ChangeType(_current, typeof(T));
        }

        public object GetValue()
        {
            return _current;
        }

        public FluentPropertyAccessor SetValue(object value)
        {
            if (_path.Count == 0)
                throw new InvalidOperationException("Cannot set value on root object");

            var parent = _path.Peek();
            var currentType = _current?.GetType() ?? value?.GetType();
            
            if (currentType != null)
            {
                var property = parent.GetType().GetProperties()
                    .FirstOrDefault(p => p.PropertyType == currentType);
                
                if (property != null && property.CanWrite)
                {
                    property.SetValue(parent, value);
                    _current = value;
                }
            }
            
            return this;
        }

        public FluentPropertyAccessor Back()
        {
            if (_path.Count > 0)
            {
                _current = _path.Pop();
            }
            return this;
        }

        public FluentPropertyAccessor Root()
        {
            while (_path.Count > 1)
            {
                _path.Pop();
            }
            
            if (_path.Count == 1)
            {
                _current = _path.Pop();
            }
            
            return this;
        }
    }
}