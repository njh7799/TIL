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

- 기본적으로 reset과 비슷함.
- reset이 목표 커밋 까지 상태를 되돌린다면, revert 는 다음 커밋을 목표 커밋으로 만든다.

```bash
git revert HEAD~n
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
git merge {branch} # 현재 브랜치에 {branch}를 합친다.
# master branch에 {branch}의 내용이 합쳐져 commit 된다.
# {branch}는 그대로 유지된다.

git checkout {branch}
git merge master
# master branch로 {branch} 가 넘어온다.
```

## rebase - 두 브랜치를 한줄로

```bash
# HEAD location : {branch}
git rebase master # 현재 브랜치를 master 밑으로 이동시킨다.
# {branch} 가 master 밑으로 이동한다.

git checkout master
git rebase {branch}
```



