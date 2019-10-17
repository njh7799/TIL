# oauth

생활 코딩의 강의를 통하여 ARABOZA  https://opentutorials.org/course/3405 

필자는 정리에 약하므로 양해 바란다. Resource server는 편의상 github라고 하겠다.

## 역할

호눅스님께서 생활 코딩 강의에 댓글로 남겨놓으신 것을 가지고 왔다.

`Client`   제 3자 앱 (ex 생활코딩)
`Resource owner`   리소스의 소유주 (일반 사용자)
`Resource server`   API를 통해 리소스를 제공 (구글의 리소스 저장 서버)
`Authorization server`   인증 담당으로 access token을 client 에게 보내줌 (구글의 인증 담당 서버) 

## 등록	`Client ---register--> Resource server`

oauth는 쓰고 싶다고 냅다 가져다 쓸 수 있는 것이 아니다. 사용하기 전에 우선 해당 서비스(github)의 oauth에 내 사이트를 등록 해야 한다.



등록을 하면 아래 세가지를 받게 된다.

`Client ID`  우리가 만들고있는 앱을 식별하는 식별자
`Client Secret` 그 비번 **노출되면 개클남**
`Authorized redirect URL` 리소스 서버가 권한을 부여하는 과정에서 Authorized Code를 보내줄 것인데 그걸 여기로 준다.



## Resource Owner의 승인

자 현재, Client와 Resource Server는  `Client ID`, `Client Secret`, `Authorized redirect URL` 세가지를 가지고 있다.

Resource Server는 A,B,C,D 네가지 기능을 지원하는데, 이 중에서 B 와 C 기능만을 필요로 하는 상황이다. (이 기능들을 scope이라 칭하겠다.)

사용자가 내 페이지에서 B 기능을 사용하고자 한다면, **인증** 동의를 위한 버튼을 살포시 띄워 주자.

이 버튼을 누르면 위 `Client ID`, `Authorized redirect URL`, `scope` 를 깃 허브 페이지에 날린다.

Resource Server는 로그인 여부를 확인하고 되어 있지 않을 경우, 로그인 페이지를 우선 띄운다. 로그인이 성공하면, `Client ID`, `Authorized redirect URL`를 검사한다. 통과가 된다면 scope에 대한 권한을 Client에게 허용할 것인지에 대한 모달을 Owner에게 띄운다. Owener가 허용 하면 user id 와 해당 scope 에 대한 동의 정보를 저장한다.



## Resource Server의 인증

자 이제 Resource Server에게 인증을 받아보자.

바로 토큰을 주면 좋겠지만, 어림도 없다.
Resource Server는 authorization code를 만들어 Owner에게 전송한다.
이걸 전송할 때에 Location: ~~ 헤더에 authorization code를 포함하여 전송한다. 이 요청을 받으면  Owner은 Client 에게 authorization code 를 전달하게 된다.

Client는 authorization code, redirect_URL, Client ID,  Client secret 을 Resource Server에게 전송한다.



## Access token 발급

인증이 끝난 후에는 authorization code 를 지운다. 그리고 **access Token**을 발급하여 Client에게 발급한다. 이 access Token은 *user id 1번에 대해 B, C 에 대한 권한이 열려 있다.* 라는 정보를 가지고 있다.

이하 강의에 대한 정리는 생략하겠으며, 직접 들어보자.