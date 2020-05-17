# 비동기

이 글은 전제는 크게 세가지이다.

- [이벤트 루프](https://www.youtube.com/watch?v=8aGhZQkoFbQ&t=263s)를 이해하고 있다.
- promise와 async await를 어느정도 다를 줄 안다.
- 마이크로 태스크 큐와 매크로 태스크 큐가 뭔지 안다.

이 글은 나의 궁금증과 이를 해결하는 과정으로 진행될 것이다. 따라서 내용이 뒤죽박죽일 수 있음을 미리 알린다.

🚨 **잘못된 정보가 있을 수도 있다. 방금도 하나 발견했다.**

**이 글에서 web API 요청이라고 하면 setTimeout, ajax 등 비동기 요청을 의미한다.**



## 기초적인 비동기 동작

```js
console.log("before setTimeout");
setTimeout(() => {
  console.log("In setTimeout");
});
console.log("after setTimeout");
```

```js
before setTimeout
after setTimeout
In setTimeout
```

#### 해석

1. before setTimeout가 출력된다.
2. setTimeout 을 실행하면 webAPI 에게 이를 위임한다. webAPI가 작업을 마치고 나면 콜백함수를 태스크 큐에 넣는다.
3. after setTimeout가 출력된다.
4. 메인 함수가 종료되어 콜스택이 비기 때문에 태스크 큐의 front에 있는 콜백 함수가 콜스택에 들어간다.
5. In setTimeout이 출력된다.



## Promise는 어떻게 동작할까?

### Promise의 콜백함수를 동기적으로 작성

```js
const promise = new Promise((res, rej) => {
  res(true);
});
console.log(promise);

```

```
Promise { true }
```

#### 해석

web API 요청이 없기 때문에 모든 코드가 순차적으로 실행된다.

#### 알 수 있는 것

- promise내부 로직은 동기적으로 실행된다.



### Promise의 콜백함수 내부에 setTimeout 적용

```js
const promise = new Promise((res, rej) => {
  setTimeout(() => {
    res(true);
  });
});
console.log(promise);

```

```
Promise { <pending> }
```

#### 해석

console.log 가 실행될 때 setTimeout 내부의 콜백 함수는 아직 태스크 큐에 있으므로 출력 당시 promise는 pending 상태이다.

#### 알 수있는 것

- setTimeout의 시간이 끝난 상태일지라도 setTimeout의 콜백함수가 실행되지 않은 상태이면 promise는 여전히 pending 상티이다.



### 그냥 조금 더 복잡한 코드

```js
console.log("before promise");

const promise = new Promise((res) => {
  console.log("before setTimeout");
  setTimeout(() => {
    console.log("setTimeout");
    res("true");
  });
  console.log("after setTimeout");
});

console.log("after promise");
```

```
before promise
before setTimeout
after setTimeout
after promise
setTimeout
```

### 알 수 있는 것

- promise내부 로직은 동기적으로 실행된다.
- setTimeout을 만나면 webAPI에게 위임한다.

과거에 나는 promise.then을 실행해야 promise 내부 로직이 실행되는줄 알았다. 하지만 promise 내부 로직은 그냥 선언과 동시에 자연스럽게 동기적으로 실행됨을 알 수 있었다.



## Promise와  then 사이에는 다른 작업이 들어갈 수 있을까?

```js
new Promise((res, rej) => {
  console.log("first Promise");
  res(true);
}).then((res) => {
  console.log("first Promise resolved");
});

new Promise((res, rej) => {
  console.log("second Promise");
  res(true);
}).then((res) => {
  console.log("second Promise resolved");
});

console.log("the other");

```

```js
first Promise
second Promise
the other
first Promise resolved
second Promise resolved
```

매우 잘 들어간다.



## 마이크로 태스크

```js
setTimeout(() => alert("timeout"));
Promise.resolve()
  .then(() => alert("promise"));
alert("code");
```

#### 알 수 있는 것

- 마이크로 태스크는 매크로 태스크보다 먼저 실행이 된다.



## Promise 내부에 있는 web api 요청(* 여기서는 setTimeout을 의미)  동작이 끝난 후 매크로 태스크 큐에 들어갈까 마이크로 태스크 큐에 들어갈까?

```js
console.log("before promise");

setTimeout(() => {
  console.log("async!!");
});

const promise = new Promise((res) => {
  setTimeout(() => {
    console.log("setTimeout");
    res("true");
  });
});

console.log("after promise");

```

```
before promise
after promise
async!!
setTimeout
```

### 알 수 있는 것

매크로 태스크큐에 들어간다.



## Promise.then 의 결과값은 무엇일까?

```js
const promise1 = new Promise((res,rej)=>{
  res(true)
}).then(()=>"resolve")

const promise2 = new Promise((res,rej)=>{
  res(true)
}).then(()=>{throw new Error("some err")})
setTimeout(()=>{
  console.log(promise1); // Promise {<resolved>: "resolve"}
  console.log(promise2); // Promise {<rejected>: Error: some err}
})
```

#### 알 수 있는 것

- Promise.then은 Promise 객체를 반환한다. 
- then 에서 값을 `return`한다면 그 값을 resolver로 가지고 있는 Promise가 반환되고 에러를 발생시킨다면 rejecter 를 가지고 있는 Promise가 반환된다.



## async 함수의 결과 값

### 그냥 return 때렸을 경우

```js
async function run(){
	return 'run'
}
console.log(run())
```

```
Promise {<resolved>: "run"}
```

프로미스 객체에 감싸져서 반환된다.



### 프로미스를 반환할 경우

이 경우에는 고생을 했어서 그 과정을 가져오겠다.

```js
async function run() {
  const promise = new Promise((resolve, reject) => {
    resolve("run");
  });
  return promise;
}

console.log(run());
```

```
Promise { <pending> }
```

그 어디에도 비동기 동작이 보이지 않는데 resolved가 아니라 pending이 나왔다. 

혹시 run 내부 로직에서 promise가 resolve 되지 않았나 싶어 다음과 같은 시도를 해보았다.

```js
async function run() {
  const promise = new Promise((resolve, reject) => {
    resolve("run");
  });
  console.log(promise);
  return promise;
}

run();
```

```
Promise { 'run' }
```

promise 자체는 문제가 없음을 확인할 수 있었다. 그렇다면 결론은 async 함수가 promise를 반환하는 과정에서 태스트 큐에 함수가 들어가는 현상이 생겼다는 것인데, 왜 이런 일이 발생하는 것일까? 이 추론이 맞기는 한 것일까?

### 콜스택을 비워보자

setTimeout을 이용하여 콜스택을 비훈 후 다시 출력해보자.

```js
async function run() {
  const promise = new Promise((resolve, reject) => {
    resolve("run");
  });
  return promise;
}

const r = run();
console.log(r); // 원래 코드
setTimeout(() => {
  // 기존의 콜스택을 비운 후 실행된다.
  console.log(r);
});
```

```
Promise { <pending> }
Promise { 'run' }
```

왜일까...

자문을 구해본 결과 답은 Promise 안에 Promise가 들어가서 그렇다고 한다. async 함수가 promise를 반환하는 경우 이 promise가 그대로 반환 되는 것이 아니라 promise를 Promise로 한 번 더 감싸서 반환하는 것이다! 여전히 의문 점은 남지만 왜 그런지에 대한 답은 일단 되었다.

### promise 안에 promise

그래서 promise 안에 promise가 들어간 경우를 만들어 보았다. 위에 만든 함수 run() 의 반환 값과 promise는 완전히 동일하다.

```js
const innerPromise = new Promise((resolve, reject) => {
  resolve(true);
});

const outerPromise = new Promise((resolve, reject) => {
  resolve(innerPromise);
});

console.log(outerPromise);// ...(1)
setTimeout(() => {
  console.log(outerPromise);// ...(2)
});
```

```
Promise { <pending> }
Promise { 'run' }
```

#### 결론

promise안에 promise가 들어갈 경우 outerPromise 가 innerPromise의 resolved 값을 그대로 가져오는데, 이 과정이 비동기적으로 실행된다.  위의 (1) 단계에서는 아직 innerPromise의 resolved 값이 outerPromise 에게 전달이 되지 않은 상태라는 것이다. 따라서 pending 으로 표기된다. (1)이 끝나면 콜스택이 비워지기 때문에 이 과정이 태스크큐에서 콜스택으로 들어가 수행되게 되고 그 이후에 실행한 (2) 에서는 정상적인 값이 나오게 된 것이다.

🚨 **이 결론은 나의 추리이다!! 실제로는 아닐 가능성이 높다**



## Async Await의 내부 동작 원리

await 를 만나기 전에는 동기적으로 실행이 된다. await 를 만나면 await 구문을 마치 `Promise` 내부 로직처럼 실행한 후 await 의 다음 줄을 마치 `.then` 처럼 실행한다.

### await가 없는 경우

```js
async function run(){
	console.log('a'); // (a)
    console.log('b'); // (b)
}
run(); // (run)
console.log('end'); // (end)
```

```js
a
b
end
```

### 실행 순서

`(run) -> (a) -> (b) -> (end)`

그냥 동기적으로 주욱 실행 된다.

### await가 처음에 있는 경우

```js
async function run(){
	await console.log('a'); // (a)
    console.log('b'); // (b)
}
run(); // (run)
console.log('end'); // (end)
```

```js
a
end
b
```

### 실행 순서

`(run) -> (a) -> (end) -> (b)`

(a) 까지 실행된 후 다음줄부터를 이벤트 루프에 넣어버린다. 따라서 a, end 가 출력된 후 콜스택이 비고 b를 출력하는 함수가 콜스택에 들어가서 위와 같은 결과가 나온다.



### await가 중간에 있는 경우

```js
async function run(){
	console.log('a'); // (a)
    console.log('b'); // (b)
    await console.log('c'); // (c)
    console.log('d'); // (d)
    console.log('e'); // (e)
}
run(); // (run)
console.log('end'); // (end)
```

```js
a
b
c
end
d
e
```

### 실행 순서

`(run) -> (a) -> (b) -> (c) -> (end) -> (d) -> (e)`

a, b 실행 후 c 에서 프로미스 블록을 만들고 이하 구문들은 이벤트 루프에 들어간다.





# 기타

## promisify(f)
> 함수 f를 Promise 로 감싸주는 함수를 반환하는 함수

- f(args,callback){}
- callback(err, data){}

```js
function promisfy(f) {
  return function(...args) {
    return new Promise((resolve, reject) => {
      f(...args, (err, data) => {
        if (err) reject(err);
        resolve(data);
      });
    });
  };
}
```

## async wrapper

에러를 핸들링해주는 래퍼

```js
const doAsync = fn => async (...params) =>
  await fn(...params).catch(err => console.log(err));
export default doAsync;
```

## Ref
- [Are javascript's async functions actually synchronous?](https://stackoverflow.com/questions/57906002/are-javascripts-async-functions-actually-synchronous)

- [이벤트 루프 시각화 자료](https://jakearchibald.com/2015/tasks-microtasks-queues-and-schedules/)

  

