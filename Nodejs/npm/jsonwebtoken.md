# jsonwebtoken

## JWT

## Json Web Token
- https://jwt.io/
- JSON 객체를 안전하게 주고받는 방법
- JSON + 서명
- HTTP API 인증에 사용 가능

### 특징

- 외부에 공개되는 것은 괜찮지만, 변조가 되면 안되는 데이터를 관리.
- 세션을 대체할 수 있다.
- 세션 디비가 없어도 된다. -> 클라이언트가 토큰 관리 => 서버가 두대가 되었을 경우, 세션을 이용하면 힘들다. 
- 세션을 이용하여 여러 서버를 구현하면 겁나 복합해진다. 토큰은 세션 디비에 저장을 하지 않기 때문에 여러대의 웹서버를 이용할 때 훨씬 간단하다.
- API 서버는 토큰 방식으로 하는 것이 좋다

### 시나리오

- 회원가입
  - 변화 없다
- 로그인
  - 로그인을 하면, DB에서 사용자 정보를 가지고 와서 JSON Web token으로 바꾸어 클라이언트한테 보내주면 된다.
  - 줄 때는 어떻게 줄 것인가 (헤더?)
  - 클라이언트는 받은 토큰을 어떻게 저장할 것인가. 쿠키? 로컬 스토리지? 쿠키가 간단한 방법이긴 한다.
  - 다음 인증부터는 JWT를 같이 서버에 보낸다. valid한 토큰일 경우 허가 및 응답.
- 로그아웃
  - 그냥 만료시키면 된다. (쿠키로 했을 경우에는)
  - expire date를 jwt에 넣을 수 있다.
- 특정 사용자의 권한을 없애는 경우
  - 서버에서는 권한이 없다. 하지만 로컬의 토큰에는 여전히 권한이 있다. 이 문제에 대한 답을 생각해봐야 할 것.

## Usage

```js
const jwt = require('jsonwebtoken')
const privateKey="abcdefghijklmnopqrstuvwxyz012345"
console.log(jwt.sign({name:"Honux", money: "Infinte"}, privateKey, { algorithm: 'HS256'}))
```

##  Transaction

