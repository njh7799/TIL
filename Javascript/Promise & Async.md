# Promise

## Promise 내부는 언제 실행될까?

### 대조군
> 즉시 실행할 경우
```js
const startTime = new Date().getTime();
const promise = new Promise(function(resolve, reject){
  setTimeout(()=>{
    timer(startTime);
    resolve(true)
  }, 2000)
})

promise.then(()=>{
  console.log('실행')
})

function timer(startTime){
  const currentTime = new Date().getTime();
  const diff = currentTime - startTime;
  console.log(diff);
}
```

### 실험군
> 선언만 할 경우
```js
const startTime = new Date().getTime();
const promise = new Promise(function(resolve, reject){
  setTimeout(()=>{
    timer(startTime);
    resolve(true);
  }, 2000)
})

function timer(startTime){
  const currentTime = new Date().getTime();
  const diff = currentTime - startTime;
  console.log(diff);
}
```

> 5초 뒤 실행할 경우
```js
const startTime = new Date().getTime();
const promise = new Promise(function(resolve, reject){
  setTimeout(()=>{
    timer(startTime);
    resolve(true);
  }, 2000)
})

setTimeout(()=>{
  promise.then(()=>{
    timer(startTime);
    console.log('실행')
  })
}, 5000)

function timer(startTime){
  const currentTime = new Date().getTime();
  const diff = currentTime - startTime;
  console.log(diff);
}
```

### 결과
첫번 째 실험군을 보면 선언만 되면 바로 내부 로직시 실행 됨을 알 수 있다. 또한 두번 째 실험군을 보면 `promise.then()` 코드는 5초 후 즉시 실행 된다. 즉, promise 는 resolve 가능한 상태가 되면 언제든 resolve 할 수 있도록 대기하고 있다. 정리하면 아래와 같다.

- Promise 의 내부 로직은 선언과 동시에 실행된다.
- Promise는 resolve 가능한 상태가 되면 대기한다.

## Promise.then 의 결과값은 무엇일까?

Promise 객체이다. then 에서 값을 반환한다면 그 값을 resolver로 가지고 있는 Promise가 될 것이고 에러를 발생시킨다면 rejecter 를 가지고 있는 Promise가 될 것이다.

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

## Promise의 execution 함수는 비동기적으로 실행된다.
우선 아래의 코드를 보자
```js
const promise = new Promise((res,rej)=>{
  res(true)
}).then(()=>"resolve");
console.log(promise) // Promise {<pending>}
```
Promise가 pending 상태인 것은 당연하다. Promise 의 execution 함수는 노드(혹은 브라우저)에 의해 비동기적으로 실행되고 그 반환 값은 마이크로 태스크 큐에 들어가게 된다. 마이크로 태스크 큐는 콜 스택이 비어야 콜 스택에 들어갈 수 있기 때문에 console.log(promise)를 한 시점에서는 아직 펜딩상태인 것이다.

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

## 마이크로 태스크
마이크로 태스크는 매크로 태스크보다 먼저 실행이 된다.
```js
setTimeout(() => alert("timeout"));
Promise.resolve()
  .then(() => alert("promise"));
alert("code");
```

## [이벤트 루프 시각화](https://jakearchibald.com/2015/tasks-microtasks-queues-and-schedules/)



# Asynchronous

## async 함수의 결과 값

### 1. 그냥 return 때렸을 경우

```js
async function run(){
	return 'run'
}
console.log(run()) // Promise {<resolved>: "run"}
```

프로미스 객체에 감싸져서 반환된다.

### 2. 프로미스를 반환할 경우

```JS
async function run(){
	return new Promise((resolve, reject)=>{
		resolve("run")
	})
}
console.log(run()) // Promise {<pending>}
// 콜스택을 비운 후 실행
console.log(run()) // Promise {<resolved>: "run"}
```

그렇다. 그냥 그대로 반환 된다.



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



## async wrapper

에러를 핸들링해주는 래퍼

```js
const doAsync = fn => async (...params) =>
  await fn(...params).catch(err => console.log(err));
export default doAsync;
```