f = open("input")
result = 0
for line in f:
    [_, output] = line.rstrip().split(" | ")
    patterns = output.split()
    for pattern in patterns:
        if len(pattern) in {2, 4, 3, 7}:
            result += 1

print(result)
