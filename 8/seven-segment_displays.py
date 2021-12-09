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


class Entry:
    def __init__(self, input):
        [patterns, output] = input.split(" | ")
        self.outputs = output.split(" ")
        self.patterns = patterns.split(" ")
        print(self.patterns)
        print(self.outputs)

    def value(pattern):
        if len(pattern) == 4:
            return 4
        elif len(pattern) == 3:
            return 7
        elif len(pattern) == 2:
            return 1
        elif len(pattern) == 7:
            return 8
        else:
            print(sorted_signals)
            raise "WHAT?!"


def zort(s):
    result = "".join([char for char in sorted(s)])
    return result


print("Day 8")
f = open("example")
result = 0
for line in f:
    entry = Entry(line.rstrip())
