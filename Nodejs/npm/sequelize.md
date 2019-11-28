# Sequelize

## 공식문서  <small>[link](https://sequelize.org/master/manual/getting-started.html)</small>

를 읽어보는 것이 가장 좋다. 정리가 잘 되어 있다.



- 데이터 초기화

  `bulkCreate` 메소드를 사용하면 된다.

  ```js
  User.bulkCreate([
    { username: 'barfooz', isAdmin: true },
    { username: 'foo', isAdmin: true },
    { username: 'bar', isAdmin: false }
  ]).then(() => { // Notice: There are no arguments here, as of right now you'll have to...
    return User.findAll();
  }).then(users => {
    console.log(users) // ... in order to get the array of user objects
  })
  ```

  



이하 공식 문서 요약.

# Getting sarted

---

## Installing

```bash
npm install sequelize --save-prod
npm install sequelize-cli --save-dev
```

```bash
npm install --save mysql2
```

## Setting up a connection

```js
const Sequelize = require('sequelize');

// Option 1: Passing parameters separately
const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: 'mysql'
});

// Option 2: Passing a connection URI
const sequelize = new Sequelize('mysql://user:pass@example.com:3306/dbname');
```

## Note: connection pool (production)

```js
const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: 'mysql'
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});
```

## Testing the connection

```js
sequelize
  .authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });
```

## Closing the connection

```js
sequelize.close() // 비동기이며, Promise를 반환한다.
```

## Modeling a table

첫 번째 방법:  `Sequelize.Model.init(attributes, options) ` 사용하기

```js
const Model = Sequelize.Model;
class User extends Model {}
User.init({
  // attributes
  firstName: {
    type: Sequelize.STRING,
    allowNull: false
  },
  lastName: {
    type: Sequelize.STRING
    // allowNull defaults to true
  }
}, {
  sequelize,
  modelName: 'user'
  // options
});
```

두 번째 방법:   `sequelize.define` 사용하기

```js
const User = sequelize.define('user', {
  // attributes
  firstName: {
    type: Sequelize.STRING,
    allowNull: false
  },
  lastName: {
    type: Sequelize.STRING
    // allowNull defaults to true
  }
}, {
  // options
});
```

내부적으로 `sequelize.define` 가 `Model.init`.를 호출한다.

## Synchronizing the model with the database

If you want Sequelize to automatically create the table (or modify it as needed) according to your model definition, you can use the `sync` method, as follows:

```js
// Note: using `force: true` will drop the table if it already exists
User.sync({ force: true }).then(() => {
  // Now the `users` table in the database corresponds to the model definition
  return User.create({
    firstName: 'John',
    lastName: 'Hancock'
  });
});
```

### Synchronizing all models at once

Instead of calling `sync()` for every model, you can call `sequelize.sync()` which will automatically sync all models.

이거를 해줘야 실행될 때 db에 모델 데이터가 테이블로 추가 된다.

위험한 방법으로는 sequelize.sync({ force: true }) 가 있는데, 이걸 해야 DB 구조의 변경도 반영이 되기 때문에, 쓰지 마라.



## Querying

A few simple queries are shown below:

```js
// Find all users
User.findAll().then(users => {
  console.log("All users:", JSON.stringify(users, null, 4));
});

// Create a new user
User.create({ firstName: "Jane", lastName: "Doe" }).then(jane => {
  console.log("Jane's auto-generated ID:", jane.id);
});

// Delete everyone named "Jane"
User.destroy({
  where: {
    firstName: "Jane"
  }
}).then(() => {
  console.log("Done");
});

// Change everyone without a last name to "Doe"
User.update({ lastName: "Doe" }, {
  where: {
    lastName: null
  }
}).then(() => {
  console.log("Done");
});
```



# Migrations <small>[link](https://sequelize.org/master/manual/migrations.html)</small>

---

## Installing CLI

Let's start with installing CLI, you can find instructions [here](https://github.com/sequelize/cli). Most preferred way is installing locally like this

```bash
npm install --save sequelize-cli
```

## Bootstrapping

