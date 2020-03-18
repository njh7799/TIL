# Jenkins 설명서 

## 설치

1. Docker를 설치한다.

2. jenkins/jenkins 이미지를 받는다.

   ```shell
   docker pull jenkins/jenkins
   ```

3. 컨테이너를 만들고 바로 실행시킨다.

   ```shell
   docker run --name jenkins --detach -p 50000:50000 -p 8080:8080 jenkins/jenkins
   ```

4. 컨테이너에 들어간다.

   ```shell
   docker exec -it jenkins /bin/bash
   ```

5. 컨테이너를 열고 젠킨스의 비밀번호를 찾는다.

   ```shell
   cat /var/jenkins_home/secrets/initialAdminPassword
   ```

   

6. http://127.0.0.1:8080/ 를 연다.

7. 위의 비밀번호를 입력하고 주욱 수행한다.



## CI

1. [link](https://kutar37.tistory.com/entry/Jenkins-추가설정-Maven-JDK-Git-Plugin-2?category=776504)를 참고한다. Maven, JDK, Git 설치과정은 **건너 뛴다.**
2. [link](https://kutar37.tistory.com/entry/Jenkins-Github-연동-자동배포-3?category=776504)를 참고해서 나머지 과정까지 진행한다. CD 파트는 **건너 뛴다.**

위의 과정중 건너뛰는 부분은 링크가 자바를 기준으로 작성되었기 때문이다. Maven, JDK는 자바에서 필요하다. CD 과정 또한 자바를 기준으로 설명이 되어있어서 노드와 상당한 차이가 있다. Git 은 도커를 사용하면 자동으로 설정되기 때문에 필요가 없었다.

### build 스크립트

build 스크립트가 실행되는 환경은 타겟 깃의 루트 디렉토리이다. 여기서 `yarn test` 등의 코드를 삽입하면 될 듯하다.

## CD

[link](https://setyourmindpark.github.io/2017/04/22/jenkins/jenkins-2/)를 참고하여 완성하였다.

## Node 추가

build 테스트에서 npm test 를 실행하기 위해선 노드 환경이 구축되어 있어야 한다. [link](https://plugins.jenkins.io/nodejs/)를 따라 하자.

1. Nodejs 플러그인 설치
2. Jenkins 관리 > Global Tool configuration > NodeJs 설정
3. 프로젝트 아이템 > 빌드 구성 > `Provide Node & npm bin/ folder to PATH` 설정

# 번외

## SSH Key

반드시 필요한 키는 jenkins 와 레포지토리를 연결할 한 쌍(어디서 만들던 상관 없다)과 jenkins 에서 remote 서버에 비밀번호 없이 접근하기 위한 키 한 쌍 이렇게 두 쌍이다. 예제에서는 remote 서버 자체의 키 한 쌍을 만들어 깃과 연결을 하지만, remote 서버에서 push 를 할 일이 없다면 불필요할 듯 하다.

## Error list

### 잘못된 설치

1. Docker를 설치한다.
2. docker toolbox를 설치한다.
3. Kitematic에서 jenkins를 설치한다.

![image](https://user-images.githubusercontent.com/40619551/74794351-4b82e480-5306-11ea-87d2-e515303e12e2.png)

위의 세 과정을 마친 후 플러그인을 설치하면 위와 같은 에러가 반겨준다. 이 에러는 젠킨스의 버전이 낮기 때문에 발생하는 에러이다. Kitematic에서 지원하는 jenkins는 deprecate 된 버전이기 때문에 이런 결과가 나온 것이다.

* 참고

```
jenkins/jenkins is the official repository on Docker Hub for the Jenkins Project. The jenkins and jenkinsci/jenkins images are deprecated.
```



### 웹훅 에러

> Last delivery was not successful jenkins

<img width="462" alt="KakaoTalk_Photo_2020-03-16-16-18-22" src="https://media.oss.navercorp.com/user/17102/files/19985d00-67a2-11ea-8b20-0965ed66db8c">

젠킨스에 접속하지 못하여서 생긴 문제이다. 보통은 젠킨스 주소를 localhost 로 설정해서 발생한다. 나의 경우, nCloud의 ACG 를 막아놓은 것이 원인이었다.

### jenkins 빌드 실패

> 빌드가 실패했을 때는 console output에서 원인을 확인할 수 있다.

![image](https://media.oss.navercorp.com/user/17102/files/de972900-67a3-11ea-9bdb-e69360270816)


### Ref

- [[Jenkins] 윈도우 Jenkins 설치, 기본설정 (1)](https://kutar37.tistory.com/entry/윈도우-Jenkins-설치-기본설정)
- [[Jenkins] 추가설정 - Maven, JDK, Git, Plugin (2)](https://kutar37.tistory.com/entry/Jenkins-추가설정-Maven-JDK-Git-Plugin-2?category=776504)
- [[Jenkins] Github 프로젝트 연동, webhook, 자동배포 (3)](https://kutar37.tistory.com/entry/Jenkins-Github-연동-자동배포-3?category=776504)
- [젠킨스로 노드 배포하기](https://setyourmindpark.github.io/2017/04/22/jenkins/jenkins-2/)
- [플러그인 설치](https://shy-blg.tistory.com/entry/Jenkins젠킨스-플러그인-직접-설치-방법)

