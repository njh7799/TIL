# Sequelize

## 공식문서  <small>[link](https://sequelize.org/master/manual/getting-started.html)</small>

를 읽어보는 것이 가장 좋다. 정리가 잘 되어 있다.

## Installing

```bash
npm install sequelize sequelize-cli
```

## quik start  <small>[link]( https://sequelize.org/master/ )</small>

```js
const { Sequelize, Model, DataTypes } = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:'); // 인메모리

class User extends Model {}
User.init({
  username: DataTypes.STRING,
  birthday: DataTypes.DATE
}, { sequelize, modelName: 'user' });

sequelize.sync() // 디비에 스키마를 반영
  .then(() => User.create({
    username: 'janedoe',
    birthday: new Date(1980, 6, 20)
  }))
  .then(jane => {
    console.log(jane.toJSON());
  });
```

## Querying

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

Assosiation

assositation을 별도로 제작하여 마지막에 한번에 몰아서 처리하는 것이 낫다.

테이블을 제거할 때는 반대로 assositaion을 제거하고 테이블을 삭제하면 된다.

