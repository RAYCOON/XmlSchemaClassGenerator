# Schemas Directory

Place your XSD files here for batch conversion.

## Directory Structure

```
schemas/
├── README.md (this file)
├── example-simple.xsd
├── example-with-choice.xsd
└── your-schemas/
    ├── schema1.xsd
    ├── schema2.xsd
    └── ...
```

## Usage

Reference these files in your batch configuration:

```json
{
  "schemas": [
    {
      "name": "Simple Example",
      "sourcePath": "schemas/example-simple.xsd"
    },
    {
      "name": "Complex Schema",
      "sourcePath": "schemas/your-schemas/schema1.xsd"
    }
  ]
}
```