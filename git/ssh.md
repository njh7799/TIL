# SSH 설정

## 키페어 생성

커맨드

```shell
ssh-keygen -t rsa
```

생성된 키 위치

```shell
개인키: ~/.ssh/id_rsa
공개키: ~/.ssh/id_rsa.pub
```



## authorized_keys & known_hosts

### known_hosts

클라이언트가 서버가 맞는 대상인지 확인하여 엉뚱한 연결을 하지 않도록 한다.

### authorized_keys

서버가 유저를 인증한다.



## password 없이 ssh 접속하기

1. 맥에서 rsa 키를 만든다.

```shell
ssh-keygen -t rsa
```

2. 공개키를 복사한다.

```shell
cat ~/.ssh/id_rsa.pub
```

3. 원격 서버에 ssh 접속을 한다.(password 사용)
4. 원격 서버의 authorized_keys 에 복사한 값을 붙여넣기 한다.

```shell
vim ~/.ssh/authorized_keys
```

5. 이제 원격 서버에 접근할 때 비밀번호를 입력하지 않아도 된다.



## 에러

pub key 는 `ssh-rsa ASDFQWEDSFQWED` 와 같이 `ssh-rsa` 를 포함해야한다.




## Ref
- [difference-between-authorized-keys-and-known-hosts](https://security.stackexchange.com/questions/20706/what-is-the-difference-between-authorized-keys-and-known-hosts-file-for-ssh)
- [한 대의 맥에서 여러 개의 깃허브(github) 계정 사용하는 방법](https://devlog.jwgo.kr/2018/08/17/how-to-use-multi-github-accounts-with-a-machine/)

