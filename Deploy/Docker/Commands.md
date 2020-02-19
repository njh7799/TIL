# Commands

### 현재 실행중인 컨테이너 리스트

```shell
docker ps
```

### 내 컨테이너 리스트

```shell
docker ps -a
```

### 컨테이너 삭제

```shell
docker rm {컨테이너 이름}
```

### 설치된 이미지 리스트

```shell
docker images
```

### 이미지로 컨테이너 만들기

```shell
docker run --name {컨테이너 이름} -d -p 50000:50000 -p 8080:8080 {이미지 이름}
```
- `--name`: 컨테이너의 이름을 설정한다.
- `-d --detach`: 컨테이너를 background 에서 실행시킨다.
- `-p --publish`: {호스트 포트}:{컨테이너 포트} 로 연결한다.

### 도커에 진입

```shell
docker exec -it {컨테이너 이름} /bin/bash
```



### Ref

- [docker run API](https://docs.docker.com/engine/reference/commandline/run/)
- [기본 명령어](https://calyfactory.github.io/docke에대해-알아보자/)