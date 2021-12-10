// See https://aka.ms/new-console-template for more information

namespace SmokeBasin
{
    public class Point
    {
        public int height;
        private readonly Coordinates coordinates;
        private readonly Heightmap parent;

        public Point(int height, Coordinates coordinates, Heightmap parent)
        {
            this.height = height;
            this.coordinates = coordinates;
            this.parent = parent;
        }

        public List<Point> Neighbors()
        {
            List<Point> result = new List<Point>();
            Coordinates rightCo = new Coordinates(coordinates.row, coordinates.col + 1);
            if(parent.points.ContainsKey(rightCo))
            {
                Point right = parent.points[rightCo];
                result.Add(right);
            }
            Coordinates leftCo = new Coordinates(coordinates.row, coordinates.col - 1);
            if(parent.points.ContainsKey(leftCo))
            {
                Point left = parent.points[leftCo];
                result.Add(left);
            }
            Coordinates downCo = new Coordinates(coordinates.row + 1, coordinates.col);
            if (parent.points.ContainsKey(downCo))
            {
                Point down = parent.points[downCo];
                result.Add(down);
            }
            Coordinates upCo = new Coordinates(coordinates.row - 1, coordinates.col);
            if(parent.points.ContainsKey(upCo)) { 
                Point up = parent.points[upCo];
                result.Add(up);
            }
            return result;
        }

        public bool IsLowPoint()
        {
            return Neighbors().All(x => x.height > height);
        }
    }
}