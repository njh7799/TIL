<h1>State & Props</h1>

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
