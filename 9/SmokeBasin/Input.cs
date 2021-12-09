// See https://aka.ms/new-console-template for more information

namespace SmokeBasin
{
    public class Input
    {
        public Input(string filename)
        {
            string cwd = Directory.GetCurrentDirectory();
            Console.WriteLine(cwd);
            Lines = File.ReadAllLines(filename);
        }

        public string[] Lines { get; set; } = Array.Empty<string>();
    }
}