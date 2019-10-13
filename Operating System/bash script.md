# Bash script

변수를 이용하여 문자열 만들기
```sh
foo="${foo} World"
```

현재 디렉토리 이용하기
```
ls "`pwd`/file.txt"
```

하나 빼고 다 옮기기
```sh
mv ~/Linux/Old/!(Tux.png) ~/Linux/New/
```

지금 짜고 있는 코드

```bash
#!/bin/bash
shopt -s extglob
BEGIN=1
END=16
mybranch=
username=
password=

echo "> 프로그램 실행"
for i in $(seq ${BEGIN} ${END});
do
	cd day${i}-challenge
	echo "> ${mybranch}로 체크 아웃"
	git checkout ${mybranch}
	echo "> 브랜치 초기화 및 최신화"
	git reset --hard
	git clean -f
	git pull
	echo "> 레포에 들어갈 디렉토리 생성"
	mkdir day${i}-challenge
	echo "> 파일 이동"
	mv !(.git|.|..|day${i}-challenge) "$PWD"/day${i}-challenge
	echo "> 다이렉토리 수정 커밋"
	git add .
	git commit -m "Create new directory and move all files"
	echo "> 원격 저장소 연결 해제"
	git remote remove origin
	echo "> 새로운 원격 저장소에 연결"
	git remote add origin https://${username}:${password}@github.com/${username}/boostcamp-challenge
	echo "> 새로운 저장소에 푸시"
	git push origin ${mybranch}:day${i}
	cd ..
done
```

