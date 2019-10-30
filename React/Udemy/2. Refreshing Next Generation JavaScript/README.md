<h1>Refreshing Next Generation
JavaScript</h1>

<h2>Variables in javascript</h2>

|      name      |   var    |  let  | const |
| :------------: | :------: | :---: | :---: |
|     Scope      | function | block | block |
| Changing Value |    O     |   O   |   X   |

<h2>Spread & Rest Operator</h2>

- Spread Operator

  배열의 요소들 혹은 객체의 속성들을 분할 할 때 사용된다.

```javascript
const newArray = [...oldArray, 1, 2];
const newObject = { ...oldObject, newProp: 5 };
```

- Rest Operator

  함수의 매개변수를 array의 형태로 변환시킬 때 사용된다.

```javascript
function sortArgs(...args){
    return args sort();
}
```

<h2>Destructuring</h2>

- Array Destructuring

```javascript
const [a, b] = ['Hello', 'Max'];
const [n1, , n2] = [1, 2, 3];
```

- Object Destructuring

```javascript
const { name } = { name: 'MAx', age: 28 };
```

<h2>Exports and Imports</h2>

<h3> Javascript </h3>
person.js

```javascript
const person = {
  name: 'Max'
};
export default person;
```

utility.js

```javascript
export const clean = () => {};
export const baseData = 10;
```

app.js

```javascript
import person from './person.js';

//changing name in default export
import prs from './person.js';

import { baseData } from './utility.js';

//changing name in named export
import { baseData as bD } from './utility.js';
import { clean } from './utility.js';
```

<h3> Node JS</h3>

```javascript
const person = {
  name: 'Max'
};
module.exports = person;
```

utility.js

```javascript
const clean = () => {};
const baseData = 10;
module.exports = { clean, baseData };
```

app.js

```javascript
person = require('./person.js');
prs = require('./person.js');

const { baseData, clean } = require('./utility.js');
```

<h2>Copy</h2>

- Shallow Copy 와 Deep Copy
  <img src="https://i.stack.imgur.com/AWKJa.jpg">

* Copy in Object
  ```javascript
  const person = {
    name: 'Jack'
  };
  // Shallow Copy
  const secondPerson = person;
  // Deep Copy
  const thirdPerson = { ...person };
  ```

<h2>Class</h2>

How to define

```javascript
class Person {
  constructor() {
    this.name = 'Max';
  }

  //Method
  printName() {
    console.log(this.name);
  }
}
```

Inheritance

```javascript
class Human {
  constructor() {
    this.gender = 'male';
  }
}
class Person extends Human {
  constructor() {
    super();
    this.name = 'Max';
  }
}
```

<h2>Arrow Function</h2>

- 사용 방법

  ```javascript
  //1
  const Func = () => value;

  //2
  const Func = () => {
    return value;
  };
  ```

- 특징
  - this 가 function에 bind 되지 않는다.

<h2>Array Methods</h2>

- map()
- find()
- findIndex()
- filter()
- reduce()
- concat()
- slice()
- splice()
