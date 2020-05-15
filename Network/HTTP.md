# HTTP [ref](https://lucas.codesquad.kr/) +필기

## 네트워크

특정 객체가 커넥션을 가지고 연결 된 것을 의미한다.

일반적으로 네크워크는 컴퓨터 네트워크를 의미한다.

네트워크과 네트워크를 연결한 것을 인터넷이라고 한다.

인터넷의 중요한 특징: 보안 안전성 가용성 내구성 일부 네트워크가 고장나더라도 전체는 잘 돌아간다. 관리 주체가 없다. 각 국가에서 국가망을 관리하는 정도가 전부이다.

인터넷은 물리적으로 연결이 되어 있어야 한다.

### 왜 필요한가

- 네트워크 = 인터넷으로 인식되는 웹 스케일 서비스 시대에 대부분의 서비스는 HTTP를 통해 제공된다.
- HTTP의 동작 방식을 이해하는 것은 백엔드 개발에 필수적이다.
- 추상 누출(Leaky Abstraction)의 원리에 의하면 대부분의 기반 기술은 학습하는 것이 좋다.

## Web

- Web = WWW = World Wide Web
- 팀 버너스리에 의해 개발됨
- 웹과 인터넷은 원래는 다름
- 웹의 3요소: HTTP, HTML, URL

### 참고 영상

- TED 차세대 웹: https://tv.naver.com/v/35864
- 생활코딩 WEB2 HTTP: https://opentutorials.org/course/3385

### HTTP = HyperText Transfer Protocol

- WWW 상에서 정보를 주고받을 수 있는 프로토콜
- 기본적으로 HTML 문서를 주고받는 데에 쓰인다
- TCP와 UDP를 사용하며, 80번 포트를 사용한다

<img src="https://mdn.mozillademos.org/files/13677/Fetching_a_page.png" width="500">

