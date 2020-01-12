### 기술적 도전

- 성능 최적화
  - 무한 스크롤
  - React-virtualized
  - 쿼리 최적화
  - 캐싱



## 사용 스택 What and Why

- javascript
- Typescript

### FrontEnd

- [React](https://velopert.com/3612)
  - [ReactJS의 Virtual DOM과 Repaint, Reflow](http://blog.drakejin.me/React-VirtualDOM-And-Repaint-Reflow/)
  - [왜 Virtual Dom 인가](https://velopert.com/3236)
  - [React 인가 Vue 인가](https://joshua1988.github.io/web_dev/vue-or-react/)
  - [React를 Vue.js보다 선호하는 이유](https://ahnheejong.name/articles/why-i-prefer-react-over-vuejs/)
  - [성능 최적화 공식 페이지](https://ko.reactjs.org/docs/optimizing-performance.html)
  - functional 과 class 차이
- SPA
  - [단점](https://m.mkexdev.net/374)
    - SPA 속도 저하: 코드 스플릿으로 해결~
    - [vs MPA](https://babytiger.netlify.com/posts/SPA/)                                                                                                                                                                                              


- Apollo

- styled Component

- react-virtualized

- Intersection-observer

### backend

- [node](https://asfirstalways.tistory.com/43) [하나 더](https://programmingsummaries.tistory.com/328)
  - [이벤트 루프과 스레딩 관련](https://meetup.toast.com/posts/89)
  - [루프 및 스레드](https://sjh836.tistory.com/149)
  - 멀티코어
- mysql2
- sequelize
  - ORM
- express
- [Graphql](https://tech.kakao.com/2019/08/01/graphql-basic/)
  - Rest
    - https://tv.naver.com/v/2292653
    - http://slides.com/eungjun/rest#/



# CS 기본기

[프레임 vs 라이브러리](https://webclub.tistory.com/458) + 제어의 역전

[의존성 주입](https://dayzen1258.tistory.com/entry/의존성-주입이란-DI)

[객체 지향 5대 원칙 SOLID](https://victorydntmd.tistory.com/291)

[객체 지향 4대 특성](https://psh85a.tistory.com/entry/C객체지향-프로그램의-4대-특징)

[Common JS & AMD](https://d2.naver.com/helloworld/12864)

[ECMAScript](https://jayzzz.tistory.com/63)

Polyfill: 기술 차이를 연결해주는 것. 바벨은 폴리필을 수행하는 라이브러리 중 하나

HTML5

[비즈니스 로직](https://m.blog.naver.com/anjdieheocp/20117559228)

[DAO DTO](https://m.blog.naver.com/PostView.nhn?blogId=godwings&logNo=221048712980&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

[primitive type과 reference type](https://hggggggk.wordpress.com/2013/07/04/첫번째과제2-primitive-type과-reference-type의-차이/)

[Object vs object vs {}](https://mariusschulz.com/blog/the-object-type-in-typescript)

[stack heap data](https://dsnight.tistory.com/50)

[async await vs Promise]

[컴파일과 인터프리팅](https://seodh007.tistory.com/entry/인터프리터언어-와-컴파일언어의-뜻)

[Ajax](https://coding-factory.tistory.com/143)

[Run time]

[Promise vs async await](https://medium.com/better-programming/should-i-use-promises-or-async-await-126ab5c98789)





# 성능 최적화

- [브라우저 성능 최적화 방법](https://ui.toast.com/fe-guide/ko_PERFORMANCE/)
- [리액트 성능 최적화 방법](https://ko.reactjs.org/docs/optimizing-performance.html)



## 한 것

- **메인 페이지 캐싱 전략 cach-first**

  - 이 부분은 인스타그램을 밴치마킹하여 정한 전략이다.

  - 현재 타임 라인의 캐싱 전략은 캐시가 없을 경우에만 요청을 보내고 캐시가 있을 경우에는 캐싱된 값을 보여준다. 이 방식을 취함으로써 요청을 줄일 수 있다.

  - 팔로우를 취소한다면?

    - 팔로우를 취소할 때, 취소한 유저의 게시글을 메인 페이지 캐시에서 filtering 을 통해 지워준다.

  - 팔로우를 한다면?

    - 새롭게 팔로우를 한다면, 메인 페이지 캐시에는 아무런 변화도 주지 않는다. 현재 캐싱된 값들은 사용자가 메인 페이지에 접속하기 직전에 게시된 포스트들일 것이다. 또한 새롭게 팔로우한 인물의 게시글들 중 가장 오래된 게시글이 내 메인 페이지에 캐싱된 값들보다 늦은 시간에 게시되었을 가능성은 크지 않다. 따라서 메인 페이지로 돌아가 무한 스크롤을 계속 하다 보면 새롭게 팔로우한 인물의 게시글이 보일 것이다. 물론 정말 우연히 내가 팔로우 하기 직전에 게시글이 추가되었을 수도 있지만, 이 경우까지 고려하는 것은 낭비라고 판단하였다.

    

    

- **무한 스크롤 적용**

- **windowing 기법 적용**

  - 초기 렌더링 속도를 개선할 수 있었다. `display:none` 설정을 추가 하여도 초기 렌더링 속도가 크게 차이가 없다는 점에서, 초기 돔 트리를 구성하는 부분에서 병목 현상이 발생하였음을 알 수 있었다.

## 안한 것

- 실시간 동기화
  
  - 팔로워가 게시글을 작성할 때 마다 피드를 업데이트 시키면 오버헤드가 엄청날 것이다. 인스타그램의 특성상 새로운 게시글이 초단위로 올라오지 않기 때문에, 실시간 업데이트가 주는 사용성 증가와 실시간 업데이트를 적용함으로써 느려지는 사용성 저하를 비교하였을 때 후자의 단점이 전자의 장점보다 크기 때문에 적용하지 않았다.
  
  

## 하고 싶은 것

- 네트워크 상황이 안좋을 때 이미지 처리
  - 회색의 빈 화면을 로드하고 이미지가 들어오면 교체
  - 저화질로 압축한 파일을 먼저 보여준 후 네트워크 상황이 나아지면 고화질로 변경

- 캐싱 전략
  - 메인 페이지 접속 이후 상세 페이지 접근시 캐시 참조