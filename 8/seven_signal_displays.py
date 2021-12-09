class Configuration:
    def __init__(self, digits):
        self.digits = digits

        self.value_map = dict([
            (4, [d for d in digits if len(d.segments) == 4][0]),
            (7, [d for d in digits if len(d.segments) == 3][0]),
            (1, [d for d in digits if len(d.segments) == 2][0]),
            (8, [d for d in digits if len(d.segments) == 7][0])
        ])
        unknown_segments = []
        for digit in digits:
            if len(digit.segments) in {5, 6}:
                unknown_segments.append(digit.segments)

        # print("Unknowns")
        # for u in unknown_segments:
        #     print(u)
        # print("End")

        a_set = self._by_value(7).segments - self._by_value(1).segments

        g_set = (unknown_segments[0] - a_set) \
            .intersection(unknown_segments[1] - a_set) \
            .intersection(unknown_segments[2] - a_set) \
            .intersection(unknown_segments[3] - a_set) \
            .intersection(unknown_segments[4] - a_set) \
            .intersection(unknown_segments[5] - a_set)
        # print("g set: " + str(g_set))

        print("digits:", [d.segments for d in digits])
        three_candidates = [d for d in digits
                            if (d.segments in unknown_segments)
                            and len(d.segments - self._by_value(1).segments - a_set - g_set) == 1]

        print("candidates for three:", [x.segments for x in three_candidates])
        three = three_candidates[0]

        self.value_map.update({3: three})

        print("three", three.segments)
        d_set = three.segments - self._by_value(1).segments - a_set - g_set

        #print("8 ->", self._by_value(8))

        zero_segments = self._by_value(8).segments - d_set
        print("zero_segments", zero_segments)
        zero_digit = self._by_segment(zero_segments)
        print("zero_digit", zero_digit)
        self.value_map.update({0: zero_digit})

        print("get 0 by value", self._by_value(0))
        print("get 3 by value", self._by_value(3))

        # 5 -> {2,3,5}
        # 6 -> {6,0,9}
        unknown_segments.remove(zero_segments)
        unknown_segments.remove(three.segments)
        # 5 -> {2,5}
        # 6 -> {6,9}
        print("unknown_segments", unknown_segments)
        nine_or_six = [seg for seg in unknown_segments if len(seg) == 6]
        print("nine_or_six", nine_or_six)
        nine_segments = [seg for seg in nine_or_six if len(
            seg - a_set - d_set - g_set - self._by_value(7).segments) != 2][0]
        print("nine_segments", nine_segments)
        self.value_map.update({9: self._by_segment(nine_segments)})
        six_segments = [seg for seg in nine_or_six if seg != nine_segments][0]
        self.value_map.update({6: self._by_segment(six_segments)})

        two_or_five = [seg for seg in unknown_segments if len(seg) == 5]
        print("two or five", two_or_five)
        two_segments = [seg for seg in two_or_five
                        if seg.union(self._by_value(1).segments) != nine_segments][0]
        self.value_map.update({2: self._by_segment(two_segments)})

        five_segments = [seg for seg in two_or_five if seg != two_segments][0]
        self.value_map.update({5: self._by_segment(five_segments)})

        for k, v in self.value_map.items():
            print("k: " + str(k) + ", v: " + str(v))

    def by_digit(self, digit):
        for value, segments in self.value_map.items():
            # print("value", str(value), "segments", segments)
            if segments == digit:
                return value
        if len(digit.segments) == 5:
            return "either 2, 3 or 5"
        elif len(digit.segments) == 6:
            return "either 6, 0 or 9"

    def _by_value(self, what):
        for value, digit in self.value_map.items():
            if value == what:
                return digit
        return "not found"

    def _by_segment(self, what):
        for digit in self.digits:
            print("segments", digit.segments)
            print("digit.segments", digit.segments, "what", what)
            if digit.segments == what:
                print("gurka")
                return digit


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
        print("digits in Entry constructor", [d.segments for d in self.digits])
        self.configuration = Configuration(self.digits)
        for pattern in self.digits:
            Decider(pattern, self.configuration).run()

    def at(self, position):
        return self.digits[position]


def zort(s):
    result = "".join([char for char in sorted(s)])
    return result
