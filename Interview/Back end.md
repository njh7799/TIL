# node

- [Node js란 무엇인가?](https://asfirstalways.tistory.com/43)
-  [Node js 이해하기](https://programmingsummaries.tistory.com/328)
- [자바 스크립트와 이벤트 루프](https://meetup.toast.com/posts/89)

> 자바스크립트가 '단일 스레드' 기반의 언어라는 말은 '자바스크립트 엔진이 단일 호출 스택을 사용한다'는 관점에서만 사실이다. 실제 자바스크립트가 구동되는 환경(브라우저, Node.js등)에서는 주로 여러 개의 스레드가 사용되며, 이러한 구동 환경이 단일 호출 스택을 사용하는 자바 스크립트 엔진과 상호 연동하기 위해 사용하는 장치가 바로 '이벤트 루프'인 것이다.
- [루프 및 스레드](https://sjh836.tistory.com/149)
- [멀티 스레드 -> 비동기](http://www.nextree.co.kr/p7292/)
- [Node.js의 기초(내부 아키텍처, 이벤트루프와 워커, 비동기의 이해)](https://sjh836.tistory.com/79)

> 싱글스레드 기반의 이벤트루프가 계속 돌면서 요청을 처리한다. io요청이 있는 경우, 쓰레드풀에 던져둔다. 여기에는 워커들이 여러개있다. 사용자가 작성할때가 싱글쓰레드다.
>
> 즉, 이벤트루프만 싱글스레드라서 req, res이 싱글쓰레드인거지 뒤에서 열심히 일하는 워커(io처리)들은 여러개(멀티쓰레드)이다.
>
> 이벤트루프만 blocking안되게 만들면, 워커들은 알아서 일나눠가지고 돌아간다.

- 진짜 한 번에 한 요청만 실행하는가?

> 코드를 짜고 여러 탭에서 접근해본 결과 한 요청이 끝난 후에야 다음 요청이 들어가는 것을 확인했다.

```js
app.get("/", (req, res) => {
  console.log("start", i);
  const now = new Date();
  while (new Date() - now < 5000);
  console.log("end", i);
  i += 1;
  return res.send("empty page");
});
```



- [Node 와 express](https://ithub.tistory.com/32)

- [왜 노드에서는 import 를 못쓸까](https://www.daleseo.com/js-babel-node/)

  > 노드는 CommonJs 의 모듈 시스템을 사용하기 때문
  
- [노드의 모듈](https://nodejs.org/api/esm.html)


- sequelize
  
  - [ORM이란](https://gmlwjd9405.github.io/2019/02/01/orm.html)
  
- express

  - [Express Koa Hapi](https://avengersrhydon1121.tistory.com/101)
  
# [Graphql](https://tech.kakao.com/2019/08/01/graphql-basic/)

  > GraphQL은 페이스북에서 만든 쿼리 언어입니다. Graph QL(이하 gql)은 Structed Query Language(이하 sql)와 마찬가지로 쿼리 언어입니다
  >
  > sql은 **데이터베이스 시스템**에 저장된 데이터를 효율적으로 가져오는 것이 목적이고, gql은 **웹 클라이언트**가 데이터를 서버로 부터 효율적으로 가져오는 것이 목적입니다.
  >
  > gql이 제공하는 추가 기능 덕분에 백엔드 프로그래머와 프론트엔드 프로그래머의 협업 방식 에도 영향을 줍니다. 이전 협업 방식(REST API)에서는 프론트앤드 프로그래머는 백앤드 프로그래머가 작성하여 전달하는 API의 request / response의 형식에 의존하게 됩니다. 그러나, gql을 사용한 방식에 서는 이러한 의존도가 많이 사라집니다. 다만 여전히 데이터 schema에 대한 협업 의존성은 존재합니다.
  >
  > 가령 특정 유저의 게시글 리스트를 요청하는 API가 있다고 할 때, 기능의 변화가 생겨 게시글과 댓글을 함께 가지고 오도록 변경하기 위헤선 Backend 개발자와 협의하여 API를 수정해야 하다. 하지만 graphQL을 사용하면 클라이언트 개발자가 gql을 조금만 변경함으로써 이를 쉽게 해결할 수 있다.
  >
  > younstargram의 팀원들은 모두 주니어 개발자였기 때문에, 처음부터 완벽하게 프로젝트를 계획하고 설계할 수 없었다. 따라서 api 변경의 필요가 잦았는데, graphQL을 사용함으로써 이를 보다 원활하게 해결할 수 있었다.
  >
  > **Resolver**
  >
  > gql에서 데이터를 가져오는 구체적인 과정은 resolver(이하 리졸버)가 담당한다.
  >
  > gql 쿼리에서는 각각의 필드마다 함수가 하나씩 존재 한다고 생각하면 됩니다. 이 함수는 다음 타입을 반환합니다. 이러한 각각의 함수를 리졸버(resolver)라고 합니다.

# [Rest](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)


- [REST란? REST API란? RESTful이란?](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)

> HTTP URI(Uniform Resource Identifier)를 통해 자원(Resource)을 명시하고, HTTP Method(POST, GET, PUT, DELETE)를 통해 해당 자원에 대한 CRUD Operation을 적용하는 것을 의미한다.
> 

- [REST API 제대로 알고 사용하기](https://meetup.toast.com/posts/92)
- https://tv.naver.com/v/2292653
- http://slides.com/eungjun/rest#/