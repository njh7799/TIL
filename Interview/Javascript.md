# Javascript

js 문법은 아래 두 링크만 다 봐도 거의 커버 가능하다. 더 어려운 질문이 나온다면 이 밖에서 나오지 않고 이 안에서 더 심화해서 나올 것이다.

## Ref

- [front-end-interview-handbook](https://github.com/yangshun/front-end-interview-handbook/blob/master/contents/kr/javascript-questions.md)
- https://poiemaweb.com/
- [Lucas](https://lucas.codesquad.kr/course/boost-4-membership/그룹프로젝트수업/week-7-2-JS개발자의-흔한-질문)

[js 실행과 컨텍스트](https://poiemaweb.com/js-execution-context)

[this](https://poiemaweb.com/js-this)

> 1. 함수 호출
> 2. 메소드 호출
> 3. 생성자 함수 호출
> 4. apply/call/bind 호출

> 자바스크립트의 경우 함수 호출 방식에 의해 [this](https://poiemaweb.com/js-this)에 바인딩할 어떤 객체가 동적으로 결정된다. 다시 말해, 함수를 선언할 때 this에 바인딩할 객체가 정적으로 결정되는 것이 아니고, **함수를 호출할 때 함수가 어떻게 호출되었는지에 따라** this에 바인딩할 객체가 동적으로 결정된다.

> function Person(name) {  // new없이 호출하는 경우, 전역객체에 name 프로퍼티를 추가
> this.name = name;
> };

[this arrow function](https://poiemaweb.com/es6-arrow-function)

> 화살표 함수는 함수를 선언할 때 this에 바인딩할 객체가 정적으로 결정된다. 동적으로 결정되는 일반 함수와는 달리 **화살표 함수의 this 언제나 상위 스코프의 this를 가리킨다.** 이를 **Lexical this**라 한다. 

[Common JS & AMD](https://d2.naver.com/helloworld/12864)

> AMD가 목표로 하는 것은 필요한 모듈을 네트워크를 이용해 내려받아야 하는 브라우저 환경에서도 모듈을 사용할 수 있도록 표준을 만드는 일이다. 
>
> 필요한 파일이 모두 로컬 디스크에 있어 바로 불러 쓸 수 있는 상황, 즉 서버사이드에서는 CommonJS 명세가 AMD 방식보다 간결하다. 반면 필요한 파일을 네트워크를 통해 내려받아야 하는 브라우저와 같은 환경에서는 AMD가 CommonJS보다 더 유연한 방법을 제공한다.

ECMA script

> ECMAScript는 자바스크립트 표준 단체인 ECMA가 제정하는 자바스크립트 표준이다.

[ES2020](https://junhobaik.github.io/es2016-es2020/)

[ES6](https://blog.asamaru.net/2017/08/14/top-10-es6-features/)

> 1. 기본 매개 변수 (Default Parameters)
> 2. 템플릿 리터럴 (Template Literals)
> 3. 멀티 라인 문자열 (Multi-line Strings)
> 4. 비구조화 할당 (Destructuring Assignment)
> 5. 향상된 객체 리터럴 (Enhanced Object Literals)
> 6. 화살표 함수 (Arrow Functions)
> 7. Promises
> 8. 블록 범위 생성자 Let 및 Const (Block-Scoped Constructs Let and Const)
> 9. 클래스 (Classes)
> 10. 모듈 (Modules)

[ES5](https://k39335.tistory.com/81)

> map, forEach 등 array 메소드들

Polyfill: 웹 개발에서 폴리필은 기능을 지원하지 않는 웹 브라우저에서 기능을 구현하는 코드다.

[Ajax](https://coding-factory.tistory.com/143)

>  Ajax는 JavaScript의 라이브러리중 하나이며 Asynchronous Javascript And Xml(비동기식 자바스크립트와 xml)의 약자입니다. 브라우저가 가지고있는 XMLHttpRequest 객체를 이용해서 전체 페이지를 새로 고치지 않고도 페이지의 일부만을 위한 데이터를 로드하는 기법 이다. Ajax를 한마디로 정의하자면 JavaScript를 사용한 비동기 통신, 클라이언트와 서버간에 XML 데이터를 주고받는 기술이라고 할 수 있겠습니다.
>
>  ajax는 html 페이지 전체가아닌 일부분만 갱신할수 있도록 XML HttpRequest객체를 통해 서버에 request를 합니다.

[Promise vs async await](https://medium.com/better-programming/should-i-use-promises-or-async-await-126ab5c98789)

> 특정 비동기 작업에 대한 결과를 기다리지 않고 코드를 진행하며 응답이 왔을 때 응답을 처리하는 방법을 취할 때는 Promise. 비동기 작업에 대한 응답이 있어야 다음 코드를 실행할 수 있는 경우에는 async await가 더 좋다. 물론 둘 다 서로가 유리한 경우에 사용 가능하다.

[Constant variables in javascript or when const isnt constant](https://mariusschulz.com/blog/constant-variables-in-javascript-or-when-const-isnt-constant)
> Object.freeze()
> 

[var, let, const 특징 및 호이스팅](https://medium.com/sjk5766/var-let-const-%ED%8A%B9%EC%A7%95-%EB%B0%8F-scope-335a078cec04)

래퍼 객체에 대해 추가 공부