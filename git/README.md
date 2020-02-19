# Git

> Pro-Git 책을 꼭 읽어 보자.



## Install Git

설치는 알아서 뚝딱뚝딱 한다.

## 초기 설정

> 사실 직접 안해줘도 된다. 어차피 시킨다.

```shell
git config --global user.name "jeongHo"
git config --global user.email "rainy_waltz@naver.com"
```



## Create Local git repository 

```bash
# make directory to git repository
git init

# connect to remote repository
git remote add origin https://github.com/{username}/{new_repo}

# set default git push as git push origin master
git push --set-upstream origin master
```

Git 초기 설정에서 global 변수에 내 아이디 정보를 저장했기 때문에 remote 로 등록하고 push 하면 자동으로 나를 인식한다. 추가적으로 특정 디렉토리에서 특정한 계정을 사용하고 싶으면 해당 디렉토리에서 아래의 명령어를 치면 된다.

```shell
git config user.name "jack"
git config user.email "jeongho.nam@navercorp.com"
```


![image](https://user-images.githubusercontent.com/40619551/64782506-52137000-d5a0-11e9-80d2-e8c7c11e2b8d.png)



