# Object

1. 구조

```javascript
const obj = {
    key1:value1,
    ket2:value2
}
```

2. 새 요소 추가하기

```javascript
obj[new_key] = new_value
```

3. 요소 삭제하기

```javascript
delete obj.key;
```

4. 특정 변수에 값을 할당하고 {} 사이에 넣으면 바로 key-value가 설정이 된다.

```js
const a=3
const obj={a}
console.log(obj)

=> {a:3}
```

