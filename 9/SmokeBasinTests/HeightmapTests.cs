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
        public void HeightmapTest()
        {
            Input input = new Input("../../../../example");
            new Heightmap(input);
        }
    }
}