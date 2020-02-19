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
docker run -i -t --name {컨테이너 이름} {이미지 이름} /bin/bash
```

### 도커에 진입

```shell
docker exec -it {컨테이너 이름} /bin/bash
```



### Ref

- [기본 명령어](https://calyfactory.github.io/docke에대해-알아보자/)