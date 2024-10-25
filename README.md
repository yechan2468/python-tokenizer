## Python Tokenizer

### 예시

**python 코드 1**

```python
memo = [[False] * (lenNumbers+1) for _ in range(lenNumbers+1)]
for i in range(1, lenNumbers+1):
    memo[i][i] = True
for i in range(1, lenNumbers):
    if numbers[i] == numbers[i+1]:
        memo[i][i+1] = True
```

**토큰화 결과 1**

```
IDENTIFIER              memo
OPERATOR                =
LEFT_BRACKET            [
LEFT_BRACKET            [
KEYWORD                 False
RIGHT_BRACKET           ]
OPERATOR                *
LEFT_PARENTHESIS        (
IDENTIFIER              lenNumbers
OPERATOR                +
DECIMAL_INT_LITERAL     1
RIGHT_PARENTHESIS       )
KEYWORD                 for
IDENTIFIER              _
KEYWORD                 in
IDENTIFIER              range
LEFT_PARENTHESIS        (
IDENTIFIER              lenNumbers
OPERATOR                +
DECIMAL_INT_LITERAL     1
RIGHT_PARENTHESIS       )
RIGHT_BRACKET           ]
LINEBREAK
KEYWORD                 for
IDENTIFIER              i
KEYWORD                 in
IDENTIFIER              range
LEFT_PARENTHESIS        (
DECIMAL_INT_LITERAL     1
COMMA                   ,
IDENTIFIER              lenNumbers
OPERATOR                +
DECIMAL_INT_LITERAL     1
RIGHT_PARENTHESIS       )
COLON                   :
LINEBREAK
INDENT                  depth=1
IDENTIFIER              memo
LEFT_BRACKET            [
IDENTIFIER              i
RIGHT_BRACKET           ]
LEFT_BRACKET            [
IDENTIFIER              i
RIGHT_BRACKET           ]
OPERATOR                =
KEYWORD                 True
LINEBREAK
KEYWORD                 for
IDENTIFIER              i
KEYWORD                 in
IDENTIFIER              range
LEFT_PARENTHESIS        (
DECIMAL_INT_LITERAL     1
COMMA                   ,
IDENTIFIER              lenNumbers
RIGHT_PARENTHESIS       )
COLON                   :
LINEBREAK
INDENT                  depth=1
KEYWORD                 if
IDENTIFIER              numbers
LEFT_BRACKET            [
IDENTIFIER              i
RIGHT_BRACKET           ]
OPERATOR                ==
IDENTIFIER              numbers
LEFT_BRACKET            [
IDENTIFIER              i
OPERATOR                +
DECIMAL_INT_LITERAL     1
RIGHT_BRACKET           ]
COLON                   :
LINEBREAK
INDENT                  depth=2
IDENTIFIER              memo
LEFT_BRACKET            [
IDENTIFIER              i
RIGHT_BRACKET           ]
LEFT_BRACKET            [
IDENTIFIER              i
OPERATOR                +
DECIMAL_INT_LITERAL     1
RIGHT_BRACKET           ]
OPERATOR                =
KEYWORD                 True
LINEBREAK
```

**python 코드 2**

```python
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
```

**토큰화 결과 2**

```
LINEBREAK
OCTAL_INT_LITERAL       0o124
LINEBREAK
OCTAL_INT_LITERAL       0O123
LINEBREAK
HEXADECIMAL_INT_LITERAL 0x15DA
LINEBREAK
HEXADECIMAL_INT_LITERAL 0XABC123def
LINEBREAK
BINARY_INT_LITERAL      0b10001
LINEBREAK
BINARY_INT_LITERAL      0B100010101011
LINEBREAK
DECIMAL_INT_LITERAL     123_999
LINEBREAK
BINARY_INT_LITERAL      0b1000_0101
LINEBREAK
HEXADECIMAL_INT_LITERAL 0xAF94_1DE6
LINEBREAK
OCTAL_INT_LITERAL       0o2243_0746
LINEBREAK
FLOAT_LITERAL           3.14
LINEBREAK
FLOAT_LITERAL           .1919
LINEBREAK
FLOAT_LITERAL           56.
LINEBREAK
FLOAT_LITERAL           31234_123.123_1243
LINEBREAK
FLOAT_LITERAL           03.14159_26535
LINEBREAK
FLOAT_LITERAL           3_123.123_345
LINEBREAK
FLOAT_LITERAL           .4343_94985
LINEBREAK
```

### Prerequisites

Flex와 gcc가 설치되어 있어야 합니다.

```bash
apt update
apt install flex
apt install build-essential
```

### 실행 방법

새로운 파이썬 파일을 토큰화하고 싶다면, `<python_file_name>.py`를 만든 뒤, 아래와 같이 터미널에 명령을 입력한다.

```bash
./all
cat <python_file_name>.py | ./output
```

이를 통해 stdout으로 파이썬 토큰 결과를 확인할 수 있다. 필요 시 `> <out_file_name>.txt`와 같은 명령어를 추가해 토큰 결과를 저장한다.

### 스크립트에 대한 설명

all: 아래 두 스크립트를 실행

- lex: flex(lexical analyzer)를 사용해 어휘분석기 생성 (lexSource.l --lex-->  lex.yy.c)
- compile: gcc를 사용해 lex.yy.c 컴파일 (lex.yy.c --gcc--> output)

### 기타

`test1.py`, `test2.py`, `test3.py` 테스트용 파이썬 파일들의 토큰화 결과를 `test1.result.txt`, `test2.result.txt`, `test3.result.txt`에서 각각 확인 가능하다.
