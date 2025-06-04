using System.Xml;
using System.Xml.Schema;

namespace XmlSchemaClassGenerator;

public interface IQualifiedNameResolver
{
    XmlQualifiedName Resolve(
        TypeModel typeModel,
        XmlSchemaParticle xmlParticle,
        XmlSchemaElementEx element);
}