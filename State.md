<h1>State</h1>

- 예제

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

- 특징
  1. state의 변경이 감지되면 DOM이 re-render되어 update 된다.