[  OSI 7 Layer 과 TCP/IP 4 Layer(TCP/IP Protocol suite) 비교](https://goitgo.tistory.com/25)

네트워크 참고 도서: [모두의 네트워크] [그림으로 보는 TCP/IP]



### Web Client와 Server

![img](http://public.codesquad.kr/honux/images/w3-1.GIF)

------

### 주요 개념

- 클라이언트: 주로 웹 브라우저로 항상 요청만 한다.
- 서버: 클라이언트의 요청에 대해 적당한 문서를 제공해 준다.
- 프록시: 클라이언트와 서버 사이에 존재. 캐싱, 필터링, 로드 밸런싱, 인증, 로깅 등의 다양한 기능을 수행



### HTTP의 특징

- 간단
- 확장 가능
- 상태가 없다 = stateless
- **쿠키를 이용한 세션**
  - 세션과 쿠키의 의미
- HTTP1 --> HTTP/1.1 --> HTTP/2 로 발전

https://tools.ietf.org/html/rfc6265



### node.js 간단 웹 서버

https://www.npmjs.com/package/http-server

```bash
npm install -g http-server
echo "<h1>hello</h1>" > index.html
http-server
```



### 웹 브라우저로 확인

- 브라우저를 열고 127.0.0.1:8080 URL로 접속
- 네트워크 탭을 열어서 확인해 보자



### curl로 확인

```bash
curl 127.0.0.1:8080
```



### simple client

```js
const http = require('http');
const url = 'http://127.0.0.1:8080';
http.get(url, (res) => {
    console.dir(res);
});
```



### HTTP Response example 

```http
HTTP/1.0 200 OK
Server: SimpleHTTP/0.6 Python/3.5.2
Date: Sun, 02 Apr 2017 08:03:08 GMT
Content-type: text/html
Content-Length: 15
Last-Modified: Sun, 02 Apr 2017 07:10:05 GMT

<h1>Hello</h1>
Connection closed by foreign host.
```



### HTTP 동작방식

![http](http://public.codesquad.kr/honux/images/w302.png)

- 실제로는 DNS 서버가 개입한다.





### HTTP Request 메시지의 구조

![http requests](http://public.codesquad.kr/honux/images/w303.png)



### 브라우저의 동작

- 최초 응답시 HTML을 가져옴
  - 파싱: 브라우저가 함. 이런일을 하는 아이들을 브라우저 엔진이라고 한다.
- HTML에서 CSS, js, 이미지에 대한 링크 정보를 추출
- 추출한 정보의 URL을 이용 새로운 요청을 보냄
- 모든 웹 자원을 받아와서 렌더링 시작
- 1.1 은 파이프라인, 2.0은 병렬처리로 성능개선



### URL: Uniform Resource Locator

### (URI = URL + URN)

>리소스를 식별하는 주소

> 스킴:사용자이름:비번@호스트:포트/경로;패러미터?쿼리#프래그먼트

```
https://honux77:pw1234@github.com:443/honux77/MMT?file=sum.py#30
```

- 쿼리: 편의상 =과 &를 사용한다.
  - 표준은 아니다.
- 프래그먼트: 클라이언트만 사용
- id:pw 이런 구조는 잘 안쓴다.



### 포맷

MIME (Multipurpose Internel Mail Extensions) 타입으로 포맷을 분류
원래는 전자 우편을 위한 표준

```html
Content-Type:
text/plain
text/html
text/css
image/jpeg
image/png
audio/mpeg
audio/ogg
audio/*
video/mp4
application/octet-stream
multipart/mixed
```

- https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types

인터넷은 웹이 전부가 아니다. MIME type은 전자 메을을 위한 표준이었음



### TCP의 3-way Handshake

![3 way handshake](http://public.codesquad.kr/honux/images/w305.png)

- 이 짓을 하는 이유
  - 정상적으로 데이터가 손실 없이 주고받아지는지 확인하기 위해
  - 100% 정확하게 파악 되지는 않는다. 아무리 많이 확인하더라고 확실하지는 않기 때문에.
  - 그나마 세번 정도면 괜찮은 편이다.
- 커넥션을 끊을 때는 어떻게 동작할까?
  - 끊을 때는 네번 확인 한다.



### HTTP method

![http method](http://public.codesquad.kr/honux/images/w306.png)

- 주로 많이 사용: GET, POST
- RESTful API(?) 트렌드 이후로 나머지 메소드도 모두 사용함
  - 사실 우리가 만든 API는 전혀 RESTful 하지 않다.
  - 해결책: 1. RESTful 하다고 우기는 경우, 2. 그냥 웹 API로 이름을 바꾸는 경우 3. 실제로 RESTful하게 바꾸는 경우
  - 2번이 가장 현실적임 3번은 사실상 불가능하다.
- 각 메소드의 논리적 의미를 잘 기억하자



### GET VS POST

- GET은 URL 뒤에 쿼리스트링으로 패러미터를 전달
- POST는 요청 바디에 숨겨져 보내짐
- form을 이용한 대용량 파일 전송



### HTTP 응답 코드

| 상태 | 응답                  | 의미                 |
| ---- | --------------------- | -------------------- |
| 200  | OK                    | 정상적인 처리        |
| 302  | See Other             | 주로 리다이렉트 용도 |
| 404  | Not Found             | 리소스가 없다        |
| 403  | Forbidden             | 권한 없음            |
| 500  | Internal Server Error | 서버 내부 오류       |
| 502  | Bad Gateway           | 중간 계층 오류       |
| 503  | Service Unavailable   | 서비스 제공불가      |



HTTP는 state가 없다.

Net
- = tcp
- 소켓 통신

### TCP 통신을 이용하여 4인용 포커 게임을 만드는 경우

- 클라이언트 - 소켓 -서버 접속 - 인증
- 서버 - 4개의 소켓
- 사용자 - 각자 1개의 소켓
  - 사용자 로그인 -> DB 에서 찾아보고 매칭이 되면 인증을 한다.
- 이후 사용자 식별/ 메시지 응답은 어떻게 동작하는가?



- 서버
  - TCP는 커넥션이 유지가 된다.
  - 최초 로그인시 데이터베이스에서 정보를 읽어와서 인증
  
  - 어떻게 사용자를 식별하는가?
    - 커넥션은 유지가 되기 때문에 해당 소켓에서 오는 정보는 해당 사용자의 정보이다.
    - 소켓을 고유하게 식별하는 방법: fd
    - 사용자 정보가 들어있는 데이터를 저장해 놓는다. `hash table`이 좋음. key? => 소켓 객체가 key이다. value: 필요한 세션 데이터
  
  - 세션은 보통 서버에 저장함.
  

HTTP 통신의 경우는 TCP와 다르게 계속 맺고 끊기기 때문에, 매번 어떤 소켓인지 찾아야함

### 로그인 상태란 어떤 상태일까

- http는 stateless 프로토콜
- 어떻게 로그인 중인 사용자를 식별할 수 있을까?

------

### 사용자 식별 - 인증을 위한 방법

- IP 추적
- HTTP Authentication
- URL에 식별자 포함
- Cookie

### 쿠키

![cookie = ](http://public.codesquad.kr/honux/images/w307.png)

- 서버가 요청한 값을 클라이언트가 생성한다.
- key-value 구조 이다
- 값을 바꾸고 싶을 경우, key 값이 같은 값에 대해 바꿀 값만 바꿔준다.
- 쿠키는 만료 시간이 존재한다. 이는 서버에서 지정할 수 있다.
- http request에 쿠키를 담아서 서버에 보낸다.
- 보통 세션 아이디만 보낸다. 세션 정보는 당연히 서버에 저장 되어 있음
- hash map => key 값 : 세션 아이디, value: 필요한 정보
- 세션 아이디는 보통 uudi 를 이용하여 큰 값으로 제작한다.



### 쿠키의 용도

- 클라이언트에 상태 정보를 저장할 수 있음
- 세션의 키 값 저장
- 개인화 (예: 장바구니)
- 트래킹

민감한 정보는 쿠키에 저장하지 않는다.

------

### session

![session](http://public.codesquad.kr/honux/images/w308.png)

### 세션 DB

세션 디비에 필요한 최소한의 정보는 넣어야 한다. 그렇게 하지 않으면, 필요할 때마다 전체 디비를 뒤져야 한다.

{아이디:이름}

------



### 추가로 알아야 하는 것들

- 모두의 네트워크 or 후니의 CISCO 네트워크
- 풍부한 그림으로 배우는 TCP / IP 쉽게 더 쉽게
- 윤성우의 TCP/IP 프로그래밍
- HTTP 완전분석
- 공식문서!

------

### 참고자료

- http://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/HTTP_Basics.html
- https://developer.mozilla.org/ko/docs/Web/HTTP/Overview
- https://howdns.works/ep1/
- http://www.slideshare.net/deview/d2-campus-http
- https://developer.mozilla.org/ko/docs/Web/HTTP/Cookies
- http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788931447897

