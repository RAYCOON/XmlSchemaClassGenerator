namespace XmlSchemaClassGenerator
{
    /// <summary>
    /// Represents a validation error found when validating an object instance against XSD schema requirements.
    /// </summary>
    public class XsdValidationError
    {
        /// <summary>
        /// The property path where the validation error occurred (e.g., "Customer.Orders[0].Total").
        /// </summary>
        public string PropertyPath { get; set; }

        /// <summary>
        /// Human-readable description of the validation error.
        /// </summary>
        public string ErrorMessage { get; set; }

        /// <summary>
        /// The type of validation error that occurred.
        /// </summary>
        public XsdValidationErrorType ErrorType { get; set; }

        /// <summary>
        /// Additional context information about the error (optional).
        /// </summary>
        public string Context { get; set; }

        public override string ToString()
        {
            return $"{ErrorType} at '{PropertyPath}': {ErrorMessage}";
        }
    }

    /// <summary>
    /// Enumeration of different types of XSD validation errors.
    /// </summary>
    public enum XsdValidationErrorType
    {
        /// <summary>
        /// A required property is missing or empty.
        /// </summary>
        Required,

        /// <summary>
        /// A property value doesn't match the expected data type.
        /// </summary>
        DataType,

        /// <summary>
        /// A property value doesn't meet length constraints.
        /// </summary>
        Length,

        /// <summary>
        /// A property value doesn't match a required pattern (regex).
        /// </summary>
        Pattern,

        /// <summary>
        /// A property value is outside the allowed range.
        /// </summary>
        Range,

        /// <summary>
        /// A collection has too few or too many items.
        /// </summary>
        Cardinality,

        /// <summary>
        /// A general validation error that doesn't fit other categories.
        /// </summary>
        General
    }
}