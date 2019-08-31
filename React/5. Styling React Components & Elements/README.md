# Styling React Components & Elements

## 인라인 방식으로 style 적용하기

```javascript
const style = {
      backgroundColor: 'green',
      color: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer'
    };
return (
      <div className='App'>
        <button style={style}>
          Switch Name
        </button>
      </div>
    );
```

## 클래스 다이나믹 방식으로 적용하기

```javascript
let classes = [];
    if (this.state.persons.length <= 2) {
      classes.push('red');
    }
    if (this.state.persons.length <= 1) {
      classes.push('bold');
    }
    return (
      <div className='App'>
        <p className={classes.join(' ')}>FunFUnFun</p>
      </div>
```

## pseudo selector

```javascript
hover 같은거
```

## raium package

```
npm install --save radium
```

```javascript
import Radium from 'radium'
.
.
const style = {
      backgroundColor: 'green',
      color: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer',
      ':hover': {
        backgroundColor: 'lightgreen',
        color: 'green'
      }
    };
.
.
export default Radium(App);
```

## media query

```javascript
//Radium 안쓰기
//Person.css
@media (min-width: 500px) {
  .Person {
    width: 450px;
  }
}
```

```javascript
//person.js
import Radium from 'radium';
const style = {
    '@media (min-width:500px)': {
      width: '450px'
    }
  };
export default Radium(person);
```

```java
import Radium, { styleRoot } from 'radium';

.
.
.

return (
      <styleRoot>//추가!
        <div className='App'>
          <h1>Hi, I'm a React App</h1>
          <p className={classes.join(' ')}>FunFUnFun</p>
          <button onClick={this.togglePersonHandler} style={style}>
            Switch Name
          </button>
          {persons}
          <h1>Hi</h1>
        </div>
      </styleRoot>
    );
```

## CSS Module

```javascript
//CSS
.Post {
    color: red;
}

//Component
import classes from './Post.css';
 
const post = () => (
    <div className={classes.Post}>...</div>
);
```

[cssRef](https://github.com/css-modules/css-modules)

[componnent-styling]([https://velog.io/@velopert/react-component-styling#sass-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0](https://velog.io/@velopert/react-component-styling#sass-사용하기))

