# GRAPHQL.JS TUTORIAL [link](https://graphql.org/graphql-js/ )

## Running an Express GraphQL Server

---

```bash
npm install express express-graphql graphql --save
```
```js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  type Query {
    hello: String
  }
`);

// The root provides a resolver function for each API endpoint
var root = {
  hello: () => {
    return 'Hello world!';
  },
};

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
```



## GraphQL Clients

---

클라이언트에서 쿼리를 날려보자

```js
fetch('/graphql', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  body: JSON.stringify({query: "{ hello }"})
})
  .then(r => r.json())
  .then(data => console.log('data returned:', data));
```

아래와 같이 데이터가 반환된다.

```js
data returned: Object { hello: "Hello world!" }
```



## Basic Types

---

- GraphQL 스키마는 스칼라 타입으로  `String`, `Int`, `Float`, `Boolean`,  `ID` 타입을 지원한다.
- default 설정으로 모든 값은 null이 될 수 있으며 끝에 ! 를 붙임으로써   non-nullable 설정을 추가할 수 있다. 
- 리스트를 표현하고 슾을 경우엔 `[Int]` 와 같이 표현하면 된다.

```js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  type Query {
    quoteOfTheDay: String
    random: Float!
    rollThreeDice: [Int]
  }
`);

// The root provides a resolver function for each API endpoint
var root = {
  quoteOfTheDay: () => {
    return Math.random() < 0.5 ? 'Take it easy' : 'Salvation lies within';
  },
  random: () => {
    return Math.random();
  },
  rollThreeDice: () => {
    return [1, 2, 3].map(_ => 1 + Math.floor(Math.random() * 6));
  },
};

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
```



## Passing Arguments

---

당연한 이야기지만, 변수를 입력하는 것 또한 가능하다. 방법은 아래와 같다.

```js
// type 정의

// Before
type Query {
  rollThreeDice: [Int]
}

// After
type Query {
  rollDice(numDice: Int!, numSides: Int): [Int]
}
```
- `rollTreeDice`와 같이 입력 인자가 없는 경우에는` rollTreeDice()` 가 아니라 그냥` rollTreeDice`로 적는다.
- 반면 passing arguments가 있는 경우에는 `After`와 같이 표기한다.

```js
// root 에 적용

var root = {
  rollDice: function ({numDice, numSides}) {
    var output = [];
    for (var i = 0; i < numDice; i++) {
      output.push(1 + Math.floor(Math.random() * (numSides || 6)));
    }
    return output;
  }
};
```

```js
// 전체 코드

var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  type Query {
    rollDice(numDice: Int!, numSides: Int): [Int]
  }
`);

// The root provides a resolver function for each API endpoint
var root = {
  rollDice: function ({numDice, numSides}) {
    var output = [];
    for (var i = 0; i < numDice; i++) {
      output.push(1 + Math.floor(Math.random() * (numSides || 6)));
    }
    return output;
  }
};

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
```

```js
// GraphiQL 에서 실행

query {
  rollDice(numDice: 5, numSides: 6)
}
```



크럼 클라이언트에서는 어떻게 요청을 보내야 할까요

```js

var dice = 3;
var sides = 6;
var query = `query RollDice($dice: Int!, $sides: Int) {
  rollDice(numDice: $dice, numSides: $sides)
}`;

fetch('/graphql', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  body: JSON.stringify({
    query,
    variables: { dice, sides },
  })
})
  .then(r => r.json())
  .then(data => console.log('data returned:', data));
