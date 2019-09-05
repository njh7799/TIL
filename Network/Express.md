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

### router와 라우팅

https://expressjs.com/en/starter/basic-routing.html

```js
app.METHOD(PATH, HANDLER)
```

- 'use'를 사용하면 모든 메소드에 대응
- PATH를 사용하면 모든 URL에 대응

```js
//app.js
app.use(cookieparser())
app.use('/users', userRouter)
app.get('/test', (req, res, next)=>{
    res.json({name:'jack', age:25})
})

app.get('/next', (req, res, next)=>{
    next("error")
    // next("error")를 만나면 즉시 에러 핸들러를 실행한다.
    // 그냥 next()이면 다음 줄로 넘어간다.
})

app.get('/nonres', (req, res, next)=>{
    console.log(req)
    // 이런 경우에는 response가 없기 때문에 응답이 오지 않는다.
})

app.use(function(req, res, next){
    next(createError(404));
})


app.use(function(err, req, res, next){
    //매게변수가 4개이면 에러 핸들러이다.
    
})


```
- 실행 되다가 reponse를 보내면(res.send 혹은 res.json을 만나면)끝난다. 따라서 먼저 실행되어야 하는 코드들은  `위에` 있어야 한다.

- userRouter 같은 아이들을 미들웨어라고 한다.
- app.use 는 모든 메소드를 의미하고 app.get은 get 메소드만 처리한다는 것을 의미한다.

------

### 에러 처리

- `next(error)`를 사용해서 에러를 처리한다.
- 미들웨어에서 async - await와 함께 사용할 경우 에러 처리에 주의해야 한다.

------

### template engine

- 데이터를 이용, 템플릿을 렌더링해서 사용자에게 응답
- 다양한 템플릿 엔진이 있음 (https://colorlib.com/wp/top-templating-engines-for-javascript/)
- 대표적으로 EJS, Jade, pug 등을 사용 (https://expressjs.com/ko/guide/using-template-engines.html)
- https://expressjs.com/ko/advanced/developing-template-engines.html

### node express restart on change

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

