asyn 함수와 then 의 return 값은 promise!!

## async wrapper

에러를 핸들링해주는 래퍼

```js
const doAsync = fn => async (...params) =>
  await fn(...params).catch(err => console.log(err));
export default doAsyn;
```
