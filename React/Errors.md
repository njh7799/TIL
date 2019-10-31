# Errors

- React Hook 을 사용할 때, 함수형 컴포넌트의 이름을 소문자로 시작한 경우 발생


````bash
React Hook "useContext" is called in function "personnel" which is neither a React function component or a custom React Hook function  react-hooks/rules-of-hooks
```

- ELIFECYCLE 에러

```bash
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! timetable@0.1.0 start: `react-scripts start`
npm ERR! Exit status 1
```

아주 높은 확률로 프로젝트 디렉토리의 상위 디렉토리 중 어딘가에 실수로 만들어진 node_modules 디렉토리가 존재할 것이다. 이 디렉토리를 지워버리면 된다.