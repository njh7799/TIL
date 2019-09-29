# Express와 미들웨어[ref](https://lucas.codesquad.kr/) +필기

------

## 왜 필요한가

- Node.js로 백엔드 개발을 하기 위해서는 백엔드 프레임워크를 사용하는 것이 편하다.
- 현재 유명하고 배우기 쉽고 실서비스에서도 많이 사용하는 프레임워크가 Express이다.
- 하나의 백엔드 서비스를 잘 익히면 다른 프레임워크를 학습하는 것은 크게 어렵지 않다.

------

## 학습 목표

- npm을 이용해 Express를 설치할 수 있다.
- Express의 라우팅 처리 방식을 이해한다.
- Express의 미들웨어에 대해 이해하고 직접 미들웨어를 만들 수 있다.
  - 미들웨어가 어떻게 동작하는지 아는 것이 가장 중요하다.
- Express의 일반적인 에러처리 방식을 개발에 적용할 수 있다.

------

## 학습 지식

### Express Quick Start

```bash
npm install -g express
express hello-express --view=pug
cd hello-express
npm install
npm start
```

------

### Express 내부 살펴보기

npm 을 이용해서 express와 express-generator를 설치한다.

https://expressjs.com/ko/starter/generator.html

------

### app.js

- **위에서 아래로 순서대로 실행됨을 꼭 기억한다.**

------

### 미들웨어

- Express의 전부(라고 개인적으로 생각)
- https://expressjs.com/ko/guide/using-middleware.html

![middle ware](https://developer.okta.com/assets-jekyll/blog/express-middleware-examples/middleware-30b3b30ad54e21d8281719042860f3edd9fb1f40f93150233a08165d908f4631.png)

https://developer.okta.com/blog/2018/09/13/build-and-understand-express-middleware-through-examples

------

### 외부 모듈

- cookie-parser (https://www.npmjs.com/package/cookie-parser)
- debug (https://expressjs.com/ko/guide/debugging.html)
- http-errors(https://www.npmjs.com/package/http-errors)
- morgan (https://www.npmjs.com/package/morgan)

------

## [미들웨어  사용](https://expressjs.com/en/starter/basic-routing.html)

- use 메소드와 METHOD 메소드

```js
app.use() //모든 메소드에 대하여 실행됨
app.METHOD() //HTTP method에 대하여 실행 됨
```

- use 메소드

```js
var app = express();

// 마운트 경로가 없는 경우엔 요청이 들어올 때 마다 미들웨어 함수가 실행된다.
app.use(function (req, res, next) {
  console.log('run every time');
  next();
});

// 마운트 경로가 있는 경우엔, 마운트 경로로 들어오는 모든 요청에 대하여 미들웨어 함수가 실행된다.
app.use('/route', function (req, res, next) {
  console.log('run at route "/route"');
  next();
});

// 미들웨어 함수가 여러개 있는 경우엔 순차적으로 실행된다.
app.use('/route', middlwareFunc1, middlewareFunc2);

```

- next 를 만났을 때

```js
// next()를 만났을 때
// 바로 다음 미들 웨어가 실행된다.
app.use(function (req, res, next) {
  next();
});

//next('error')를 만났을 때 
// 즉시 에러 핸들러를 호출한다.
app.use(function (req, res, next) {
  next('error');
});

// next(createError(404));
// 즉시 에러 핸들러를 호출하고 404 에러를 넘겨준다.
app.use(function (req, res, next) {
  next('createError(404)');
});

// next('route')
// 라우터 미들웨어 스택의 나머지 미들웨어를 건너 뛰고 다음 라우터를 호출
// app.METHOD 방식에서만 사용 가능
app.get('/', (req, res, next)=>{
    next('route')
}, (req, res)=>{console.log('this code does not run')})
```

- response가 실행되었을 때

```js
// response를 보내고 즉시 종료된다. 따라서 이 구문 밑에 존재하는 구문들은 실행되지 못한다.
app.use('/route', function (req, res, next) {
  res.send('response');
});
```

- 에러 처리

```js
// 매개변수가 4개일 경우 에러 처리 함수이다.
app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});
```

	미들웨어에서 async - await와 함께 사용할 경우 에러 처리에 주의해야 한다.

---

## node express restart on change

설치

```shell
npm install --save-dev nodemon
```

사용

```json
//package.json
{
    ...
    {
        ...
        "scripts": {
    		"start": "nodemon ./bin/www"
  		},
        ...
    }
    ...
}
```

---

## register to root directory

```javascript
app.use(express.static(path.join(__dirname, {target directory})));
```

__dirname은 현재의 루트 경로 {target directory} 는 등록할 디렉토리.

위와 같이 설정을 해 놓으면, import할 때 수월하다.

---

## when request does not carry anything

포스트 맨으로 아래의 코드를 POST 전송하는데 계속 undefined가 나온다

```javascript
app.post('/', (req, res) => {
  console.log(req.body);
  res.send(req.body);
});
```

구글링 하니까 해결법이 바로 나왔다. 아래의 코드를 추가해주어야 했다.

```javascript
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
```

