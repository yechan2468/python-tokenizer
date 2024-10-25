## 프로그래밍언어론 Python Tokenizer 실습

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
