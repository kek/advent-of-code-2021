// See https://aka.ms/new-console-template for more information

namespace SmokeBasin
{
    public class Heightmap
    {
        public readonly int Width;
        public readonly int Height;
        public readonly IDictionary<Coordinates, Point> points = new Dictionary<Coordinates, Point>();

        public Heightmap(Input input)
        {
            int row = 0;
            foreach (var line in input.Lines)
            {
                int col = 0;
                foreach (var height in line)
                {
                    Coordinates coordinates = new Coordinates(row, col);
                    points.Add(coordinates, new Point(height - '0', coordinates, this));

                    col++;
                }
                Width = col;
                row++;
            }
            Height = row;
        }

        public int RiskLevelSum()
        {
            return points.Values.Sum(point =>
            {
                if (point.IsLowPoint())
                {
                    return point.height + 1;
                }
                else
                {
                    return 0;
                }
            }
            );
        }
    }
}