// See https://aka.ms/new-console-template for more information

namespace SmokeBasin
{
    public class Coordinates
    {
        public readonly int col;
        public readonly int row;

        public Coordinates(int row, int col)
        {
            this.col = col;
            this.row = row;
        }

        public override bool Equals(object? obj)
        {
            return obj is Coordinates coordinates &&
                   col == coordinates.col &&
                   row == coordinates.row;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(row, col);
        }
    }
}