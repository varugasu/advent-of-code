from pathlib import Path
from collections import Counter

content = Path("input.txt").read_text()

list_1 = []
list_2 = []
for line in content.splitlines():
    numbers = line.strip().split()
    list_1.append(int(numbers[0]))
    list_2.append(int(numbers[1]))

list_1.sort()
list_2.sort()

total = 0
for i in range(len(list_1)):
    diff = list_1[i] - list_2[i]
    total += abs(diff)

print("Solution 1:", total)

list_2_counter = Counter(list_2)

similarity_score = 0
for num in list_1:
    if num in list_2_counter:
        similarity_score += num * list_2_counter[num]


print("Solution 2:", similarity_score)
