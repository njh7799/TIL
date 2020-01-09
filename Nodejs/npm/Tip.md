# CLI 명령어 글로벌로 안하고 사용하기

tsc 등의 CLI 문법을 사용하고 싶을 경우 `yarn add --global jest`와 같이 글로벌에 설치하면 된다. 하지만 필자는 패키지는 글로벌에 설치하는 것을 매우 싫어하기 때문에, 로컬에서만 사용하는 방법을 알아보자.

1. devDependency 로 설치

```shell
yarn add jest -D
```

2. 실행

```json
npx jest
yarn jest
```
