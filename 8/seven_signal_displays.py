class Configuration:
    def __init__(self, digits):
        self.value_map = dict([
            (4, [d for d in digits if len(d.segments) == 4][0]),
            (7, [d for d in digits if len(d.segments) == 3][0]),
            (1, [d for d in digits if len(d.segments) == 2][0]),
            (8, [d for d in digits if len(d.segments) == 7][0])
        ])
        unknown_segments = []
        print(unknown_segments)
        for digit in digits:
            if len(digit.segments) in {5, 6}:
                unknown_segments.append(digit.segments)

        print("Unknowns")
        for u in unknown_segments:
            print(u)
        print("End")

        a_set = self._by_value(7).segments - self._by_value(1).segments

        g_set = (unknown_segments[0] - a_set) \
            .intersection(unknown_segments[1] - a_set) \
            .intersection(unknown_segments[2] - a_set) \
            .intersection(unknown_segments[3] - a_set) \
            .intersection(unknown_segments[4] - a_set) \
            .intersection(unknown_segments[5] - a_set)
        print("g set: " + str(g_set))

        three = [d for d in digits if (d.segments in unknown_segments) and len(d.segments -
                 self._by_value(1).segments - a_set - g_set) == 1][0]

        self.value_map.update({3: three})

        for k, v in self.value_map.items():
            print("k: " + str(k) + ", v: " + str(v))

    def by_digit(self, digit):
        for value, segments in self.value_map.items():
            if segments == digit:
                return value
        if len(digit.segments) == 5:
            return "either 2, 3 or 5"
        elif len(digit.segments) == 6:
            return "either 6, 0 or 9"

    def _by_value(self, what):
        for value, segments in self.value_map.items():
            if value == what:
                return segments
        return "not found"


class Decider:
    def __init__(self, digit, configuration):
        self.configuration = configuration
        self.digit = digit

    def run(self):
        self.digit.value = self.configuration.by_digit(self.digit)


class Digit:
    def __init__(self, input):
        self.segments = set(input)
        self.value = "unknown?"

    def __str__(self):
        return "Digit: " + str(self.segments) + ": " + self.value


class Entry:
    def __init__(self, input):
        [pattern_input, output_text] = input.split(" | ")
        self.outputs = output_text.split(" ")
        self.digits = [Digit(digit_input)
                       for digit_input in pattern_input.split(" ")]
        self.configuration = Configuration(self.digits)
        for pattern in self.digits:
            Decider(pattern, self.configuration).run()

    def at(self, position):
        return self.digits[position]


def zort(s):
    result = "".join([char for char in sorted(s)])
    return result
