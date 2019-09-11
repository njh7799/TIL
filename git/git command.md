# command

## clone

```bash
# clone all branches
git clone https://github.com/njh7799/TIL

# clone sertain branch
git clone https://github.com/njh7799/TIL -b ss32 --single-branch
```

## add

```bash
git add {file directory}
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
git push/pull {remote name}

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
# Unstagee changes
git reset HEAD

# undo n commits from HEAD(including HEAD)
git reset HEAD~n

# discard all changes
git reset --hard

# undo last commit
```