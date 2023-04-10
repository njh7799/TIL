- [DOM](https://m.blog.naver.com/magnking/220972680805)
- https://blog.logrocket.com/how-browser-rendering-works-behind-scenes/

# 성능 최적화

- [웹과 브라우저를 위한 프로파일링과 성능 개선](https://tv.naver.com/v/23652467)
- [자바스크립트 웹 사이트 최적화](https://12bme.tistory.com/127)
- [Optimize Website Speed With Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools/speed/get-started)
- [성능 최적화](https://ui.toast.com/fe-guide/ko_PERFORMANCE/)
- [성능 최적화 - React](https://ko.reactjs.org/docs/optimizing-performance.html)
- [10 Ways to Optimize Your React App’s Performance](https://blog.bitsrc.io/10-ways-to-optimize-your-react-apps-performance-e5e437c9abce)
- [How browser rendering works — behind the scenes](https://blog.logrocket.com/how-browser-rendering-works-behind-the-scenes-6782b0e8fb10/)
- [Chrome Devtools를 활용한 웹 프론트엔드 성능 측정과 개선](https://slides.com/jbee/devfest_seoul_2018_performance_optimization_with_chrome_devtools#/2)
- [Reflow or Repaint(or ReDraw)과정 설명 및 최적화 방법](https://webclub.tistory.com/346)
- [10 Ways to Minimize Reflows and Improve Performance](https://www.sitepoint.com/10-ways-minimize-reflows-improve-performance/)
- [The ultimate guide **to proper use of animation in UX**](https://uxdesign.cc/the-ultimate-guide-to-proper-use-of-animation-in-ux-10bd98614fa9)



# [React](https://velopert.com/3612)

`리액트`는 `컴포넌트` 기반의 `라이브러리`이다.

- [라이프 사이클](https://velopert.com/3631)


## Reflow 와 Repaint

- [Reflow 와 Repaint](https://webclub.tistory.com/346)

  > 1. 변경이 잦은 요소는 Absolute에 배치합니다.
  >2. 스타일 변경은 한번에 묶어서 처리합니다.
  > 3. 테이블은 점진적 배치에서 제외되기 때문에 사용을 지양합니다.
  >4. CSS에서의 JS표현식을 피합니다. (ex. 3항 연산자 등)
  > 5. 스타일을 최적화 합니다. (ex. css 최소화)


- SPA

  - [단점](https://m.mkexdev.net/374)
    - SPA 속도 저하: 코드 스플릿으로 해결~ & 초기 렌더링 속도 느린거 SSR로 해결
    - SEO [Prerender](https://prerender.io/) 으로 해결 (브라우저에서 JavaScript를 렌더링하고, 정적 HTML을 저장한 다음, 크롤러에게 반환)
    - [vs MPA](https://babytiger.netlify.com/posts/SPA/)                                                                                                                                                                                              


- [SSR vs CSR](https://velog.io/@rjs1197/SSR과-CSR의-차이를-알아보자)

- [A React job interview — recruiter perspective.](https://medium.com/@baphemot/a-react-job-interview-recruiter-perspective-f1096f54dd16)


# 웹팩
웹 애플리케이션을 구성하는 자원(HTML, CSS, Javscript, Images 등)을 모두 각각의 모듈로 보고 이를 조합해서 병합된 하나의 결과물을 만드는 모듈 번들러이다.
- [구성](http://jeonghwan-kim.github.io/js/2017/05/15/webpack.html)

> **엔트리**: 의존성 그래프의 시작점. 웹팩은 엔트리를 통해서 필요한 모듈을 로딩한고 하나의 파일로 묶는다.
>
> **아웃풋**: 번들된 결과물을 처리할 위치
>
> **로더**:비 자바스크립트 파일을 웹팩이 이해하게끔 변경.(CSS 등) 파일단위로 처리
>
> **플러그인**: 번들된 결과물을 처리(예시. Uglify)

# 바벨

- [공식](https://babeljs.io/docs/en/)

> 공식문서에 따르면 바벨은 컴파일러이며  ECMAScript 2015+ 이상의 문법을 예전 버전의 브라우저에서도 호환이 될 수 있도록 변환해주는 툴체인이다. 신택스 변환, 폴리필, 코드변환 등의 기능을 수행한다.

- [동작 원리 및 흐름](https://moonformeli.tistory.com/28)

> **파싱**: 소스 코드로 부터 추상 구문 트리를 만듦. **babel-parser** 라는 이름의 플러그인이 수행
>
> **변환**: AST를 브라우저의 환경에 맞게 AST를 변환.  **preset/plugin** 이 **babel-traverse**를 이용하여 수행
>
> **코드 생성**: 실제 브라우저의 환경에 맞는 코드를 생성. **babel-generator** 가 수행

- [core js](https://github.com/zloirock/core-js/blob/master/docs/2019-03-19-core-js-3-babel-and-a-look-into-the-future.md)

## **폴리필**

폴리필(polyfill)은 웹 개발에서 기능을 지원하지 않는 웹 브라우저 상의 기능을 구현하는 코드를 뜻한다.
