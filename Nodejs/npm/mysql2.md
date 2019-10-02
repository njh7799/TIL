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

> Prepared Statements와 Promise Wrapper 를 동시에 사용하면 동작이 안된다.

 Case 1. Prepared Statements 만 사용한 경우
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


 Case 2. Promise Wrapper 만 사용한 경우
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
         promisePool.query("SELECT * from users where id=2", (err, results) => {
             resolve(results)
         })
     }).then(results => res.send(results))
 });
 
 module.exports = router;
 ```

 Case3. Prepared Statements와 Promise Wrapper 둘 다 사용한 경우
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
         promisePool.query("SELECT * from users where id=?",['2'], (err, results) => {
             resolve(results)
         })
     }).then(results => res.send(results))
 });
 
 module.exports = router;
 ```

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

Case 4 new Promise 제거 후 콜백 제거

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





 Case 1과 2는 잘 동작하지만, 3은 동작하지 않는다. 몹시 화가난다.
Case 4 실패 5 성공