빈 프로젝트를 생성하고자 한다면, init` 명령어를 실행하면 된다.

```bash
npx sequelize-cli init
```

위 코드를 싱행하면 아래의 디렉토리가 생성된다.

- `config`, contains config file, which tells CLI how to connect with database
- `models`, contains all models for your project
- `migrations`, contains all migration files
- `seeders`, contains all seed files

## Creating first Model (and Migration)

Once you have properly configured CLI config file you are ready to create your first migration. It's as simple as executing a simple command.

We will use `model:generate` command. This command requires two options

- `name`, Name of the model
- `attributes`, List of model attributes

Let's create a model named `User`.

```bash
npx sequelize-cli model:generate --name User --attributes firstName:string,lastName:string,email:string
```

This will do following

- user(**소문자**)라는 이름의 모델 파일이 `model/` 디렉토리에 생성된다.
- `XXXXXXXXXXXXXX-create-user.js` 형식의 마이그레이션 파일이`migrations/` 디렉토리에 생성된다. 

**Note:** *Sequelize will only use Model files, it's the table representation. On the other hand, the migration file is a change in that model or more specifically that table, used by CLI. Treat migrations like a commit or a log for some change in database.*

## Running Migrations

이 단계 이전에는, 우리는 아직 데이터 베이스에 아무런 값도 넣지 않은 상태이다. 우리는 이제 막 우리의 첫번에 모델인 User에 대한 정보와 마이그레이션을 작성하였다. 이제 이 테이블을 데이터 베이스에 추가하기 위해서는  `db:migrate` 명령어를 실행하여야 한다.

```bash
npx sequelize-cli db:migrate
```

This command will execute these steps:

- Will ensure a table called `SequelizeMeta` in database. This table is used to record which migrations have run on the current database
- Start looking for any migration files which haven't run yet. This is possible by checking `SequelizeMeta` table. In this case it will run `XXXXXXXXXXXXXX-create-user.js` migration, which we created in last step.
- Creates a table called `Users` with all columns as specified in its migration file.
- 대충 정리하자면 DB에 `SequelizeMeta` 라는 table에 마이그레이션 이름을 넣는다. 그리고 변경 사항을 DB에 추가한다. 여기서 중요한 것은 로컬의 *모델*을 보는 것이 아니라 *마이그레이션 파일*을 보고 DB를 변경한다는 것이다.

## Undoing Migrations

Now our table has been created and saved in database. With migration you can revert to old state by just running a command.

You can use `db:migrate:undo`, this command will revert most recent migration.

```bash
npx sequelize-cli db:migrate:undo
```

You can revert back to initial state by undoing all migrations with `db:migrate:undo:all` command. You can also revert back to a specific migration by passing its name in `--to` option.

```bash
npx sequelize-cli db:migrate:undo:all --to XXXXXXXXXXXXXX-create-posts.js
```

대충 마이그레이션 전 상태로 돌아간다. 딱 제곧내라고 할 수 있다.

**주의** 놀랍게도 sequelize의 마이그레이션은 테이블을 추가하는 경우만 기록에 남는다. 정말 별로라고 할 수 있다.

## Creating First Seed

초기 데이터를 넣어보자.

```js
npx sequelize-cli seed:generate --name demo-user
```

  `XXXXXXXXXXXXXX-demo-user.js`의 형식의 파일이 seed 디렉토리에 생성될 것이다. 안에 들어있는 데이터는 더미니까 우리한테 맞게 바꾸자.

```js
'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Users', [{
        firstName: 'John',
        lastName: 'Doe',
        email: 'demo@demo.com',
        createdAt: new Date(),
        updatedAt: new Date()
      }], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Users', null, {});
  }
};
```



### Running Seeds

눈치가 있으면 알겠지만, 당연히 아직 DB에는 적용이 되지 않았다. Seed를 실행시켜버리자.

```bash
npx sequelize-cli db:seed:all
```

This will execute that seed file and you will have a demo user inserted into `User` table.

**Note:** *Seeders 작업은  `SequelizeMeta` 테이블을 사용하는 마이그레이션과 다르게 별도로 저장이 되지 않는다. *



## Undoing Seeds

Seeders can be undone if they are using any storage. There are two commands available for that:

If you wish to undo most recent seed

```bash
$ npx sequelize-cli db:seed:undo
```

If you wish to undo a specific seed

```bash
$ npx sequelize-cli db:seed:undo --seed name-of-seed-as-in-data
```

If you wish to undo all seeds

```bash
$ npx sequelize-cli db:seed:undo:all
```



# Association [link]( https://sequelize.org/master/class/lib/associations/base.js~Association.html )

---

- hasOne - adds a foreign key to the target and singular association mixins to the source.
- belongsTo - add a foreign key and singular association mixins to the source.
- hasMany - adds a foreign key to target and plural association mixins to the source.
- belongsToMany - creates an N:M association with a join table and adds plural association mixins to the source. The junction table is created with sourceId and targetId.

솔직히 뭔 소린지 모르겠다. 설명에 성의가 없어보인다. 실험 결과 hasOne 과 belongsTo  는 반대 의임은 확인이 가능했다.

find method 링크[find](https://sequelize.org/master/manual/querying.html)



# 링크

[migration & seeding](https://sequelize.org/master/manual/migrations.html)

[query](https://sequelize.org/master/manual/querying.html)

[include(join)](https://sequelize.org/master/manual/models-usage.html)