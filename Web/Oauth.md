# OAuth

- 생활 코딩 강의:  https://opentutorials.org/course/3405 
- Oauth 2.0 정리 http://blog.weirdx.io/post/39955
- Oauth 2.0 공식 문서  https://tools.ietf.org/html/rfc6749  
- 깃 허브 공식 문서 https://developer.github.com/apps/building-oauth-apps/ 
- 따라해보기 [link](https://medium.com/shriram-navaratnalingam/authentication-using-github-oauth-2-0-with-nodejs-be1091ce10a7/)

## 역할

호눅스님께서 생활 코딩 강의에 댓글로 남겨놓으신 것을 가지고 왔다.

`Client`   제 3자 앱 (ex 생활코딩)
`Resource owner`   리소스의 소유주 (일반 사용자)
`Resource server`   API를 통해 리소스를 제공 (구글의 리소스 저장 서버)
`Authorization server`   인증 담당으로 access token을 client 에게 보내줌 (구글의 인증 담당 서버) 


![image](https://user-images.githubusercontent.com/40619551/68180477-40b27700-ffd7-11e9-8e3d-00851da855e2.png)

## Flow

**등록**
   해당 리소스 서버에 등록을 하고 나면, 리소스 서버와 클라이언트는 각각 `Client ID`, `Client Secret`, `redirect URL`을 가지게 된다.

(A) **Authorization Request**
   -  authorization request는 resource owner 에게 직접적으로 이루어질 수도 있고, authorization server를 통해 간접적으로 이루어질 수도 있다. 지금은 후자의 방법을 택하겠다.
   -  클라이언트가 `client id`를 포함한 채 리소스 아우너를 authorization server 로 리다이랙션 시켜 권한을 요청한다. 이 때, 리소스 아우너는 로그인을 한 후, 넘겨줄 권한을 선택한다.
         - 깃의 경우 `https://github.com/login/oauth/authorize?client_id={CLIENT_ID}`로 이동한다.
-  로그인 및 권한 설정이 끝났다면, `client ID`와 `redirect URL`를 확인한 후, `redirect URL`로 보낸다.

(B) **Authorization Grant**
   - 클라이언트가 authorization grant를 받는다. (여기서는 authorization code 이다.)

        - authorization grant 의 방법으로는 authorization code, implicit, resource owner password credentials, 그리고 client credentials 가 있다.


   - 리소스 서버가 리소스 오너의 웹 브라우저를 `http://localhost:4000/home?code={code}`로 이동시킨다. 

   - {code}가 authorization code이다.

   - `code={code}` 라는 쿼리에 의해서 클라이언트는 authorization 코드를 알 게 된다.

(C) **Authorization Grant**

   - 클라이언트가 리소스 서버에게 토큰을 받기 위해`https://github.com/login/oauth/access_token?client_id=${clientID}&client_secret=${clientSecret}&code=${authorizationCode}` 로 POST 요청을 보낸다.
     

(D) **Access Token**
   - ` clientID`, `clientSecret`, `authorizationCode` 을 확인하여 유요하다면, access token을 발급 받는다.
   - authorizationCode 를 리소스 서버와 클라이언트에서 삭제한다.


(E) **Access Token**

- header 에 Authorization 에 accessToken을 넣어서 정해진 url에 요청을 보낸다.	
  
    ```js
    ...
    method: 'get',
        headers: {
         Authorization: `token ${accessToken}`,
        },
        url: 'https://api.github.com/user',
    ...
    
    ```
    

(F) **Protected Resource**

- 위 요청에 대한 콜백함수의 인자값으로 protected resource를 받을 수 있다.

(추가) access token이 만료되었을 경우
   - 서버에 `Client ID`, `Client Secret`, `Refresh Token `을 전송하면 access token을 새로 발급받을 수 있다.
   - github의 경우에는 access token에 수명이 없기 때문에 위와 같은 과정이 필요 없다.



## 따라 해보기

가독성을 위해 단계별로 함수를 만들어 정리하였다.

```js
// app.js

const express = require('express');
const cors = require('cors');
require('dotenv').config();

const { getAccessToken, getUserData } = require('./oauth');

const app = express();

app.use(cors());

app.get('/home', async (req, res) => {
  const authorizationCode = req.query.code;
  const accessToken = await getAccessToken(authorizationCode);
  const protectedResource = await getUserData(accessToken);
  console.log(protectedResource);
  res.redirect('http://localhost:3000');
});

app.listen(process.env.PORT, () => {
  console.log('now listening for requests on port 4000');
});

```

```js
// oauth/index.js

const axios = require('axios');

const clientID = process.env.CLIENT_ID;
const clientSecret = process.env.CLIENT_SECRET;

async function getAccessToken(authorizationCode) {
  const response = await axios({
    method: 'post',
    url: `https://github.com/login/oauth/access_token?client_id=${clientID}&client_secret=${clientSecret}&code=${authorizationCode}`,
    // Set the content type header, so that we get the response in JSON
    headers: {
      accept: 'application/json',
    },
  }).catch((error) => console.log(error.message));
  const accessToken = response.data.access_token;
  return accessToken;
}

async function getUserData(accessToken) {
  const response = await axios({
    method: 'get',
    headers: {
      Authorization: `token ${accessToken}`,
    },
    url: 'https://api.github.com/user',
  }).catch((error) => console.log(error.message));
  const protectedResource = response.data;
  return protectedResource;
}
module.exports = { getAccessToken, getUserData };

```

## Oauth로 받은 데이터의 전달

이제 Oauth를 이용하여 유저의 정보를 받아 내는 것 까지 성공했다. 문제는 이 데이터를 어떻게 client에게 넘겨 주냐는 것이다. 우선, git 에서 받은 access token을 클라이언트에게 넘기는 것은 보안상 매우 위험하다. 이에 필자는, protectedResource 에서 필요한 정보만을 골라, jwt 를 생성하였다. 아래 코드에서는 createToken 함수가 해당 기능을 수행한다.

```js
app.get('/home', async (req, res) => {
  const authorizationCode = req.query.code;
  const accessToken = await getAccessToken(authorizationCode);
  const protectedResource = await getProtectedResource(accessToken);
  const token = await createToken(protectedResource)
  res.redirect('http://localhost:3000');
});
```

이 데이터를 바로 client에게 전달하는 것 또한 안전하지 않다. 따라서 다음과 같은 방법을 제안한다.

1. 테이블을 생성하여 key : value 의 value에 위에서 만든 토큰을 넣는다.
2. 쿠키에 key 값을 넣는다.
3. redirect 시켜준다.
4. client에서는 cookie 값을 통해 토큰의 키 값을 알 수 있다.

