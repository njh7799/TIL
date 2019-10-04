# commands

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
git reset HEAD

# go back to HEAD~n
git reset HEAD~n

# discard all changes
git reset --hard

# undo last commit
```

## revert 

- 선택된 커밋 하나가 삭제된 상태로 commit 된다.

```bash
git revert HEAD~n
```
위 코드를 실행할 시, HEAD~n 에서의 commit 만  삭제된 상태가 된다.



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

## branch

```bash
# Create new branch on HEAD
git branch {branch}

# Chage HEAD to branch
git checkout {branch}
```

## merge: 두개의 브랜치를 합치기

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


## rebase - 두 브랜치를 한줄로

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



## git reflog

로컬에서의 작업 로그를 가져온다. 지운 로그도 나온다.

## git commit --amend

이전 커밋에 덧붙인다. 이전 커밋에 포함 되어야 하는 아주 작은 수정 사항을 추가할 때 사용.

