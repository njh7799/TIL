# REST API

## 문서

[wiki](https://en.wikipedia.org/wiki/Representational_state_transfer)



## 영상

[Restapitutorial](https://www.restapitutorial.com/)

[그런 REST API로 괜찮은가](https://tv.naver.com/v/2292653) [발표 자료](http://slides.com/eungjun/rest#/4)



# 그런 REST API로 괜찮은가

REST는 hybrid architecture style이다. architecture style이면서 동시에 architecture style의 집합이기 때문.

---

## [REST를 구성하는 스타일](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)

- client-server
- stateless
- cache
- **uniform interface**
- layered system
- code-on-demand (optional): 서버에서 코드를 클라이언트로 보내서 실행할 수 있어야 한다.

위에서 **uniform interface** 가 가장 만족시키기 힘들다

---

## [Uniform Interface의 제약조건](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm#sec_5_1_5)

- identification of resources
  - resource가 uri로 식별되면 된다.
- manipulation of resources through representations
- **self-descriptive messages**
- **hypermedia as the engine of application state (HATEOAS)**

Uniform Interface 제약 조건에서 아래 두가지를 거의 항상 만족시키지 못한다.

---

## Self-descriptive message

### 메시지는 스스로를 설명해야한다.

### 메시지의 내용으로 메시지가 온전히 해석이 다 되어야 한다. 

### Case1

```bash
GET / HTTP/1.1
```

이 HTTP 요청 메시지는 뭔가 빠져있어서 self-descriptive 하지 못하다.

```bash
GET / HTTP/1.1
Host: www.example.org
```

목적지를 추가하면 이제 self-descriptive

### Case2

```bash

HTTP/1.1 200 OK

[ { "op": "remove", "path": "/a/b/c" } ]

```
이게 어떤 문법으로 작성 된건지 모르기 때문에, 해석이 불가하다.

```bash
HTTP/1.1 200 OK
Content-Type: application/json

[ { "op": "remove", "path": "/a/b/c" } ]
```

분석이 가능하다! 하지만 아직 self-descriptive는 아니다. op 와 path가 무슨 의미인지 모르기 때문

```bash
HTTP/1.1 200 OK
Content-Type: application/json-patch+json

[ { "op": "remove", "path": "/a/b/c" } ]
```

이제 올바르게 메시지를 해석할 수 있다.

---


## HATEOAS
### 애플리케이션의 상태는 Hyperlink를 이용해 전이되어야한다.

---

그래서 왜 Uniform interface가 필요한데?

## 독립적 진화

- 서버와 클라이언트가 각각 독립적으로 진화한다.
- **서버의 기능이 변경되어도 클라이언트를 업데이트할 필요가 없다.**
- REST를 만들게 된 계기: "[How do I improve HTTP without breaking the Web."](https://www.infoq.com/articles/roy-fielding-on-versioning)

---

## Self-descriptive와 HATEOAS가 독립적 진화에 어떻게 도움이 되는가?

### Self-descriptive
확장 가능한 커뮤니케이션
서버나 클라이언트가 변경되더라도 오고가는 메시지는 언제나 self-descriptive 하므로
언제나 해석이 가능하다.

### HATEOAS
애플리케이션 상태 전이의 late binding
어디서 어디로 전이가 가능한지 미리 결정되지 않는다. 어떤 상태로 전이가 완료되고 나서야 그 다음 전이될 수 있는 상태가 결정된다.
쉽게 말해서: 링크는 동적으로 변경될 수 있다

---

## REST API로 바꿔보자

![image](https://user-images.githubusercontent.com/40619551/65571923-65134080-dfa1-11e9-9d26-90d3400ceaff.png)

![image](https://user-images.githubusercontent.com/40619551/65572004-a99edc00-dfa1-11e9-9e42-739e13debc76.png)



![image](https://user-images.githubusercontent.com/40619551/65572042-c3402380-dfa1-11e9-8128-f7d56a638117.png)

---

![image](https://user-images.githubusercontent.com/40619551/65572086-dd7a0180-dfa1-11e9-81fe-8bb8ac29cfa5.png)

![image](https://user-images.githubusercontent.com/40619551/65572143-11edbd80-dfa2-11e9-86e9-79c099281126.png)



![image](https://user-images.githubusercontent.com/40619551/65572172-334ea980-dfa2-11e9-909e-0b40de9f4df9.png)



---

## 정리

- 오늘날 대부분의 "REST API"는 사실 REST를 따르지 않고 있다.

- REST의 제약조건 중에서 특히  **Self-descriptive**와 **HATEOAS**를 잘 만족하지 못한다.

- REST는 **긴 시간에 걸쳐(수십년) 진화**하는 웹 애플리케이션을 위한 것이다.

- REST를 따를 것인지는 API를 설계하는 이들이 스스로 판단하여 결정해야한다.

- REST를 따르겠다면,

   

  Self-descriptive

  와

   

  HATEOAS

  를 만족시켜야한다.

  - Self-descriptive는 **custom**  **media type**이나 **profile** **link relation** 등으로 만족시킬 수 있다.
  - HATEOAS는 HTTP 헤더나 본문에 **링크**를 담아 만족시킬 수 있다.

- REST를 따르지 않겠다면, "REST를 만족하지 않는 REST API"를 뭐라고 부를지 결정해야 할 것이다.

  - HTTP API라고 부를 수도 있고
  - 그냥 이대로 REST API라고 부를 수도 있다. (roy가 싫어합니다)