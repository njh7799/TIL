# Node.js [ref](https://lucas.codesquad.kr/) +필기

## 왜 필요한가

- Node.js는 JS 런타임으로 빠르고 강력하다.
- 2019년 9월 현재까지 JS로 백엔드를 구축하는 유일한 방법이다.
- Node.js 런타임의 특징을 이해해야 JS로 견고한 백엔드 서비스를 구축할 수 있다.

------

## 학습 목표

- Node.js 런타임의 주요 특징을 설명할 수 있다.
- Node.js 의 주요 모듈들을 이해하고 사용할 수 있다.
- 비동기 처리의 장점에 대해 설명할 수 있다.
- Promise와 async-await를 사용해 비동기 처리를 할 수 있다.

------

## 학습 지식

### 배경 지식 익히기

- 웹 브라우져의 동작 원리
- Chrome V8 엔진

------

### 학습 방법

- 공식 문서를 반드시 읽는다.
- 생활코딩 등의 유무료 강좌 및 도서 등을 활용한다.

------

### node.js의 비동기 처리 메카니즘

- Sync VS Async
  - 동기 + 블로킹
  - 비동기 + 논 블로킹: 이벤트 핸들링이 필요. 콜백 함수로
  - nodejs는 single thread이기 때문에, 비동기로 짜야 됨.
- Promise와 async-await
- https://developers.google.com/web/fundamentals/primers/promises
- https://developers.google.com/web/fundamentals/primers/async-functions

------

### node.js 와 모듈

- 모듈의 사용법에 대해 숙지한다
- node.js에서 기본으로 제공하는 모듈에 대해 학습한다
- npm의 유명한 외부 모듈도 살펴본다

------

### node.js 프로젝트 구성

- npm을 이용한 package.json 생성
- npm start 명령을 이용한 시작 프로그램 실행
- npm test 명령을 이용한 테스트 수행

------

### node.js 디버깅하기

- 콘솔, Visual Studio Code, chrome 등을 통해 디버깅 가능
- `console.log()` 보다 디버깅을 적극적으로 활용한다

------

## 참고 자료

- https://nodejs.org/dist/latest-v10.x/docs/api/

------

## 주요 문서

- https://nodejs.org/en/docs/guides/getting-started-guide/
- https://nodejs.org/de/docs/guides/debugging-getting-started/
- https://nodejs.org/api/debugger.html

------

## 주요 node.js API

- https://nodejs.org/dist/latest-v10.x/docs/api/console.html
- https://nodejs.org/dist/latest-v10.x/docs/api/events.html
- https://nodejs.org/dist/latest-v10.x/docs/api/fs.html
- https://nodejs.org/dist/latest-v10.x/docs/api/http.html