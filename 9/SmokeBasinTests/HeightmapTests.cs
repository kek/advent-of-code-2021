using Microsoft.VisualStudio.TestTools.UnitTesting;
using SmokeBasin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tests
{
    [TestClass()]
    public class HeightmapTests
    {
        [TestMethod()]
        public void RiskLevelSumTest()
        {
            Input input = new("../../../../example");
            Heightmap heightmap = new(input);
            Assert.AreEqual(15, heightmap.RiskLevelSum());
        }

        [TestMethod()]
        public void RiskLevelSumForMyInputDataTest()
        {
            Input input = new("../../../../input");
            Heightmap heightmap = new(input);
            Assert.AreEqual(480, heightmap.RiskLevelSum());
        }

        [TestMethod()]
        public void ReadingPointsTest()
        {
            Input input = new("../../../../example");
            Heightmap heightmap = new(input);

            var coordinates = new Coordinates(0,1);
            Assert.AreEqual(1, heightmap.points[coordinates].height);
        }

        [TestMethod()]
        public void HeightmapDimensionsTest()
        {
            Input input = new("../../../../example");
            Heightmap heightmap = new(input);
            Assert.AreEqual(10, heightmap.Width);
            Assert.AreEqual(5, heightmap.Height);
        }
    }
}