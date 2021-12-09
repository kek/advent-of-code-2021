import unittest
from seven_signal_displays import *


class EntryTest(unittest.TestCase):
    def test_create_entry(self):
        entry = Entry(
            "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf")
        self.assertEqual(Digit, type(entry.at(0)))

    def test_output_sum(self):
        entry = Entry(
            "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf")
        self.assertEqual(5353, entry.output_value())


class PatternTest(unittest.TestCase):
    entry = Entry(
        "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf")

    def test_fixed_number_of_segments(self):
        self.assertEqual(1, self.entry.at(9).value)
        self.assertEqual(4, self.entry.at(7).value)
        self.assertEqual(7, self.entry.at(4).value)
        self.assertEqual(8, self.entry.at(0).value)

    def test_3(self):
        self.assertEqual(3, self.entry.at(3).value)

    def test_0(self):
        self.assertEqual(0, self.entry.at(8).value)

    def test_2(self):
        self.assertEqual(2, self.entry.at(2).value)

    def test_9(self):
        self.assertEqual(9, self.entry.at(5).value)

    def test_6(self):
        self.assertEqual(6, self.entry.at(6).value)

    def test_5(self):
        self.assertEqual(5, self.entry.at(1).value)


class SolutionTest(unittest.TestCase):
    def test_example_solution(self):
        solution = Solution("example")
        self.assertEqual(solution.solve(), 61229)

    def test_proper_solution(self):
        solution = Solution("input")
        self.assertEqual(solution.solve(), 989396)


if __name__ == '__main__':
    unittest.main()


#   0:      1:      2:      3:      4:
#  aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
#  ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
#  gggg    ....    gggg    gggg    ....

#   5:      6:      7:      8:      9:
#  aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
#  dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
#  gggg    gggg    ....    gggg    gggg

# komponenter är kända för 1,4,7,8

# Antal komponenter i:
# 0 -> 6
# 1 -> 2 Unik
# 2 -> 5
# 3 -> 5
# 4 -> 4 Unik
# 5 -> 5
# 6 -> 6
# 7 -> 3 Unik
# 8 -> 7 Unik
# 9 -> 6

# Antal komponenter, möjligheter:
# 2 -> {1}
# 3 -> {7}
# 4 -> {4}
# 5 -> {2,3,5}
# 6 -> {6,0,9}
# 7 -> {8}

# okända: 0,2,3,5,6,9

# e är den som finns i 8 men inte i 9
# cf finns bara i 0,1,3,4,7,8,9

# Slutsatser
# ta bort de kända
# cf finns förutom i kända i 0,3,9
# a är den som finns i 7 men inte i 1
# a är den som finns i alla utom 1 och 4
# g är förutom a den enda gemensamma i alla okända
# 3 är den som får en kvar (d) om man subtraherar 1, a och g
# 0 är 8-d
# okända nu  2,5,6,9
# ta bort från 6,9: a,d,g,7, den som då har 2 kvar är 6
# 5+1=9
# 2+1 != 9
