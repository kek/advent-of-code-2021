using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace SmokeBasin.Tests
{
    [TestClass()]
    public class PointTests
    {
        [TestMethod()]
        public void NeighborsTest()
        {
            Input input = new Input("../../../../example");
            Heightmap heightmap = new(input);

            Assert.AreEqual(2, heightmap.points[new Coordinates(0, 0)].Neighbors().Count);
            Assert.AreEqual(2, heightmap.points[new Coordinates(heightmap.Height-1, heightmap.Width-1)].Neighbors().Count);
        }

        [TestMethod()]
        public void IsLowPointTest()
        {
            Input input = new Input("../../../../example");
            Heightmap heightmap = new(input);
            var lowPoint = heightmap.points[new Coordinates(2, 2)];
            var notLowPoint = heightmap.points[new Coordinates(3, 3)];

            Assert.IsFalse(notLowPoint.IsLowPoint());
            Assert.IsTrue(lowPoint.IsLowPoint());
        }
    }
}