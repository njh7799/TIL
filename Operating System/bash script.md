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
END=3
mybranch=ss22
username=
password=


echo "> 초기 레포 환경 설정"
git clone https://${username}:${password}@github.com/${username}/boostcamp-challenge
cd boostcamp-challenge

echo "> Create First Commit"
touch README.md
git add .
git commit -m "initiate"

echo "> Create branches"
for i in $(seq ${BEGIN} ${END});
do
	git branch day${i}
done

git push origin --all
cd ..

for i in $(seq ${BEGIN} ${END});
do
	cd day${i}-challenge
	echo "> 내 브랜치로 체크 아웃"
	git checkout ${mybranch}
	echo "> 브랜치 초기화 및 최신화"
	git reset --hard
	git clean -f
	git pull
	echo "> 레포에 들어갈 디렉토리 생성"
	mkdir day${i}-challenge
	echo "> 파일 이동"
	mv -v "$PWD"/!(.git) "$PWD"/day${i}-challenge
	echo "> 다이렉토리 수정 커밋"
	git add .
	git commit -m "Create new directory and move all files"
	echo "> 원격 저장소 연결 해제"
	git remote remove origin
	echo "> 새로운 원격 저장소에 연결"
	git remote add origin https://${username}:${password}@github.com/${username}/boostcamp-challenge
	echo "> 새로운 저장소에 push"
	git push origin ${mybranch}:day${i}
	cd ..
done


echo "> Merge branches"
cd boostcamp-challenge
git pull --all
for i in $(seq ${BEGIN} ${END});
do
	echo "> day${i} 브랜치 머지"
	git merge day${i}
done

git push origin master
```

