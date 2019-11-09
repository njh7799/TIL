# [Git-flow](http://woowabros.github.io/experience/2017/10/30/baemin-mobile-git-branch-strategy.html)

원문이 설명이 정말 너무 잘 되어있기 때문에, 내용 이해를 위해선 원문을 보도록 하자. 여기에는 필요한 부분만 꺼내서 가져오겠다.



### Repositories 구조

- upstream (Upstream Repository) : 프로젝트 remote
- origin (Origin Repository) : upstream을 fork한 레포

![image](https://user-images.githubusercontent.com/40619551/68527652-9450f780-032c-11ea-81ee-b2fa6fd2914f.png)



### 브랜치 종류

- master : 제품으로 출시될 수 있는 브랜치
- develop : 다음 출시 버전을 개발하는 브랜치
- feature : 기능을 개발하는 브랜치
- release : 이번 출시 버전을 준비하는 브랜치
- hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치

![image](https://user-images.githubusercontent.com/40619551/68527668-dbd78380-032c-11ea-9903-4422cc19b0e6.png)

