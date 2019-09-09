# Sharing javascript obj

js 에서는 하나의 파일에서 생성한 객체를 다른 여러 파일에서 공유할 수 있다.

root
├─ main.js
├─ run.js
└─ data.js

```javascript
//data.js
class Data {
  constructor() {
    this.datalist = [];
  }
  push(a) {
    this.datalist.push(a);
  }
}
const data = new Data();
module.exports = data;
```

```javascript
//run.js
const data = require('./data');
function run() {
  data.push('push');
}
module.exports = run;
```

```javascript
//main.js
const data = require('./data');
const run = require('./run');
run();
run();
run();
console.log(data)
```

![캡처](https://user-images.githubusercontent.com/40619551/64499149-c88b4600-d2f2-11e9-8854-f5b39d6e4f26.JPG)

