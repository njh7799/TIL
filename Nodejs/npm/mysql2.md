# [mysql2](https://www.npmjs.com/package/mysql2)

## install 

```bash
npm install mysql2 --save
```

## 1. Make connection

```js
// models/connection.js
require('dotenv').config();
const mysql = require('mysql2/promise');
const connection = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE
});
console.log('Database Connected!');
module.exports = connection;
```
**중요** createPool을 사용하는 이유
1. createPool 대신에 createConnection을 사용해서 연결하는 방법도 있지만, createConnection을 비동기적으로 동작하기 때문에, 위 코드를 createConnection으로 변경하면, connecntion에 아무것도 담기지 않은 채로 export 된다.
2. 또한 데이터 베이스 여러개에 접근할 경우, createConnection을 이용할 경우, 매번 새로운 연결을 맺고 끊어야 하는데, 이는 매우 비효율적이다. 반면 createPool 을 이용하면 connection들이 pool안에 들어가게 되어, 매번 새로 연결할 필요 없이 pool 에서 연결을 꺼내서 사용할 수 있다. 자세한 동작 원리는 별도의 문서를 찾아봐야할듯하다.

## 2. Create Query
사실 이 단계는 nodejs의 mysql ORM인 sequelize를 이용하여 사용 하는것이 일반적이나, 본 문서에서는 orm을 사용하지 않는 방식을 다룬다. 

```js
// models/query.js
const connection = require('./connection');
const Query = function(query) {
  return connection.query(query);
};
module.exports = Query;

```
connection.query(`쿼리`) 를 실행하면, `쿼리`를 수행하고 반환값을 **Promise**의 형태로 돌려준다.

connection.query를 하면, 알아서 연결하고 쿼리를 수행하고 연결을 해제한다고 한다. 여기서 말하는 `연결`과 위 1번 단계의 데이터 베이스의 `연결`이 무슨 관계인지는 좀 더 공부해봐야할 듯하다.
참고로 connection.execute(query) 가 위와 비슷하게 동작하는데, 이 친구는 연결 및 해지에는 관여하지 않는다고 알고있다.

## 3.사용하기

```js
// routes/api.js

var express = require('express');
var router = express.Router();
const Query = require('../models/query');
/* GET home page. */
router.get('/CardSlide', async (req, res) => {
  const [rows, fields] = await Query('Select * from Cardslide');
  res.send(rows);
});
```
위에서 작성한 Query 함수를 호출하여 사용하면 된다.