```



## 중간 정리

---

밑에 내용이 너무 어려워서 정리하는 단계를 만들었다.

1. `schema` 스키마는 GQL 에서 사용할 데이터의 타입과 그 구성 요소를 명세한다.

```js
var schema = buildSchema(`
  type Query {
    quoteOfTheDay: String
    random: Float!
    rollThreeDice: [Int]
  }
`);
```

	1. Query 라는 타입을 정의
	2. passing arguments 설정. roll 의 경우에만 Int! 타입의 numRolls 인자가 존재.
	3. Query 구성 요소의 타입 설정.
	
	2. `root` 는 각 API 엔드 포인트의  resolver function을 제공한다.

```js
var root = {
  quoteOfTheDay: () => {
    return Math.random() < 0.5 ? 'Take it easy' : 'Salvation lies within';
  },
  random: () => {
    return Math.random();
  },
  rollThreeDice: () => {
    return [1, 2, 3].map(_ => 1 + Math.floor(Math.random() * 6));
  },
};
```

3. Preview


## Object Types

---

타입으로 객체를 넣어보자.

 `RandomDie`이라는 object type 를 정의한다. 이를 getDie의 type 으로 사용한다.

```js
type RandomDie {
  roll(numRolls: Int!): [Int]
}

type Query {
  getDie(numSides: Int): RandomDie
}
```

| **Instead of a root-level resolver for the `RandomDie` type, we can instead use an ES6 class, where the resolvers are instance methods.**

`RandomDie` type의root level-resolver 대신 클래스를 사용할 수 있는데, 이 때, 클래스의 instance가 resolver가 된다. 

```js
class RandomDie {
  constructor(numSides) {
    this.numSides = numSides;
  }

  rollOnce() {
    return 1 + Math.floor(Math.random() * this.numSides);
  }

  roll({numRolls}) {
    var output = [];
    for (var i = 0; i < numRolls; i++) {
      output.push(this.rollOnce());
    }
    return output;
  }
}

var root = {
  getDie: function ({numSides}) {
    return new RandomDie(numSides || 6);
  }
}
```

아래와 같이 instance의 property 또한  GraphQL fields 로 사용될 수 있다.

```js
type RandomDie {
  numSides: Int! // instance의 property
  rollOnce: Int! // arguments가 없는 instance method
  roll(numRolls: Int!): [Int] // arguments가 있는 instance method
}

type Query {
  getDie(numSides: Int): RandomDie
}
```

최종 실행 코드

```js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  type RandomDie {
    numSides: Int!
    rollOnce: Int!
    roll(numRolls: Int!): [Int]
  }

  type Query {
    getDie(numSides: Int): RandomDie
  }
`);

// This class implements the RandomDie GraphQL type
class RandomDie {
  constructor(numSides) {
    this.numSides = numSides;
  }

  rollOnce() {
    return 1 + Math.floor(Math.random() * this.numSides);
  }

  roll({numRolls}) {
    var output = [];
    for (var i = 0; i < numRolls; i++) {
      output.push(this.rollOnce());
    }
    return output;
  }
}

// The root provides the top-level API endpoints
var root = {
  getDie: function ({numSides}) {
    return new RandomDie(numSides || 6);
  }
}

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
```

쿼리 요청 방법 예시

```js
{
  getDie(numSides: 6) {
    rollOnce
    roll(numRolls: 3)
  }
}
```



## Mutations and Input Types

---

데이터를 변경할 일이 있다면, query 보다는 mutation을 사용하여야 한다.

 “message of the day”  서버를 만든다고 하자. 이 페이지에서는 누구나 오늘의 글귀를 올릴 수 있으며, 누구나 현재의 글귀를 읽을 수 있다. GraphQL  schema 는 매우 간단하게 나온다.

```js
type Mutation {
  setMessage(message: String): String
}

type Query {
  getMessage: String
}
```

mutation의 큰 장점 중 하나는, 생성(혹은 변경)한 데이터를 반환한다는 점이다. 따라서 니가 서버에 있는 데이터를 변경하면, 클라이언트가 해당 변경 사항을 알 수 있다.

mutation과 query 둘다 root resolver에서 처리할 수 있다. 이를 표현해보자.

```js
var fakeDatabase = {};
var root = {
  setMessage: function ({message}) {
    fakeDatabase.message = message; // 서버의 데이터 변경
    return message; // 변경한 데이터를 반환
  },
  getMessage: function () {
    return fakeDatabase.message;
  }
};
```

이 것으로도 충분하지만, 조금 더 편하게 작업하기 위해서 설정 할 수 있는 것이 하나 더 있다. 대부분의 mutation 입력은 같은 양식을 가진다.(당연) 스키마를  더 단순화 하기 위해 `type` 대신 `input` 을 사용하여 `input type`을 사용할 수 있다.

