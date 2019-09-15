# Getting started

## Create Local git repository 

```bash
# make directory to git repository
git init

# connect to remote repository
git remote add origin https://github.com/{username}/{new_repo}

# set default git push as git push origin master
git push --set-upstream origin master
```

* romote로 등록하고 push 날리면 자동으로 사용자 등록이 되는 이유
* ![image](https://user-images.githubusercontent.com/40619551/64782506-52137000-d5a0-11e9-80d2-e8c7c11e2b8d.png)

git 설치할 때 global 변수에 내 아이디 정보가 들어가기 때문

## moving branch

```bash
# master 브랜치를 HEAD~3의 위치로 강제로 옮김
# HEAD를 뗀 상태에서만 변경이 가능
git branch -f master HEAD~3
```

