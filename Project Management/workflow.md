## Work Flow의 종류

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



## Git flow에서 브랜치의 종류, 브랜치의 역할, 브랜치 사용법 정리

- 메인 브랜치

    메인 브랜치에는 마스터 브랜치와 디벨롭 브린치 두 개가 존재합니다. 메인 브랜치는 프로젝트 기간동안 사라지지 않고 계속 존재하는 브랜치입니다. 

    마스터의 헤드는 서비스되고있는 상태를 의미합니다. 디벨롭 브랜치의 헤드는 다음 릴리즈를 위해서 마지막으로 전달된 개발 변경사항을 의미합니다. 디벨롭 브랜치에있는 소스코드가 안정된 상태이고 릴리즈할 준비가 되었다면 모든 변경사항은 마스터 브랜치로 머지되고 릴리즈 넘버가 태그되어야합니다. 구체적인 사항은 뒤에서 조금 더 알아봅시다.

- 서포팅 브랜치

    메인 브랜치들은 팀 멤버들이 함께 개발하고, 상품 릴리즈를 준비하고, 상품의 문제를 신속하게 해결하기 위해 다양한 서포팅 브랜치들을 활용합니다. 이 서포팅 브랜치들은 항상 존재하지 않고 필요에 따라 생겼다 사라집니다. 우리가 쓸 서포팅 브랜치들에는 피쳐 브랜치, 릴리즈 브랜치, 핫픽스 브랜치가 있다. 각각의 브랜치들은 목적이 뚜렷하고, 어느 브랜치에서 분리되고 어느 브랜치에 머지되어야하는지 엄격한 룰을 가지고 있습니다. 이 브랜치들이 기술적 관점에서 특별한 것은 절대 아닙니다. 그저 어떻게 쓰이냐에 따라 분류됩니다.

    - 피쳐 브랜치

        > 어디서 분리되는가? 디벨롭 브랜치
        > 어디로 머지되는가? 디벨롭 브랜치
        > 네이밍 컨벤션? `master`, `develop`, `release-*`, `hotfix-*`를 제외한 모두

        피쳐 브랜치(간혹 토픽 브랜치라고도 불림)는 추후에 새로운 릴리즈에 반영될 새로운 기능을 만들 때 사용합니다. 기능 개발을 시작할 때 이 브랜치가 언제 통합될지는 알 수 없습니다. 미래에 출시 될 때 또는 기능이 버려질 때 머지되거나 브랜치가 삭제됩니다. 피쳐 브랜치는 일반적으로 origin에는 없고 개발하는 로컬 레포지토리에만 존재합니다.
        - 피쳐 브랜치 만드는 법
            ```
            $ git checkout -b myfeature develop
            새로운 브랜치 'myfeature'로 전환됩니다.
            ```
        - 피쳐 브랜치 통합하는 법

            개발이 끝난 기능은 다음 릴리즈를 위해서 디벨롭 브랜치에 머지되어야합니다.
            ```
            $ git checkout develop
            'develop' 브랜치로 전환됩니다.
            $ git merge --no-ff myfeature
            Updating ea1b82a..05e9557
            (로그 요약)
            $ git branch -d myfeature
            'myfeature' 브랜치 삭제
            $ git push origin develop
            ```

            --no-ff 플래그를 쓰는 이유는 패스트 포워드로 동작할 수 있더라도 머지할 때 새로운 커밋 객체를 만들기 위함이다. 이렇게 하면 브랜치가 존재했었다는 사실을 명확하게 알 수 있고, 추가된 피쳐의 커밋들을 모아둘 수 있다. 비교그림은 다음과 같다.

            ![contrast-noff-ff](https://nvie.com/img/merge-without-ff@2x.png)

            그림 중 후자의 경우 깃 히스토리에서 어떤 커밋 객체가 피쳐를 구현했는지 볼 수 없다. - 전자의 경우 쉽게 알아볼 수 있는 반면에 후자는 기능을 되돌리고자 했을 때 모든 로그 메세지를 읽어야한다. 전자의 경우 쓸데없는 커밋 객체를 생성하겠지만 그로인해 얻는 것이 더 크다.



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