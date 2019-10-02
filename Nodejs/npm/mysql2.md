# [mysql2](https://www.npmjs.com/package/mysql2)

## install 

```bash
npm install mysql2 --save
```



## Establishing a new connection.

```js
// get the client
const mysql = require('mysql2');
 
// Create the connection pool. The pool-specific settings are the defaults
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'test',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});
```
**중요** createPool을 사용하는 이유
1. createPool 대신에 createConnection을 사용해서 연결하는 방법도 있지만, createConnection을 비동기적으로 동작하기 때문에, 위 코드를 createConnection으로 변경하면, connection에 아무것도 담기지 않은 채로 export 된다.
2. createConnection 을 이용하면 한 번에 하나의 연결만을 할 수 있다. 따라서 여러개의 커넥션이 필요한 경우, 매번 새로운 연결을 맺고 끊어야 하는데, 이는 매우 비효율적이다. 반면 createPool 을 이용하면 connection들이 pool안에 들어가게 되어, 매번 새로 연결을 `만들` 필요 없이 pool 에서 연결을 꺼내서(없을 경우 생성해서) `사용`할 수 있다.

[diff1](https://stackoverflow.com/questions/26432178/what-is-the-difference-between-mysql-createconnection-and-mysql-createpool-in-no)https://stackoverflow.com/questions/53197922/difference-between-query-and-execute-in-mysql)



## Usage

```js
async function main() {
  // get the client
  const mysql = require('mysql2');
  // create the pool
  const pool = mysql.createPool({host:'localhost', user: 'root', database: 'test'});
  // now get a Promise wrapped instance of that pool
  const promisePool = pool.promise();
  // query database using promises
  const [rows,fields] = await promisePool.query("SELECT 1");
```
connection.query(`쿼리`) 를 실행하면, `쿼리`를 수행하고 반환값을 **Promise**의 형태로 돌려준다.

connection.query를 하면, 알아서 연결하고 쿼리를 수행하고 연결을 해제한다고 한다. 여기서 말하는 `연결`과 위 1번 단계의 데이터 베이스의 `연결`이 무슨 관계인지는 좀 더 공부해봐야할 듯하다.
참고로 connection.execute(query) 가 위와 비슷하게 동작하는데, 이 친구는 연결 및 해지에는 관여하지 않는다고 알고있다.



## Using Promise Wrapper

1. Promise Wrapper를 사용하지 않고 query method를 이용하는 방법:

```js
const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'test',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

pool.query("SELECT field FROM atable", function(err, rows, fields) {

})
```

이 경우 query 메소드는 첫 번째 인자로 **쿼리**를, 두 번째 인자로 결과값을 처리할 **콜백 함수**를 가진다.(prepared statement는 일단 빼고 생각하자.) 이 구문을 Promise를 이용하여 바꿔보자.

```js
getQuery = new Promise((resolve, reject)=>{
    pool.query("SELECT field FROM atable", function(err, rows, fields) {
   		if(err) reject(err);
        resolve([rows, fields]);
	})
})

```

이제 getQuery를 사용하면 then 구문을 이용할 수도 있고, async await 연산 또한 수행할 수 있다.

딱 봐도 겁나 편한 기능인데 역시나, mysql2에서도 지원하는 기능이다. 사용법은 아래와 같다.

2. Promise Wrapper를 사용하여  query method를 이용하는 방법 

Case 1. `mysql2`을 이용

```js
async function main() {
  // get the client
  const mysql = require('mysql2');
  // create the pool
  const pool = mysql.createPool({host:'localhost', user: 'root', database: 'test'});
  // now get a Promise wrapped instance of that pool
  const promisePool = pool.promise();
  // query database using promises
  const [rows,fields] = await promisePool.query("SELECT 1");
}
```

Case 2. `mysql/promise`를 이용

```js
async function main() {
  // get the client
  const mysql = require('mysql2/promise');
  // create the pool which is wrapped by Promise
  const pool = mysql.createPool({host:'localhost', user: 'root', database: 'test'});
  // query database using promises
  const [rows,fields] = await pool.query("SELECT 1");
}
```

mysql2/promise를 이용하여 pool을 만들거나, mysql2 를 이용하여 만든 pool을 promise화 시킨 후 실행시킨 query 메소드는 위에서 작성한 getQuery와 동작 방식이 같다.

## Deeper

ORM처럼 동작하게 만들어 보자.

```bash
...
├─models
│      index.js
│      users.js
...
```

```js
// models/index.js

const mysql = require('mysql2');

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    database: process.env.DB_DATABASE,
});

const createQuery = (query, params = []) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (err, results, fields) => {
            if (err) reject(err);
            resolve(results)
        })
    })
}

console.log('Database Connected!');

const users = require('./users')(createQuery)
// const [accesses, cards, colums, dashboards, logs];

module.exports = { users }


```

```js
// models/users.js

module.exports = (createQuery) => {
    return {
        findAll: () => createQuery(`SELECT username, is_admin FROM users`),
        findById: (id) => createQuery(`SELECT username, is_admin FROM users WHERE id=?`, [id]),
    }
}
```

```js
// routes/api.js

var router = require('express').Router();

const { users } = require('../models')

/* GET home page. */
router.get('/users', function (req, res, next) {
    users.findAll()
        .then(results => res.send(results))
        .catch(err => next(err))
});

router.get('/users/:id', function (req, res, next) {
    users.findById(req.params.id)
        .then(results => res.send(results))
        .catch(err => res.send(err))
});

module.exports = router;

```





## BUG

> 잘못 공부하다가 우연히 재밌는 버그를 찾았다.

 Case 1. pool.query에 Prepared Statements 를 사용한 경우 **정상동작**
 ```js
 var router = require('express').Router();
 
 router.get('/users', async function (req, res, next) {
     const mysql = require('mysql2');
     const pool = mysql.createPool({
         host: 'localhost',
         user: process.env.DB_USER,
         password: process.env.DB_PASSWORD,
         database: 'todo'
     });
 	// Promise Wrapper 사용 안 함
     new Promise((resolve, reject) => {
         // Prepared Statements 사용
         pool.query("SELECT * from users where id=?", ['2'], (err, results) => {
             resolve(results)
         })
     }).then(results => res.send(results))
 });
 
 module.exports = router;
 
 ```


 Case 2. Promise Wrapper 를 사용한 경우 **버그 발생** - **정상동작** ???
 ```js
 var router = require('express').Router();
 
 router.get('/users', async function (req, res, next) {
     const mysql = require('mysql2');
     const pool = mysql.createPool({
         host: 'localhost',
         user: process.env.DB_USER,
         password: process.env.DB_PASSWORD,
         database: 'todo'
     });
     // Promise Wrapper 사용
     const promisePool = pool.promise();
     new Promise((resolve, reject) => {
         // Prepared Statements 사용 안 함
         
         //문제의 지점
         promisePool.query("SELECT * from users where id=2", (err, results) => {
             resolve(results)
         })
     }).then(results => res.send(results))
 });
 
 module.exports = router;
 ```
 promisePool.query는 Promise를 return해주는 메소드이기 때문에 콜백 함수가 동작해서는 안되고 당연히 존재 해서도 안된다. 하지만 정상적으로 동작한다.


 Case3. Prepared Statements와 Promise Wrapper 를 같이 사용한 경우
 ```js
 var router = require('express').Router();
 
 router.get('/users', async function (req, res, next) {
     const mysql = require('mysql2');
     const pool = mysql.createPool({
         host: 'localhost',
         user: process.env.DB_USER,
         password: process.env.DB_PASSWORD,
         database: 'todo'
     });
     // Promise Wrapper 사용
     const promisePool = pool.promise();
     new Promise((resolve, reject) => {
         // Prepared Statements 사용
         
         // 문제의 지점
         promisePool.query("SELECT * from users where id=?",['2'], (err, results) => {
             resolve(results)
         })
     }).then(results => res.send(results))
 });
 
 module.exports = router;
 ```
 기본적으로 promise query의 메소드는 최대 두개의 인자만 받는다. 따라서 위와 같이 작성할 경우, 세번째 인자인 콜백 함수가 제거되기 때문에, 결과값을 받지 않는 것이다.

 Case 2는 동작해서는 안되는 코드이다. 하지만 콜백함수가 돌아가는 버그가 있다. prepared statement를 고려하여 패러미터의 갯수를 2개로 제한하는 부분은 구현했지만, 콜백 함수가 들어올 경우에 대한 코드는 작성하지 않은듯하다.

Case 4 new Promise 제거
```js
var router = require("express").Router();

router.get("/users", async function (req, res, next) {
    const mysql = require("mysql2");
    const pool = mysql.createPool({
        host: "localhost",
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: "todo"
    });
    // Promise Wrapper 사용
    const promisePool = pool.promise();
    // Prepared Statements 사용
    promisePool.query("SELECT * from users where id=?",['2'], (err, results, f) => res.send(results))
});

module.exports = router;
```

Case 5 new Promise 제거 후 콜백 제거

```js
var router = require("express").Router();

router.get("/users", async function (req, res, next) {
    const mysql = require("mysql2");
    const pool = mysql.createPool({
        host: "localhost",
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: "todo"
    });
    // Promise Wrapper 사용
    const promisePool = pool.promise();
    // Prepared Statements 사용
    promisePool
        .query("SELECT * from users where id=?", ["2"])
        .then(([results, f]) => res.send(results));
});

module.exports = router;
```
