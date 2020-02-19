## Jenkins 설명서 

## 설치(안좋은 방법)

1. Docker를 설치한다.
2. docker toolbox를 설치한다.
3. Kitematic에서 jenkins를 설치한다.

![image](https://user-images.githubusercontent.com/40619551/74794351-4b82e480-5306-11ea-87d2-e515303e12e2.png)

위의 세 과정을 마친 후 플러그인을 설치하면 위와 같은 에러가 반겨준다. 이 에러는 젠킨스의 버전이 낮기 때문에 발생하는 에러이다. Kitematic에서 지원하는 jenkins는 deprecate 된 버전이기 때문에 이런 결과가 나온 것이다.

* 참고

```
jenkins/jenkins is the official repository on Docker Hub for the Jenkins Project. The jenkins and jenkinsci/jenkins images are deprecated.
```



## 설치

1. Docker를 설치한다.

2. jenkins/jenkins 이미지를 받는다.

   ```shell
   docker pull jenkins/jenkins
   ```

3. 컨테이너를 만들고 바로 실행시킨다.

   ```shell
   docker run --name jenkins-test --detach -p 50000:50000 -p 8080:8080 jenkins/jenkins
   ```

4. 컨테이너에 들어간다.

   ```shell
   docker exec -it jenkins-test /bin/bash
   ```

5. 컨테이너를 열고 젠킨스의 비밀번호를 찾는다.

   ```shell
   cat /var/jenkins_home/secrets/initialAdminPassword
   ```

   

6. http://127.0.0.1:8080/ 를 연다.

7. 위의 비밀번호를 입력하고 주욱 수행한다.

### Ref

- [젠킨스 버전 올리기](https://batmat.net/2018/09/07/how-to-run-and-upgrade-jenkins-using-the-official-docker-image/)
- [플러그인 설치](https://shy-blg.tistory.com/entry/Jenkins젠킨스-플러그인-직접-설치-방법)
- [docker를 이용한 CI 구축 연습하기 (젠킨스, 슬랙)](https://jojoldu.tistory.com/139)
- [젠킨스 파이프라인 정리 - 1. 파이프라인 샘플 만들기](https://jojoldu.tistory.com/355)