```js
input MessageInput {
  content: String
  author: String
}

type Message {
  id: ID!
  content: String
  author: String
}

type Query {
  getMessage(id: ID!): Message
}

type Mutation {
  createMessage(input: MessageInput): Message
  updateMessage(id: ID!, input: MessageInput): Message
}
```

최종 서버 코드

```js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  input MessageInput {
    content: String
    author: String
  }

  type Message {
    id: ID!
    content: String
    author: String
  }

  type Query {
    getMessage(id: ID!): Message
  }

  type Mutation {
    createMessage(input: MessageInput): Message
    updateMessage(id: ID!, input: MessageInput): Message
  }
`);

// If Message had any complex fields, we'd put them on this object.
class Message {
  constructor(id, {content, author}) {
    this.id = id;
    this.content = content;
    this.author = author;
  }
}

// Maps username to content
var fakeDatabase = {};

var root = {
  getMessage: function ({id}) {
    if (!fakeDatabase[id]) {
      throw new Error('no message exists with id ' + id);
    }
    return new Message(id, fakeDatabase[id]);
  },
  createMessage: function ({input}) {
    // Create a random id for our "database".
    var id = require('crypto').randomBytes(10).toString('hex');

    fakeDatabase[id] = input;
    return new Message(id, input);
  },
  updateMessage: function ({id, input}) {
    if (!fakeDatabase[id]) {
      throw new Error('no message exists with id ' + id);
    }
    // This replaces all old data, but some apps might want partial update.
    fakeDatabase[id] = input;
    return new Message(id, input);
  },
};

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000, () => {
  console.log('Running a GraphQL API server at localhost:4000/graphql');
});
```

테스트 코드

```js
mutation {
  createMessage(input: {
    author: "andy",
    content: "hope is a good thing",
  }) {
    id
    content
    author
  }
}
```

0. 스키마 구조

    ```js
    type Mutation {
        createMessage(input: MessageInput): Message
        updateMessage(id: ID!, input: MessageInput): Message
}
    ```

1. `createMessage` `argument`의 type은 `MessageInput` 이다.

   ```
   createMessage(input: {
       author: "andy",
       content: "hope is a good thing",
     })
   ```

2. `createMessage` 반환값의 type은 `Message` 이다.

    ```js
    {
        id
        content
        author
      } 
    ```

3. 1 과 이를 합치면 최초의 테스트 코드와 같은 값이 나온다.

4. **궁금증** mutation은 반환값을 반드시 설정해줘야 하나? 설정을 안하고 실행시키니까 자동으로 `{ id }` 를 뒤에 붙여준다. 왜 이럴까

클라이언트

```js
var author = 'andy';
var content = 'hope is a good thing';
var query = `mutation CreateMessage($input: MessageInput) {
  createMessage(input: $input) {
    id
  }
}`;

fetch('/graphql', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  body: JSON.stringify({
    query,
    variables: {
      input: {
        author,
        content,
      }
    }
  })
})
  .then(r => r.json())
  .then(data => console.log('data returned:', data));
```



## Authentication and Express Middleware
---

```js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

var schema = buildSchema(`
  type Query {
    ip: String
  }
`);

function loggingMiddleware(req, res, next) {
  console.log('ip:', req.ip);
  next();
}

var root = {
  ip: function (args, request) {
    return request.ip;
  }
};

var app = express();
app.use(loggingMiddleware);
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
```

express 에서는 인증을 처리하기 위해  [passport](http://passportjs.org/), [express-jwt](https://github.com/auth0/express-jwt) 혹은 [express-session](https://github.com/expressjs/session) 과 같은 라이브러리를 사용한다. 위 모듈들을 모두  `express-graphql`와 충돌 없이 이용이 가능하니까 편하게 써라.


막스형 유튜브 강의 [링크](https://www.youtube.com/watch?v=7giZGFDGnkc&list=PL55RiY5tL51rG1x02Yyj93iypUuHYXcB_)