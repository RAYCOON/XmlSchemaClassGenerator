using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using XmlSchemaClassGenerator;

namespace XmlSchemaClassGenerator.BatchConverter.Services
{
    public class CustomFileOutputWriter : FileOutputWriter
    {
        private readonly Dictionary<string, string> _namespaceToFileNameMappings;
        private readonly bool _appendDesignerSuffix;

        public CustomFileOutputWriter(string directory, Dictionary<string, string> namespaceToFileNameMappings = null, bool appendDesignerSuffix = true, bool createIfNotExists = true) 
            : base(directory, createIfNotExists)
        {
            _namespaceToFileNameMappings = namespaceToFileNameMappings ?? new Dictionary<string, string>();
            _appendDesignerSuffix = appendDesignerSuffix;
        }

        public override void Write(CodeNamespace cn)
        {
            var cu = new CodeCompileUnit();
            cu.Namespaces.Add(cn);

            // Check if we have a custom filename mapping for this namespace
            if (_namespaceToFileNameMappings.TryGetValue(cn.Name, out var customFileName))
            {
                var fileName = _appendDesignerSuffix && !customFileName.EndsWith(".Designer") 
                    ? customFileName + ".Designer.cs" 
                    : customFileName + ".cs";
                    
                var path = Path.Combine(OutputDirectory, fileName);
                Configuration?.WriteLog(path);
                WriteFile(path, cu);
            }
            else if (Configuration?.SeparateClasses == true || Configuration?.SeparateNamespaceHierarchy == true)
            {
                // Fall back to base implementation for separate files
                base.Write(cn);
            }
            else
            {
                // Default behavior - use namespace name as filename
                var path = Path.Combine(OutputDirectory, cn.Name + ".cs");
                Configuration?.WriteLog(path);
                WriteFile(path, cu);
            }
        }
    }
}