# commands

# 기본 명령어
---

## clone

```bash
# clone all branches
git clone https://github.com/njh7799/TIL

# clone sertain branch
git clone https://github.com/njh7799/TIL -b ss32 --single-branch
```

## add

```bash
git add {file_directory}
```

## commit

```bash
git commit -m "title" # 제목만 입력
git commit # vim이 실행 됨. 본문 또한 작성 가능
```

## push and pull

```bash
# push/pull all to/from default remote
git push/pull

# push/pull to/from certain remte
git push/pull {remote_name}

# push/pull certain branch
git push/pull origin ss22

# push/pull across branch
git push/pull origin from:to
```

## delete

```bash
git push --delete <remote_name> <branch_name>
git branch -d <branch_name>
```

## reset 

```bash
# Unstage changes
git reset

# go back to HEAD~n
git reset HEAD~n

# discard all changes
git reset --hard

# undo last commit
```

## git log

```bash
# show log of current branch
git log

# show log with one line
git log --oneline

# show log as tree
git log --graph

# show log of every branch
git log --all
```



# 브랜치 명령어

---

## 브랜치 생성

```bash
git nb
```



## 브랜치 목록

```bash
# 1. local 브랜치
git branch -a

# 2. remote 브랜치
git branch -r
```



## 브랜치 이름 변경

```bash
# 1. 해당 브랜치로 체크 아웃
git checkout nb

# 2. 이름 바꾸기
git branch -m nnb
```



## 브랜치 위치 변경

```bash
# branch-name 을 new-tip-commit 으로 이동한다.
# new-tip-commit 자리에 HEAD도 가능
git branch -f branch-name new-tip-commit
```



## merge

```bash
# HEAD location : master
git merge bugFix # 현재 브랜치에 {branch}를 합친다.
# master branch에 {branch}의 내용이 합쳐져 commit 된다.
# {branch}는 그대로 유지된다.
```
![머지1](https://user-images.githubusercontent.com/40619551/64791483-c1925b00-d5b2-11e9-872a-9ada98194ea4.gif)



```bash
git checkout bugFix; git merge master
# master 로 bugFix 가 넘어온다.
```
![머지2](https://user-images.githubusercontent.com/40619551/64791636-f6061700-d5b2-11e9-91a9-38239766e7e8.gif)





# 로컬 저장소 원격 저장소에 붙이기

---

1. 로컬 저장소 생성

```bash
git init
```

2. 원격 저장소에 연결

```bash
git remote add {저장소 이름} {URL}
git remote add origin https://github.com/njh7799/forTest
```

3. git push 디폴트 값 설정

```bash
git push --set-upstream origin master
```



# 유용한 명령어들
---

1. 로컬에서의 작업 로그를 가져온다. 지운 로그도 나온다.

```bash
git reflog
```

2. 이전 커밋에 덧붙인다. 이전 커밋에 포함 되어야 하는 아주 작은 수정 사항을 추가할 때 사용.

```bash
git commit --amend
```





# 잘 안쓰는 명령어들
---

## revert 

- 선택된 커밋 하나가 삭제된 상태로 commit 된다.

```bash
git revert HEAD~n
```
위 코드를 실행할 시, HEAD~n 에서의 commit 만  삭제된 상태가 된다.



## rebase - 두 브랜치를 한줄로

머지랑 동작 자체는 비슷하다. 아래의 예시로 설명을 하겠다. C3의 변경사항이 C2 에 커밋의 형태로 반영이 된다. 물론 충돌이 발생할 수도 있으며, 충돌이 일어나면, 충돌이 일어난 파일에서 충돌을 해결하고 `git rebase --continue` 를 해주면 된다.

그렇다면 그래프의 형태가 아래와 같을 때 c4를 c2에 리베이스 하면 어떻게 될까

```bash
C0
|  \
c1  c3
|    |
c2  c4
```

결과는 아래와 같다

```bash
C0
|  \
c1  c3
|    |
c2  c4
|
c3'
|
c4'
```

마치 c3와 c4를 체리픽 한 것과 같다.



```bash
# HEAD location : bugFix
git rebase master # 현재 브랜치를 master 밑으로 이동시킨다.
# bugFix 가 master 밑으로 이동한다.
```
![리베이스1](https://user-images.githubusercontent.com/40619551/64791702-0fa75e80-d5b3-11e9-9baf-38d737c6ef83.gif)

```bash
git checkout master; git rebase bugFix
```
![리베이스2](https://user-images.githubusercontent.com/40619551/64791726-17ff9980-d5b3-11e9-8f44-dbb065a0789b.gif)

## cherry-pick 

선택된 브랜치 밑에 원하는 커밋들을 붙인다.

```bash
git cherry-pick c2 c4
```

![체리픽](https://user-images.githubusercontent.com/40619551/64791936-77f64000-d5b3-11e9-8f66-f5a17d160c9c.gif)





## git pull

로컬에서 작업을 했는데, 원격에서 다른 사람이 먼저 커밋을 했을 때 pull을 하면?

```bash
# 초기 상태
# remote
c3
|
c2
|
c1
```

```bash
# git pull 을 하고 commit을 함
# 내 local
c4
|
c3
|
c2
|
c1
```

```bash
# 그런데 다른 사람이 원격에 먼저 푸시 날림
# remote
c5
|
c3
|
c2
|
c1
```

이 경우, 당연히 push가 안된다. 이 때 pull을 하면 충돌이 없다는 가정 하에 아래와 같은 그래프가 생성된다. 

```bash
# pull 하고 난 후
# 내 local

c6 (HEAD -> master) Merge branch 'master' of https://github.com/njh7799/forTest
| \
c4 c5 (origin/master)
|  /
c3
|
c2
|
c1
```

짱신기하다.

## 여기서 reset을 하면?

여기서 git reset HEAD~1을 하면 어디를 기준으로 어디까지가 reset이 될까? 해보자

**git pull을 하기 바로 전 상태**로 돌아왔다.

##  git pull --rebase 

이제 pull 설정을 rebase로 해보자. 아무런 설정을 하지 않으면 깃은 자동으로 fetch merge 를 진행한다. 여기서 merge를 rebase로 바꿔주는 것이다.

```bash
# pull 하고 난 후
# 내 local

c4 (HEAD -> master)
|
c5 (origin/master)
|
c3
|
c2
|
c1
```

