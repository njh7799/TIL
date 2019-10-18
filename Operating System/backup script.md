# 부스트 캠프 챌린지 백업 스크립트

![image](https://user-images.githubusercontent.com/40619551/67101643-f8d0d900-f1fc-11e9-8882-df7f7e69d612.png)

1. 준비물 : day1-challenge부터 day16-challenge 까지 모든 브랜치가 저장되어있는 디렉토리
2. 파일 위치. 1번의 디렉토리 내부
3. 주의 사항: 혹시 스크립트를 복붙해서 쓰실거면 vim 편집기로 바로 붙여 주세요.
4. 1, 2와 관련된 사항은 위 사진 참고
```bash
#!/bin/bash
# 원격 저장소의 이름은 boostcamp 입니다.
# 후에 멤버십 때의 데이터도 여기서 관리하기 위해 위와 같이 지었습니다.
# 바꾸려면 바꾸세요.
# 원격 저장소는 private으로 해주세요.

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
	echo "> 원격 저장소 연결 해제"
	git remote remove origin
	echo "> 새로운 원격 저장소에 연결"
	git remote add origin https://${username}:${password}@github.com/${username}/boostcamp
	echo "> 새로운 저장소에 푸시"
	git push origin ${mybranch}:challenge-day${i}
	cd ..
done
```

