## 기본 개념 정리

⭐️ [브라우저 렌더링 과정](https://blog.logrocket.com/how-browser-rendering-works-behind-the-scenes-6782b0e8fb10/)

- [자바스크립트 async defer](https://blog.asamaru.net/2017/05/04/script-async-defer/)

[프레임 vs 라이브러리](https://webclub.tistory.com/458) + 제어의 역전

[의존성 주입](https://dayzen1258.tistory.com/entry/의존성-주입이란-DI)

[객체 지향 5대 원칙 SOLID](https://victorydntmd.tistory.com/291)

[객체 지향 4대 특성](https://psh85a.tistory.com/entry/C객체지향-프로그램의-4대-특징)

HTML5

[비즈니스 로직](https://m.blog.naver.com/anjdieheocp/20117559228)

[DAO DTO](https://m.blog.naver.com/PostView.nhn?blogId=godwings&logNo=221048712980&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

[primitive type과 reference type](https://hggggggk.wordpress.com/2013/07/04/첫번째과제2-primitive-type과-reference-type의-차이/)

[Object vs object vs {}](https://mariusschulz.com/blog/the-object-type-in-typescript)

[stack heap data](https://dsnight.tistory.com/50)

[컴파일과 인터프리팅](https://seodh007.tistory.com/entry/인터프리터언어-와-컴파일언어의-뜻)

[Stack Heap Data](https://dsnight.tistory.com/50)

[cors](https://zamezzz.tistory.com/137)

[응집도와 결합도](https://lazineer.tistory.com/93)

[쿠키 세션](https://sdevstudy.tistory.com/27)

[쿠키 세션 로컬 스토리지](https://github.com/yangshun/front-end-interview-handbook/blob/master/Translations/Korean/questions/html-questions.md#cookie-sessionstorage-localstorage-사이의-차이점을-설명하세요)

[쿠키 세션 로그인](https://tansfil.tistory.com/58)

[인터넷 ㅋ구조](https://wiki.developer.mozilla.org/ko/docs/Learn/Common_questions/How_does_the_Internet_work)

[인터프리터 언어와 컴파일 언어](https://seodh007.tistory.com/entry/인터프리터언어-와-컴파일언어의-뜻)

![image](https://user-images.githubusercontent.com/40619551/73901169-5b95cf80-48d5-11ea-8dcf-558d23464dfa.png)



### 참고 자료

- [front-end-interview-handbook](https://github.com/yangshun/front-end-interview-handbook/tree/master/Translations/Korean/questions)
- [Interview_Question_for_Beginner](https://github.com/JaeYeopHan/Interview_Question_for_Beginner/tree/master/Development_common_sense)
- [Lucas](https://lucas.codesquad.kr/course/boost-4-membership/)

<br/>

## Javascript

[this](https://poiemaweb.com/js-this)

[this arrow function](https://poiemaweb.com/es6-arrow-function)

> 화살표 함수는 함수를 선언할 때 this에 바인딩할 객체가 정적으로 결정된다. 동적으로 결정되는 일반 함수와는 달리 **화살표 함수의 this 언제나 상위 스코프의 this를 가리킨다.** 이를 **Lexical this**라 한다. 

[Common JS & AMD](https://d2.naver.com/helloworld/12864)

> AMD가 목표로 하는 것은 필요한 모듈을 네트워크를 이용해 내려받아야 하는 브라우저 환경에서도 모듈을 사용할 수 있도록 표준을 만드는 일이다. 
>
> 필요한 파일이 모두 로컬 디스크에 있어 바로 불러 쓸 수 있는 상황, 즉 서버사이드에서는 CommonJS 명세가 AMD 방식보다 간결하다. 반면 필요한 파일을 네트워크를 통해 내려받아야 하는 브라우저와 같은 환경에서는 AMD가 CommonJS보다 더 유연한 방법을 제공한다.

[ECMAScript](https://jayzzz.tistory.com/63)

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

Polyfill: 기술 차이를 연결해주는 것. 바벨은 폴리필을 수행하는 라이브러리 중 하나

> 자바스크립트의 경우 함수 호출 방식에 의해 [this](https://poiemaweb.com/js-this)에 바인딩할 어떤 객체가 동적으로 결정된다. 다시 말해, 함수를 선언할 때 this에 바인딩할 객체가 정적으로 결정되는 것이 아니고, **함수를 호출할 때 함수가 어떻게 호출되었는지에 따라** this에 바인딩할 객체가 동적으로 결정된다.

> function Person(name) {  // new없이 호출하는 경우, 전역객체에 name 프로퍼티를 추가
> this.name = name;
> };

[Ajax](https://coding-factory.tistory.com/143)

>  Ajax를 한마디로 정의하자면 JavaScript를 사용한 비동기 통신, 클라이언트와 서버간에 XML 데이터를 주고받는 기술이라고 할 수 있겠습니다.
>
>  ajax는 html 페이지 전체가아닌 일부분만 갱신할수 있도록 XML HttpRequest객체를 통해 서버에 request를 합니다.

[Promise vs async await](https://medium.com/better-programming/should-i-use-promises-or-async-await-126ab5c98789)

<br/>

## FrontEnd

### [React](https://velopert.com/3612) (프레임워크 or 모듈 정보 포함)

- [동작 방식](https://medium.com/@gethylgeorge/how-virtual-dom-and-diffing-works-in-react-6fc805f9f84e)
- [네이버 D2 발 자료](https://d2.naver.com/helloworld/9297403)

> **re-rendering 동작 과정**
>
> 1. setState 를 이용하여 state 를 변경시킨다. 이 때 setState 가 호출되면  해당 컴포넌트를 변경 대상 컴포넌트(dirty component)로 마킹한다.
> 2. **가상 돔 갱신** React의 batch update가 수행한다. dirty한 컴포넌트들과 하위 노드들을 업데이트한다. 이 때 shouldComponentUpdate가 false 이면 해당 컴포넌트는 가상돔에 업데이트 되지 않는다.
> 4. 직전의 가상돔과 현재의 가상돔을 비교한여 갱신한다. 휴리스틱 알고리즘을 사용하며 이 과정을 재조정이라고 한다. 재 조정은 두 노드의 엘리먼트 타입을 비교한다. 같으면 속성 값만 갱신하며 다를 경우 이전 트리를 버리고 새로운 트리를 구축한다.
> 5. 재조정 후 수정 대상이 되는 값들을 한 번에 처리
> 
>* Key 값이 없으면 재조정시, 속성값등을 다 바꾸어 주어야 함.
> * Render is where the Virtual DOM gets re-build and the diffing happens

> **장점 요약**
>
> 1. **Dom 관리와 상태 관리**
>
>    웹 개발을 하게 될 때,  DOM 관리와 상태값 업데이트 관리를 최소화하고, 오직 기능 개발, 그리고 사용자 인터페이스를 구현하는 것에 집중 할 수 있도록 해준다.
>
> 2. **Virtual Dom**
>
>    렌더링을 하기 전에 가상 돔을 먼저 만들어서 비교한다. **다른 부분**만 다시 렌더링 한다.
>
>    * Hueristic 알고리즘: 뭐가 다른지 판단하는 O(N) 알고리즘
>      * Key가 중요한 이유
>
> 3. **묶어서 한 번에**
>
>    여러 인터렉션이 발생할 때마다 매번 돔을 다시 그려 reflow, repaint 하는 것은 매우 비효율적이다. React 는 이 작업들을 묶어서 한 번에 처리를 해준다. 즉 연산이 줄어든다. (규모는 커지지만)

- [DOM](https://m.blog.naver.com/magnking/220972680805)

- [ReactJS의 Virtual DOM과 Repaint, Reflow](http://blog.drakejin.me/React-VirtualDOM-And-Repaint-Reflow/)

- [재조정](https://ko.reactjs.org/docs/reconciliation.html#recursing-on-children)

- [Key](https://ko.reactjs.org/docs/lists-and-keys.html)

- [왜 Virtual Dom 인가](https://velopert.com/3236)

- [Reflow 와 Repaint](https://webclub.tistory.com/346)

  > 1. 변경이 잦은 요소는 Absolute에 배치합니다.
  >
  > 2. 스타일 변경은 한번에 묶어서 처리합니다.
  >
  > 3. 테이블은 점진적 배치에서 제외되기 때문에 사용을 지양합니다.
  >
  > 4. CSS에서의 JS표현식을 피합니다. (ex. 3항 연산자 등)
  >
  > 5. 스타일을 최적화 합니다. (ex. css 최소화)
  >
  >    

- [성능 최적화 공식 페이지](https://ko.reactjs.org/docs/optimizing-performance.html)

- [왜 라이브러리인가](https://develoger.com/is-reactjs-library-or-a-framework-a14786f681a0)

  > - 리액트는 템플리이나 디자인 패턴을 가지고 있지 않다. 어플리케이션의 구조에 전혀 관여하지 않는다.
  > - 라이프 사이클이 제어의 역전을 나타낸다고 할 수도 있지만, 이정도는 jQuery도 가능 했으며 결과론적으로 봤을 때 구조적은 해결해 주지 않는다.
  > - 본질적인 프레임 워크는 코드 수준에서 구조적 및 아키텍쳐적 문제를 해결한다. 하지만 리액트는 전혀 아니다.

- [라이프 사이클](https://velopert.com/3631)

  - [will 을 대거 삭제한 이유](https://velog.io/@kyusung/리액트-교과서-컴포넌트와-라이프사이클-이벤트)

    > - 초기 렌더링을 제어하는 방법이 많아져서 혼란이 됨.
    > - 오류 처리 인터럽트 동작시에 메모리 누수 발생할 수 있음.
    > - React 커뮤니티에서도 가장 혼란을 야기하는 라이프 사이클

- [함수형과 클래스형](https://overreacted.io/ko/how-are-function-components-different-from-classes/)

  > - Props는 리액트에서 불변(immutable) 값이다. **하지만, `this`는 \*변경 가능하며(mutable)\*, 조작할 수 있다.**
  >
  >   그것이 `this`가 클래스에서 존재하는 목적이다. 리액트가 시간이 지남에 따라 이를 변경하기 때문에 `render`나 라이프사이클 메서드를 호출할 때 업데이트된 값들을 읽어 올 수 있는 것이다.

- [Hooks의 의존성](https://rinae.dev/posts/a-complete-guide-to-useeffect-ko#리액트에게-의존성으로-거짓말하지-마라)

- [React 인가 Vue 인가](https://joshua1988.github.io/web_dev/vue-or-react/)

  > 리액트는 템플릿을 문자열로 표현하지 않으므로 여러 정보를 잃어버리지 않는다.

- [React를 Vue.js보다 선호하는 이유](https://ahnheejong.name/articles/why-i-prefer-react-over-vuejs/)

  

- SPA
  - [단점](https://m.mkexdev.net/374)
    - SPA 속도 저하: 코드 스플릿으로 해결~
    - [vs MPA](https://babytiger.netlify.com/posts/SPA/)                                                                                                                                                                                              


- [Apollo](https://d2.naver.com/helloworld/4245995)
- [SSR vs CSR](https://velog.io/@rjs1197/SSR과-CSR의-차이를-알아보자)

### [웹팩](http://jeonghwan-kim.github.io/js/2017/05/15/webpack.html)

> **엔트리**: 의존성 그래프의 시작점. 웹팩은 엔트리를 통해서 필요한 모듈을 로딩한고 하나의 파일로 묶는다.
>
> **아웃풋**: 번들된 결과물을 처리할 위치
>
> **로더**:비 자바스크립트 파일을 웹팩이 이해하게끔 변경. 파일단위로 처리
>
> **플러그인**: 번들된 결과물을 처리(예시. Uglify)

### [바벨](https://moonformeli.tistory.com/28)

> **파싱**: 소스 코드로 부터 추상 구문 트리를 만듦. **babel-parser** 라는 이름의 플러그인이 수행
>
> **변환**: AST를 브라우저의 환경에 맞게 AST를 변환.  **preset/plugin** 이 **babel-traverse**를 이용하여 수행
>
> **코드 생성**: 실제 브라우저의 환경에 맞는 코드를 생성. **babel-generator** 가 수행

<br/>


## backend

### node

- [Node js란 무엇인가?](https://asfirstalways.tistory.com/43)
-  [Node js 이해하기](https://programmingsummaries.tistory.com/328)
- [자바 스크립트와 이벤트 루프](https://meetup.toast.com/posts/89)

> 자바스크립트가 '단일 스레드' 기반의 언어라는 말은 '자바스크립트 엔진이 단일 호출 스택을 사용한다'는 관점에서만 사실이다. 실제 자바스크립트가 구동되는 환경(브라우저, Node.js등)에서는 주로 여러 개의 스레드가 사용되며, 이러한 구동 환경이 단일 호출 스택을 사용하는 자바 스크립트 엔진과 상호 연동하기 위해 사용하는 장치가 바로 '이벤트 루프'인 것이다.
- [루프 및 스레드](https://sjh836.tistory.com/149)
- [멀티 스레드 -> 비동기](http://www.nextree.co.kr/p7292/)
- [싱글 스레드인가?](https://sjh836.tistory.com/79)

> 싱글스레드 기반의 이벤트루프가 계속 돌면서 요청을 처리한다. io요청이 있는 경우, 쓰레드풀에 던져둔다. 여기에는 워커들이 여러개있다. 사용자가 작성할때가 싱글쓰레드다.
>
> 즉, 이벤트루프만 싱글스레드라서 req, res이 싱글쓰레드인거지 뒤에서 열심히 일하는 워커(io처리)들은 여러개(멀티쓰레드)이다.
>
> 이벤트루프만 blocking안되게 만들면, 워커들은 알아서 일나눠가지고 돌아간다.
>

- [Node 와 express](https://ithub.tistory.com/32)

- [왜 노드에서는 import 를 못쓸까](https://www.daleseo.com/js-babel-node/)

  > 노드는 CommonJs 의 모듈 시스템을 사용하기 때문
  
- [노드의 모듈](https://nodejs.org/api/esm.html)


- sequelize
  
  - [ORM](https://gmlwjd9405.github.io/2019/02/01/orm.html)
  
- express

  - [Express Koa Hapi](https://avengersrhydon1121.tistory.com/101)
  
### [Graphql](https://tech.kakao.com/2019/08/01/graphql-basic/)

  > Graph QL(이하 gql)은 Structed Query Language(이하 sql)와 마찬가지로 쿼리 언어입니다
  >
  > sql은 **데이터베이스 시스템**에 저장된 데이터를 효율적으로 가져오는 것이 목적이고, gql은 **웹 클라이언트**가 데이터를 서버로 부터 효율적으로 가져오는 것이 목적입니다.
  >
  > gql이 제공하는 추가 기능 덕분에 백엔드 프로그래머와 프론트엔드 프로그래머의 협업 방식 에도 영향을 줍니다. 이전 협업 방식(REST API)에서는 프론트앤드 프로그래머는 백앤드 프로그래머가 작성하여 전달하는 API의 request / response의 형식에 의존하게 됩니다. 그러나, gql을 사용한 방식에 서는 이러한 의존도가 많이 사라집니다. 다만 여전히 데이터 schema에 대한 협업 의존성은 존재합니다.
  >
  > **Resolver**
  >
  > gql에서 데이터를 가져오는 구체적인 과정은 resolver(이하 리졸버)가 담당한다.
  >
  > gql 쿼리에서는 각각의 필드마다 함수가 하나씩 존재 한다고 생각하면 됩니다. 이 함수는 다음 타입을 반환합니다. 이러한 각각의 함수를 리졸버(resolver)라고 합니다.

### [Rest](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)

- https://tv.naver.com/v/2292653
- http://slides.com/eungjun/rest#/

#  프로젝트

## 성능 최적화

- [브라우저 성능 최적화 방법](https://ui.toast.com/fe-guide/ko_PERFORMANCE/)
- [리액트 성능 최적화 방법](https://ko.reactjs.org/docs/optimizing-performance.html)
- [리액트 성능 최적화 추가](https://blog.bitsrc.io/10-ways-to-optimize-your-react-apps-performance-e5e437c9abce)



## 한 것

### 메인 페이지 캐싱 전략 cach-first

- 이 부분은 인스타그램을 밴치마킹하여 정한 전략이다.

- 현재 타임 라인의 캐싱 전략은 캐시가 없을 경우에만 요청을 보내고 캐시가 있을 경우에는 캐싱된 값을 보여준다. 이 방식을 취함으로써 요청을 줄일 수 있다.

- 팔로우를 취소한다면?

  - 팔로우를 취소할 때, 취소한 유저의 게시글을 메인 페이지 캐시에서 filtering 을 통해 지워준다.

- 팔로우를 한다면?

  - 새롭게 팔로우를 한다면, 메인 페이지 캐시에는 아무런 변화도 주지 않는다. 현재 캐싱된 값들은 사용자가 메인 페이지에 접속하기 직전에 게시된 포스트들일 것이다. 또한 새롭게 팔로우한 인물의 게시글들 중 가장 오래된 게시글이 내 메인 페이지에 캐싱된 값들보다 늦은 시간에 게시되었을 가능성은 크지 않다. 따라서 메인 페이지로 돌아가 무한 스크롤을 계속 하다 보면 새롭게 팔로우한 인물의 게시글이 보일 것이다. 물론 정말 우연히 내가 팔로우 하기 직전에 게시글이 추가되었을 수도 있지만, 이 경우까지 고려하는 것은 낭비라고 판단하였다.

  

### 무한 스크롤 적용

### windowing 기법 적용

  - 초기 렌더링 속도를 개선할 수 있었다. `display:none` 설정을 추가 하여도 초기 렌더링 속도가 크게 차이가 없다는 점(2.7 -> 2.6)에서, 초기 돔 트리를 구성하는 부분에서 병목 현상이 발생하였음을 알 수 있었다.

## 안한 것

### 실시간 동기화
  - 팔로워가 게시글을 작성할 때 마다 피드를 업데이트 시키면 오버헤드가 엄청날 것이다. 인스타그램의 특성상 새로운 게시글이 초단위로 올라오지 않기 때문에, 실시간 업데이트가 주는 사용성 증가와 실시간 업데이트를 적용함으로써 느려지는 사용성 저하를 비교하였을 때 후자의 단점이 전자의 장점보다 크기 때문에 적용하지 않았다.

<br/>

## 하고 싶은 것

### 네트워크 상황이 안좋을 때 이미지 처리
  - 회색의 빈 화면을 로드하고 이미지가 들어오면 교체
  - 저화질로 압축한 파일을 먼저 보여준 후 네트워크 상황이 나아지면 고화질로 변경


### 캐싱 전략
  - 메인 페이지 접속 이후 상세 페이지 접근시 캐시 참조


### 스크롤 위치 저장
  - 다른 페이지 갔다가 돌아왔을 때 스크롤 위치가 보존

<br/>

## 힘들었던 점(기술)

### 무한 스크롤

요청에 대한 결과가 돌아와서 loading이 false가 되었는데, 결과가 들어와서 캐시가 변경되기 전에 요청을 다시 보내게 되면 캐시 변경전을 기준으로 요청을 보내기 때문에, 중복된 요청이 날아감.

#### 해결

- 요청을 보내는 즉시 observer를 disconnect & 응답이 와서 re-rendering이 될 때, 다시 observer 등록 => 데이터를 2회 이상 보내지 않음.
- 요청을 보내는 곳을 한 군데로 고정 => 요청 두개를 빠르게 보낼 경우 위의 문제가 발생할 수 있음. 한군데로 바꾸지 않고 위의 방식을 적용하면, 하나의 요청이 보내지는 즉시 observer 가 모두 해제 되기 때문에 그 다음 요청은 보내질 일이 없음.

## 힘들었던 점(팀플)

- 공부 시간의 부족
- 팀원과의 방향성 



## 그외 고민

### 최적화에 관하여

최적화라는게 기능이 많아지고 복잡해질 때 의미가 있는건데 그래서 지금 단계에서 그걸 고민하는게 맞는지 모르겠다. 그거에 대해서 고민해보면 좋겠다.
핵심기능이 작동하는 상황에서는 좋다고 생각한다. 



## 백엔드 개발

### 페이지네이션

- 데이터 베이스에 요청

### 질문 1. (large N) 명을 팔로우 하는 경우는 어떻게 처리할 것인가

> 1000명을 팔로우 하고 있는 경우를 가정해보자. 우선 팔로우 테이블 에서 내가 팔로우하고 있는 사용자의 리스트를 구해야 한다. 그리고 게시글 테이블에서 위 리스트를 where 절에 넣어서 검색을 한다. 전체 사용자가 지나치게 많아 게시글 테이블에 게시글이 너무 많고 내가 팔로우 하고 있는 사람들이 너무 많을 경우에 과부하가 걸리지 않는가?

### 답

> 해결 하기 힘든 문제이다. 실제로 페이스북은 이 문제를 해결하기 위해서 운영체제를 튜닝해서 사용하고 있다. 이러한 문제는 사용자가 10만명 이상 있어야 겨우 지연이 보이는 수준이기 때문에 현 단계에서는 고려할 필요가 없다.

> 사용자가 늘어나면 이런부분을 튜닝을 하겠다. 학습을 한다. 구현은 현재 상황에 맞게 나중에 스트레스가 올라갔을 때 나중에 유저가 많아지는 상황에 당면했을 때 어떻게 대응할건지 어떻게 문제를 해결할 것인지를 고민하고 해당 내용을 포함하라.

### 질문 2. 페이지네이션 질문

> limit와 offset을 지정해서 페이지네이션을 할 때에, 매번 orderby를 이용하여 테이블을 정렬하는가. 

### 답

> orderby에 인덱스를 설정해놓으면, 매번 정렬을 하는 것이 아니라 (엄밀히 말하면 맞는 것 같지만) 인덱스를 타는 것이기 때문에 큰 부담이 되지 않는다.

### 질문 3. 페이지네이션 원리

> limit를 사용할 경우, limit 만큼의 데이터만 찾고 search를 끝내는가

### 답

> 그렇다. 그렇기 때문에 더더욱 order by를 하면 안된다. order by를 할 경우에는 DB 전체의 테이블을 정렬하고 상단부터 limit개 만큼 가져오기 때문에 그 비용이 지나치다. order by가 들어가 있으면 기본적으로 잘못된 쿼리이다.

>  레코드를 쌓으면 시간의 역순으로 쌓이게 되어있다. 이를 이용하여 할 수 도 있다. 하지만 실제로 DB에 값이 들어갈 때 정확한 시간 순서가 보장되지 않을 수도 있다. 

> 하지만 index를 사용하면 괜찮다. index를 사용하여 order by를 하면, 이미 정렬이 되어 있기 때문에 전체 테이블을 검색하지 않는다.

> If) User 테이블에 Index를 설정하는데 User를 검색할 때에는 `길이순`으로 검색하고 싶을 경우에는 Index가 의미가 있을까? => 의미가 없다.

> If2) User가 사전 순서대로 b tree가 들어갈 때에 검색을 역 사전 순으로 하면  index의 효율성이 유지가 되는가? -=> 그렇다.

쿼리플랜 explain db에 엑세스하는 건 무조건 적어야한다. 인덱스를 걸어야한다. 보는게 중요한 서비스이기떄문에 읽기 최적화에 집중해야한다. 캐시를 하는게 좋다. 레디스랑 mysql 속도가 1000배쯤 차이가 난다. 인메모리 캐시같은걸 잘 활용해서 하면 순식간에 가져올 수 있다.

### 질문 4. 밀리 세컨드까지 같을 경우에 순서를 어떻게 보장할 것인가.

### order by를 두 번하는 방법

>  updatedAt만으로 정렬을 하는 것이 아니라 ['updatedAt', 'PK']로 정렬을 하는 방법.
>  정렬을 두번 한다는 점에서 비효율적이다.

### cursor에 lte를 적용하는 경우

>  현재 커서에서는 로드된 마지막 게시글의 작성 시간이 들어가있다. 현 방식은 cursor 값에 Op.lt를 적용하여 마지막 게시글 이후의 게시글 중에서 10개를 가져온다. 즉 모든 게시글의 작성 시간 값은 unique 하다는 것을 전제로 한다.
>
>  lte 방식을 이용하면, 마지막 게시글의 작성 시간이하(해당 시간 포함 및 이전 시간) 포함한 게시글들을 요청한다. 클라이언트에서 겹치는 게시글을 제외하고 렌더링 한다. 이 방식은 시간이 겹치는 게시글이 limit개 미만일 경우에만 정상 작동한다. limit개가 넘을 경우 cursor 값이 변경되지 않아 해당 시간의 게시글만 무한히 요청된다.

# 인적성

## 1분 자기 소개

​	안녕하십니까 저는 프론트엔드 개발자를 목표로하고 있는 남정호입니다. 저는 웹 개발자가 되기 위해 지난 여름 부스트 캠프 챌리지와 멤버십에 참여하였습니다. 챌린지 과정에서는 js 의 동작 원리와 기본 문법을 익혔으며 멤버십에서는 리액트와 노드를 이용한 프로젝트 관리 전반에 대햐여 배웠습니다. 특히 멤버십에서는 팀을 이루어 두 달간 프로젝트를 진행하며 실력을 키울 수 있었습니다. 

​	제가 속한 팀의 주제는 인스타그램의 클론이었습니다. 저는 팀에서 프론트엔드 성능 개선을 주로 맡았습니다. 인메모리 캐싱을 이용한 요청 최소화, 무한 스크롤, 윈도우잉 기법을 이용한 렌더링 부하 억제를 시도하였습니다.

## 왜 프론트엔드 개발자가 되고 싶은지

