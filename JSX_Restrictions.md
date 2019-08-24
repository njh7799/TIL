<h1>JSX Restrictions</h1>
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
