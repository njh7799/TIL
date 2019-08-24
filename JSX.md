<h1>JSX Restrictions</h1>
JSX 는 HTML과 매우 비슷하지만, 그 본질은 javascript이다. 따라서 사용에 있어서 주의해야할 부분이 몇가지 존재한다.

1. 'class' 를 쓰지 못한다

```javascript
//Wrong
<div class = 'abc'>

//Correct
<div className = 'abc'>
```

2. root element는 하나만 존재해야 한다.

```javascript

//Wrong
return (
    <div></div>
    <div></div>
)

//Correct
return (
    <div></div>
)

```

3. html과 비교

| html    | jsx     |
| ------- | ------- |
| onclick | onClick |
