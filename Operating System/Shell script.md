# 셸 스크립트 기초

------

## 왜 필요한가

- 개발자라면 반드시 알아야 하는 기초 역량이다.
- 백엔드 서버 운영에도 널리 사용된다.

------

## 학습 목표

- Linux / Unix에서 간단한 셸 스크립트를 작성할 수 있다.

------

### 학습 지식

### 리눅스 기본 명령어

```bash
man
help
pwd
ls
cp, rm, mv
cd
echo
cat
vi
env: 환경변수 출력
```

------

### 사용자 관련 명령어

```bash
sudo: root 유저 권한으로 실행
adduser: 사용자 추가
addgroup
usermod
who, w, last: 사용자 정보
chown: 파일 소유자 변경
chmod: 파일 퍼미션 변경
chgrp
```

------

### 시스템 관련 명령어

```bash
df
du
find
grep
free
kill
ln
mount
ps
```

------

### 패키지 관련 명령

```bash
rpm --> yum
dpkg --> apt-get, apt
```

------

### 기타 명령

```bash
htop
tmux
zsh
```

------

### 환경 변수

```
$ env
$ echo $HOME
$ echo $SHELL
$ echo $PWD
$ echo $PATH
```

------

### 잠깐

프로세스와 스레드의 정의는 무엇일까?

------

### export, source

리눅스는 특정 동작을 할 때에, 자식 프로세스를 만들어서 그 프로세스에게 작업을 위임한다.

```
$ export 변수명=값 #새로운 환경변수 설정
$ source 스크립트파일 #현재 셸에서 스크립트 실행
```

스크립트 파일을 이용해서 환경변수를 설정하기 위해서는 source 명령을 써야 한다!

```bash
source test.sh
```

`source` 명령어를 사용하면 자식 프로세스를 만들지 않고 수행한다.

변수 값은 자식 프로세스한테 전달이 된다. 하지만 역방향 전달은 일어나지 않는다. 따라서 자식 프로세스에서 변수를 만들고 부모 프로세스에서 호출하면 아무 값도 나오지 않는다.

```bash
# test.sh
AA=10
~
~
```

### Case  1.
```bash
./test.sh # sh 를 실행시키는 자식 프로세스 생성
echo $AA
```

위 코드를 실행하면 아무 값도 나오지 않는다.

### Case 2.

```bash
source ./test.sh # 부모 프로세스가 sh를 직접 실행시킴(자식 안만들어요)
			    # source test.sh 라고 써도 실행이 된다. 
echo $AA
```

위와 같이 실행하면 10이 정상적으로 출력된다.

------

### Shell에서 파일을 실행하면

1. 셸은 프로세스를 하나 생성 - fork
2. 프로세스를 실행한 프로그램으로 변경 - exec
3. 프로그램이 완료되면 해당 프로세스는 사라짐

------

### 시작 스크립트

```javascript
[ .profile, .bashrc, .bash_profile ]
```

셸을 시작할 때 자동으로 시작되는 스크립트들
주로 셸 초기화, 환경변수 설정 등을 위해 사용됨

------

### 첫 번째 스크립트 프로그램

### hello.sh

```bash
#!/bin/bash
echo "Hello"
```

### 실행하기

```bash
$ chmod +x hello.sh
$ ./hello.sh
Hello
```

------

### 스크립트에서 사용할 수 있는 변수들

#### test.sh

```bash
VAR1=$#
echo "num=$#"
echo "parameter: $0 $1 $2 $3"
echo "parameters: $@"
echo "VAR1 = $VAR1"
echo 'VAR1 = $VAR1'
```

#### test.sh 실행하기

```bash
$ sh test.sh
```

------

### 기타

```bash
true
echo $?
false
echo $?
echo $RANDOM
echo $RANDOM
```

------

### 매개 변수 사용하기

```bash
$ ./hello2.sh James
Hello, James
I am ./hello2.sh
```

------

### 리다이렉션

shell에서 입력과 출력의 방향을 바꾸는 명령

표준입력 0 - 키보드
표준출력 1 - 터미널 화면
표준에러 2 - 터미널 화면

```text
> : 표준 출력을 지정 파일로 
< : 키보드 대신 파일로부터 입력받음
2> : 표준 에러를 지정 파일로
2>&1 : 표준 에러를 표준 출력으로
1>&2 : 표준 출력을 표준 에러로
# 로그 파일 생성
$ ./my.sh > log.txt 2>&1
```

------

### 파이프

앞 프로그램의 표준 출력이 후속 프로그램의 표준 입력으로 사용됨

```
ps -A | grep ssh
```

------

### 키보드 입력 받기

```bash
$ read INPUT
Hello, Woowa
$ echo $INPUT
Hello, Woowa
```

------

### 환경 변수 Iteration

```bash
#!/bin/bash
NUM=0
for i in $@
do
	echo "$NUM : $i"
	NUM=$(($NUM+1))
done
```

------

### test

```
test 조건식
```

조건식이 참이면 0, 거짓이면 1을 리턴함

```
$ test 1 = 2; echo $?
$ [ 1 = 2 ]; echo $?
```

------

### bash 대화법: 잘 되면 답변이 없다.

- 현실 세계에서 그러지 말자.

------

### if 구문

```bash
if [ expr ]
then
	...
elif [ expr ]
then
	...
else
	...
fi
```

elif에 주의할 것!

------

### file, directory and string test

```
[ -d file ]
[ -f file ]
[ -z string ]
$ [ -z $zero ] && echo "t" || echo "f"
$ zero="hello"
$ [ -z $zero ] && echo "t" || echo "f"
```

------

### 숫자 비교

```bash
[ 3 -eq 5 ]
[ 3 -ne 5 ]
[ 3 -gt 5 ]
[ 3 -ge 5 ]
[ 3 -le 5 ]
[ 3 -lt 5 ]
```

------

### 문자열 비교

[[ expr ]] 를 사용하는 것이 좋다.

```bash
[[ $a == $b ]]
[[ $a == hello* ]]
[[ $a != $b ]]
```

------

### 실습

숫자를 입력받으면 해당 단을 출력하는 프로그램을 bash로 짜 보세요.

팁: `seq 5 10` 명령을 써보자.

------

### cron / crontab

- 주기적으로 스크립트를 자동실행할 때 사용한다.
- http://www.slideshare.net/hoyoung2jung/crontab-39470064

```bash
$ select-editor #vim 선택
$ crontab -e 
* * * * * /home/ubuntu/time.sh >> time.txt
# save and quit (:wq)
```

출처: [쿼드 스쿼드 루카스](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/셸-스크립트-기초)