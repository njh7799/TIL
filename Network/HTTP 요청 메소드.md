# HTTP 요청 메소드

## [GET](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/GET)

**HTTP GET 메소드**는 특정한 리소스를 가져오도록 요청합니다. 즉, `GET`은 오직 데이터를 가져오는 데에만 사용합니다.

| Request has body                                             | No   |
| :----------------------------------------------------------- | ---- |
| Successful response has body                                 | Yes  |
| [Safe](https://developer.mozilla.org/ko/docs/Glossary/Safe)  | Yes  |
| [Idempotent](https://developer.mozilla.org/ko/docs/Glossary/Idempotent) | Yes  |
| [Cacheable](https://developer.mozilla.org/ko/docs/Glossary/Cacheable) | Yes  |
| Allowed in HTML forms                                        | Yes  |



## [POST](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/POST)

**HTTP POST method**는 데이터(data)를 서버로 보내는 방법 중 하나입니다. request의 body 타입은 [`Content-Type`](https://developer.mozilla.org/ko/docs/Web/HTTP/Headers/Content-Type) 헤더(header)에 따라 결정됩니다.

| Request has body                                             | Yes                       |
| :----------------------------------------------------------- | ------------------------- |
| Successful response has body                                 | Yes                       |
| [Safe](https://developer.mozilla.org/ko/docs/Glossary/Safe)  | No                        |
| [Idempotent](https://developer.mozilla.org/ko/docs/Glossary/Idempotent) | No                        |
| [Cacheable](https://developer.mozilla.org/ko/docs/Glossary/Cacheable) | 새 정보가 포함되었을 때만 |
| Allowed in [HTML forms](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms) | Yes                       |

[출처: Mozilla](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods)



## [HEAD](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/HEAD)

**HTTP HEAD 메소드**는 특정 리소스를 HTTP [`GET`](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/GET) 메소드로 요청하는 경우에 어떤 헤더들이 반환되는지를 요청합니다. 예를 들어, 큰 용량의 리소스를 다운로드 받을지 말지 결정하기 위해서 사전 요청하는 용도로 사용할 수 있습니다.

`HEAD` 메소드에 대한 리스폰스는 바디를 가질 수 없습니다. 만약 바디를 가진다면, 이 메소드는 무시될 것입니다.

| Request has body                                             | No   |
| :----------------------------------------------------------- | ---- |
| Successful response has body                                 | No   |
| [Safe](https://developer.mozilla.org/ko/docs/Glossary/Safe)  | Yes  |
| [Idempotent](https://developer.mozilla.org/ko/docs/Glossary/Idempotent) | Yes  |
| [Cacheable](https://developer.mozilla.org/ko/docs/Glossary/Cacheable) | Yes  |
| Allowed in [HTML forms](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms) | No   |



## [PUT](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/PUT)

**HTTP PUT 요청 방식**은 새로운 자료를 만들거나 목표로 하는 기존의 자료를 요청 페이로드를 통해 교체합니다.

`PUT`과 [`POST`](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/POST)의 차이점은 `PUT`은 멱등: 한번 혹은 연속적으로 여러번 하더라도 동일하지만 영향(부작용이 아님)을 미치지만, `POST`는 연속적인 요청이 그대로 전달되어 요청이 연속적으로 들어가는 것으로 되어 추가적인 영향이 있을 수 있습니다.

| Request has body                                             | Yes  |
| :----------------------------------------------------------- | ---- |
| Successful response has body                                 | No   |
| [Safe](https://developer.mozilla.org/ko/docs/Glossary/Safe)  | No   |
| [Idempotent](https://developer.mozilla.org/ko/docs/Glossary/Idempotent) | Yes  |
| [Cacheable](https://developer.mozilla.org/ko/docs/Glossary/Safe) | No   |
| Allowed in [HTML forms](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms) | No   |

### 응답

만약 현재 대표로 존재하는 자료가 없는 것을 목표로 하고 PUT 요청이 성공적으로 해당 자료를 생성했다면, 서버는 반드시 사용자 에이전트에게 [`201`](https://developer.mozilla.org/ko/docs/Web/HTTP/Status/201) (`Created`) 응답을 보내서 그 사실을 알려주어야 합니다.

```html
HTTP/1.1 201 Created
Content-Location: /new.html
```

만약 현재 대표되는 자료가 있는 것을 목표로 하고 요청에 포함된 자료에 준하여 성공적으로  대표되는 자료가 수정되었다면, 서버는 반드시 [`200`](https://developer.mozilla.org/ko/docs/Web/HTTP/Status/200) (`OK`) 또는 [`204`](https://developer.mozilla.org/ko/docs/Web/HTTP/Status/204) (`No Content`) 를 응답으로 보내 성공적으로 요청을 마무리했다는 것을 알려주어야 합니다.

```html
HTTP/1.1 204 No Content
Content-Location: /existing.html
```



## [PATCH](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/PATCH)

**HTTP PATCH** 메소드는 리소스의 부분적인 수정을 할 때에 사용됩니다.

HTTP [`PUT`](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/PUT) 메소드는 문서 전체의 완전한 교체만을 허용합니다. 반면 `PATCH` 메소드는 `PUT` 메스드와 달리 명등성을 가지지 않는데, 이는 동일한 patch 요청이 다른 결과를 야기할 수도 있음을 뜻합니다. 하지만 PATCH를 PUT과 같은 방식으로 사용함으로써 명등성을 가지게 할 수도 있습니다.

| Request has body                                             | Yes  |
| :----------------------------------------------------------- | ---- |
| Successful response has body                                 | Yes  |
| [Safe](https://developer.mozilla.org/ko/docs/Glossary/Safe)  | No   |
| [Idempotent](https://developer.mozilla.org/ko/docs/Glossary/Idempotent) | No   |
| [Cacheable](https://developer.mozilla.org/ko/docs/Glossary/Cacheable) | No   |
| Allowed in [HTML forms](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms) | No   |



## [DELETE](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/DELETE)

**HTTP DELETE 요청 메소드**는 특정 리소스를 삭제합니다.

## [CONNECT](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/CONNECT)

**HTTP CONNECT** 메소드는 요청한 리소스에 대해 양방향 연결을 시작하는 메소드입니다. 이는 터널을 열기 위해서 사용될 수 있습니다.

## [Options](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/OPTIONS)

**HTTP OPTIONS method** 는 목표 리소스와의 통신 옵션을 설명하기 위해 사용됩니다. 클라이언트는 OPTIONS 메소드의 URL을 특정지을 수 있으며, aterisk(*) 를 통해 서버 전체를 선택할 수 있습니다.

## [TRACE](https://developer.mozilla.org/ko/docs/Web/HTTP/Methods/TRACE)