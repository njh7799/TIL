# GitHub과 shell스크립트를 이용한 자동배포

------

## 왜 필요한가

- 현업에서 널리 사용되는 CI 툴을 직접 구현함으로써 필요성과 원리를 이해한다.

------

## 학습 목표

- 클라우드 서버에 셸 스크립트로 자동 배포를 구현할 수 있다.

------

### 학습지식

### 배포란

소스를 서버에 반영하는 것
자동과 수동 두 가지 방법이 있다.

------

### 소스 저장소를 경유한 배포

개발 - 로컬 - VCS - 서버 연동을 통해 배포

------

### (참고) CI /CD

Continuous Integration

Continuous Delivery

- https://ko.atlassian.com/continuous-delivery
- http://jojoldu.tistory.com/265

------

#### DevOps 툴 및 관련 도구들

아주 많고 공부할 영역도 많다.

Travis, Jenkins, AWS CodeXXX, Docker,
Kubernetis, Terraform, Ansible, Chef, Heroku, OpsWorks, Pivotal,
Spring Cloud, Cloud Foundary, ...

------

### master 브랜치의 의미

실서버에 배포를 한다는 뜻.
반드시 테스트가 완료된 정상 동작 버전이 올라가야 한다.

------

### 수동 배포 실습

1. 서버 환경 세팅
2. github에 소스 업로드
3. 서버 접속
4. git으로 소스를 가져와서 빌드
5. 클라이언트를 이용해서 테스트

------

### 자동 배포 스크립트 작성

- 서버에 접속해서 실행하면 배포를 완료하는 스크립트를 작성해 보자.

------

### 자동화 개선

git에 업데이트가 없었다면 배포 스크립트는 아무 것도 하지 않는 게 좋다.

어떻게 해야 할까?

#### hint

```bash
$ git fetch
$ git rev-parse master
$ git rev-parse origin/master
```

그 외에도 다양한 방법이 있다.

------

### 완전 자동화

5분마다 한 번씩 빌드 스크립트를 실행해 보자.

crontab 이용
로그가 필요할 경우 `/dev/null` 대신 `logfile`로 사용하자

```
*/5 * * * * /home/ubuntu/build.sh >> /dev/null 2>&1
```

> aws의 람다 같은 서비스를 이용할 수도 있다.

 출처: [코드 스쿼드 루카스](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/Deploy)