import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person';

class App extends Component {
  state = {
    persons: [{ name: 'Max', age: 28 }, { name: 'Manu', age: 29 }]
  };

  switchNameHandler = () => {
    this.setState({
      persons: [
        { name: 'QWERTY', age: 1 },
        { name: 'asdfg', age: 1 },
        { name: 'TTffT', age: 1 }
      ]
    });
  };

  nameChangedHandler = event => {
    this.setState({
      persons: [
        { name: 'KKK', age: 1 },
        { name: event.target.value, age: 21 },
        { name: 'TTT', age: 31 }
      ]
    });
  };
  render() {
    const style = {
      backgroundColor: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer'
    };

    return (
      <div className='App'>
        <h1>Hi, I'm a React App</h1>
        <button onClick={this.switchNameHandler} style={style}>
          Switch Name
        </button>
        <Person
          name={this.state.persons[0].name}
          age={this.state.persons[0].age}
          changed={this.nameChangedHandler}
        >
          MY hobby
        </Person>
        <Person name={this.state.persons[1].name} />
        <h1>Hi</h1>
      </div>
    );
  }
}

export default App;
