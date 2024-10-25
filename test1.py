import sys

"importimport~~"

""" 
hi. 
"""

0o124
0O123
0x15DA
0XABC123def
0b10001
0B100010101011

123_999
0b1000_0101
0xAF94_1DE6
0o2243_0746

3.14
.1919
56.
31234_123.123_1243
03.14159_26535
3_123.123_345
.4343_94985

lenNumbers = int(sys.stdin.readline())
numbers = [0] + list(map(int, sys.stdin.readline().split()))
lenQuestions = int(sys.stdin.readline())
questions = [tuple(map(int, sys.stdin.readline().split()))
            for _ in range(lenQuestions)]

memo = [[False] * (lenNumbers+1) for _ in range(lenNumbers+1)]
for i in range(1, lenNumbers+1):
    memo[i][i] = True
for i in range(1, lenNumbers):
    if numbers[i] == numbers[i+1]:
        memo[i][i+1] = True


def isPanlindrom(start, end):
    return memo[start][end]


def slidingWindow():
    for windowDelta in range(2, lenNumbers):
        for start in range(lenNumbers-windowDelta+1):
            end = start + windowDelta
            if numbers[start] == numbers[end] and isPanlindrom(start+1, end-1):
                memo[start][end] = True


def solve():
    slidingWindow()
    for question in questions:
        start, end = question
        print(1 if isPanlindrom(start, end) else 0)


solve()
