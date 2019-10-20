# OAuth

- 강의:  https://opentutorials.org/course/3405 
- 공식 문서 https://developer.github.com/apps/building-oauth-apps/ 
- 따라해보기 [link](https://medium.com/shriram-navaratnalingam/authentication-using-github-oauth-2-0-with-nodejs-be1091ce10a7/)

## 역할

호눅스님께서 생활 코딩 강의에 댓글로 남겨놓으신 것을 가지고 왔다.

`Client`   제 3자 앱 (ex 생활코딩)
`Resource owner`   리소스의 소유주 (일반 사용자)
`Resource server`   API를 통해 리소스를 제공 (구글의 리소스 저장 서버)
`Authorization server`   인증 담당으로 access token을 client 에게 보내줌 (구글의 인증 담당 서버) 


![image](https://user-images.githubusercontent.com/40619551/67158865-b0d6c100-f378-11e9-83ec-62a7e347fce3.png)

## Flow

1. **등록**
   해당 리소스 서버에 등록을 하고 나면, 리소스 서버와 클라이언트는 각각 `Client ID`, `Client Secret`, `redirect URL`을 가지게 된다.
2. **Resource Owner의 승인**
   - 리소스 아우너가 클라이언트에 접근을 하고 로그인을 하고자 한다.
   - 클라리언트는 사용자를 `https://github.com/login/oauth/authorize?client_id={CLIENT_ID}` 로 이동시킨다. oauth 로그인을 하게끔 한다.
   - 로그인이 있다면, `client ID`와 `redirect URL`를 확인한 후, `redirect URL`로 보낸다.
   - 로그인이 되어 있지 않다면  로그인 창을 전송하는데, 로그인을 완료하면, 바로 위 단계를 진행한다. 여기서 리소스 서버는 해당 유저가 설정한 scope에 대한 작업에 허용 하였다는 정보를 가지게 된다.
3. **Resource Server의 승인**
   - 리소스 서버가 리소스 오너의 웹 브라우저를 `http://localhost:4000/home?code={code}`로 이동시킨다. 
   - {code}가 authorization code이다.
   - `code={code}` 라는 쿼리에 의해서 클라이언트는 authorization 코드를 알 게 된다.
   - 클라이언트가 리소스 서버에게 토큰을 받기 위해`https://github.com/login/oauth/access_token?client_id=${clientID}&client_secret=${clientSecret}&code=${authorizationCode}` 로 POST 요청을 보낸다.
     - `clientID`, `clientSecret`, `authorizationCode` 을 확인하여 유요하다면, 
4. **액세스 토큰 발급**
   - authorizationCode 를 리소스 서버와 클라이언트에서 삭제한다.
   - Access Token을 리소서 서버가 클라이언트에게 넘겨준다.

5. **API 호출**

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

6. (추가) access token이 만료되었을 경우
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

