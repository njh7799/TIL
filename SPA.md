# SPA

## 구조

- 프론트 서버와 백엔드 API 서버를 별도로 만든다.
- 프론트 서버는 nginX 를 이용하여 만들고 백엔드는 node 서버를 이용하여 만든다. (다른 방법도 가능하긴 함)
- 프론트 서버에서 API 서버에 요청을 보내, html, js 등의 데이터를 받는다.
- vanilla 의 경우: innerHTML을 이용하여 html을 렌더링 하고 js 파일을 addEventListener를 통해 묶어서 실행한다.
- id 사용을 최소화 하고 페이지가 달라도 id가 겹치면 안된다.

