using System;

namespace XmlSchemaClassGenerator.Examples
{
    /// <summary>
    /// Main program for running XmlSchemaClassGenerator examples
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("🚀 XmlSchemaClassGenerator Examples");
            Console.WriteLine("=====================================\n");

            if (args.Length > 0)
            {
                // Run specific example
                var example = args[0].ToLowerInvariant();
                RunSpecificExample(example);
            }
            else
            {
                // Run all examples
                RunAllExamples();
            }

            Console.WriteLine("\n✅ Examples completed!");
        }

        private static void RunAllExamples()
        {
            Console.WriteLine("Running available examples:\n");

            try
            {
                Console.WriteLine("1. 🔧 Simple Example");
                Console.WriteLine("   Basic XsdToCSharpFactory and XsdTypeNavigator usage");
                SimpleExample.Run();
                
                Console.WriteLine("\n" + new string('=', 80) + "\n");

                Console.WriteLine("2. ⚡ Auto Property Initialization Example");
                Console.WriteLine("   Demonstrates automatic property initialization features");
                AutoPropertyInitializationExample.Run();
                
                Console.WriteLine("\n" + new string('=', 80) + "\n");

                Console.WriteLine("Note: Some advanced examples require runtime compilation");
                Console.WriteLine("and may not work in all environments. The simple examples");
                Console.WriteLine("above demonstrate the core XsdTypeNavigator functionality.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error running examples: {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");
            }
        }

        private static void RunSpecificExample(string example)
        {
            Console.WriteLine($"Running specific example: {example}\n");

            try
            {
                switch (example)
                {
                    case "simple":
                    case "1":
                        SimpleExample.Run();
                        break;

                    case "auto":
                    case "autoprop":
                    case "initialization":
                    case "2":
                        AutoPropertyInitializationExample.Run();
                        break;

                    default:
                        Console.WriteLine($"❌ Unknown example: {example}");
                        ShowUsage();
                        break;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error running example '{example}': {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");
            }
        }

        private static void ShowUsage()
        {
            Console.WriteLine("Usage:");
            Console.WriteLine("  XmlSchemaClassGenerator.Examples.exe              # Run all examples");
            Console.WriteLine("  XmlSchemaClassGenerator.Examples.exe [example]   # Run specific example");
            Console.WriteLine();
            Console.WriteLine("Available examples:");
            Console.WriteLine("  1, simple                - Simple XsdToCSharpFactory Example");
            Console.WriteLine("  2, auto, autoprop        - Auto Property Initialization Example");
            Console.WriteLine();
            Console.WriteLine("Note: Advanced examples (array navigation, dynamic access, etc.)");
            Console.WriteLine("require runtime compilation and are provided as reference code.");
        }
    }
}