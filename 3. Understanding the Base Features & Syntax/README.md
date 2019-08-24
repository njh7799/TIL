<h1>Understanding the Base Features
& Syntax</h1>

<h2>Two Kinds of Applications</h2>

- Single Page Applications

  - 단일 페이지 내에서 js 와 React를 이용하여 구현
  - 매번 서버에 접근할 필요가 없다.
  - 페이지 전체가 React의 영향권에 있다.
  - 단 하나의 ReactDOM.render.call이 존재

- Multi Page Applications
  - 여러 URL에 접근하여 페이지를 구성
  - 페이지 전체가 React의 영향권에 있지는 않다.
  - 각각의 위젯들은 서로의 존재에 대해 알지 못한다.

---

<h2>JSX Restrictions</h2>
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

3. Properties

onClick

```
<button onClick={this.switchNameHandler}>Switch Name</button>
```

---

<h2>State & Props</h2>

- 예제

Person.js

```javascript
const person = props => {
  return (
    <div>
      <p>
      <!--property에 저장된 값을 가져 옴-->
        I'm a {props.name} I am {props.age}!
      </p>

      <!--태그 사이에 있는 값을 가져 옴-->
      <p>{props.children}</p>
    </div>
  );
};
```

App.js

```javascript
class App extends Component {
  state = {
    persons: [{ name: 'Max', age: 28 }, { name: 'Manu', age: 29 }]
  };
  render() {
    return (
      <div className='App'>
        <Person
          name={this.state.persons[0].name}
          age={this.state.persons[0].age}
        />
        <Person
          name={this.state.persons[1].name}
          age={this.state.persons[1].age}
        />
      </div>
    );
  }
}
```

- State의 특징
  1. state의 변경이 감지되면 DOM이 re-render되어 update 된다.
