# Work Flow

## 정의

- [링크 참고](https://en.wikipedia.org/wiki/Workflow)

## 종류

대표적으로 Git-Flow, GitHub flow, GitLab flow 가 있다.

### 비교

-  https://ujuc.github.io/2015/12/16/git-flow-github-flow-gitlab-flow/ 

### Git-flow

- https://nvie.com/posts/a-successful-git-branching-model/
- https://danielkummer.github.io/git-flow-cheatsheet/index.ko_KR.html
- http://woowabros.github.io/experience/2017/10/30/baemin-mobile-git-branch-strategy.html
- https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow

### GitHub flow

- https://guides.github.com/introduction/flow/ 

### GitLab flow

-  https://about.gitlab.com/blog/2014/09/29/gitlab-flow





# Git Flow 의 적용

참고 자료

- https://nvie.com/posts/a-successful-git-branching-model/
- http://woowabros.github.io/experience/2017/10/30/baemin-mobile-git-branch-strategy.html 
-  https://ujuc.github.io/2015/12/16/git-flow-github-flow-gitlab-flow/ 

첨부된 링크를 보자. 전자의 경우에는 git flow의 사용 방법이 매우 구체적으로 설명이 되어 있지만, 협업 상황에 대한 설명이 다소 부족하다. 반면 후자의 경우, 협업 상황에 대한 설명은 충분하지만, Git-Flow의 방식이 변형 되어 적용 되어 있다. 따라서 본 문서에서는, Git-Flow의 기본 규칙을 충분히 적용 하면서 협업 과정 또한 분명히 하는 방법에 대해 기술하겠다.

## Git Repository 구조

- upstream (Upstream Repository) : 프로젝트 remote
- origin (Origin Repository) : upstream을 fork한 레포

![image](https://user-images.githubusercontent.com/40619551/68527652-9450f780-032c-11ea-81ee-b2fa6fd2914f.png)



## 브랜치 종류

- master : 제품으로 출시될 수 있는 브랜치
- develop : 다음 출시 버전을 개발하는 브랜치
- feature : 기능을 개발하는 브랜치
- release : 이번 출시 버전을 준비하는 브랜치
- hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치

![image](https://user-images.githubusercontent.com/40619551/68527668-dbd78380-032c-11ea-9903-4422cc19b0e6.png)

중심이 되는 브랜치는 master 과 develop이다. 이 두 브랜치는 반드시 upstream 레포에 있어야 한다.



## Flow

1. 브랜치 최신화를 위하여 develop 브랜치를 최신의 상태로 만든다.

```bash
[develop] git pull --rebase upstream develop
# upstream repo에 있는 develop 브랜치를 pull 한다.
# develop에 직접 커밋을 한 경우를 제외하고는 --rebase 명령어를 빼도 무방하다.
```

2. 작업 브랜치를 생성한다.

```bash
[아무 브랜치] git checkout -b feat-make_new_feature develop
# develop 브랜치에서 feat-make_new_feature 브랜치를 생성하고 체크 아웃하는 명령어.
```

3. 작업을 한다.
4. 작업 브랜치를 최신화 시킨다.

```bash
[feat-make_new_feature] git pull --rebase upstream develop
# 내가 PR 을 날리기 전에, upstream의 develop이 업데이트 되었을 가능성이 높기 때문에, rebase를 먼저 해준다.
```

5. 작업 브랜치를 *origin* 에 push 한다.

```bash
[feat-make_new_feature] git push origin feat-make_new_feature
```

6. github 상에서 PR을 보낸다.

```bash
[base repository:***][base:develop] <= [head repository:****][base:feat-make_new_feature]
```

이것이 위 세 레퍼런스를 종합적으로 정리한 것이다.



### 우리 팀은 어떻게 했나

필자가 참여한 [팀](https://github.com/connect-foundation/2019-03)은 여러 시행 착오 끝에 위의 과정을 약간 변형 시키기로 하였다. 위의 방식을 그대로 진행하면, feature를 만드는 작업을 할 때에, 내가 과거에 만들었던 컴포넌트가 merge 되지 않으면, 다음 작업에서 사용할 수가 없는 문제가 있다. 따라서 작업 속도에 유의미한 부정적 영향을 미친다는 결론에 이르러 방식을 변경하였다.

## Flow - 변형

1. 브랜치 최신화를 위하여 develop 브랜치를 최신의 상태로 만든다.

```bash
[develop] git pull --rebase upstream develop
# upstream repo에 있는 develop 브랜치를 pull 한다.
# develop에 직접 커밋을 한 경우를 제외하고는 --rebase 명령어를 빼도 무방하다.
```

2. 작업 브랜치를 생성한다.

```bash
[아무 브랜치] git checkout -b feat-make_new_feature develop
# develop 브랜치에서 feat-make_new_feature 브랜치를 생성하고 체크 아웃하는 명령어.
```

3. 작업을 한다.
4. 작업 브랜치를 최신화 시킨다.

```bash
[feat-make_new_feature] git pull --rebase upstream develop
# 내가 PR 을 날리기 전에, upstream의 develop이 업데이트 되었을 가능성이 높기 때문에, rebase를 먼저 해준다.
```

5. 작업 브랜치를 develop 브랜치에 merge 한다.

```bash
[feat-make_new_feature] git checkout develop
[develop] git merge feat-make_new_feature
[develop] git branch -d feat-make_new_feature
```

5. develop 브랜치를 *origin* 에 push 한다.

```bash
[develop] git push origin develop
```

6. github 상에서 PR을 보낸다.

```bash
[base repository:***][base:develop] <= [head repository:****][base:develop]
```