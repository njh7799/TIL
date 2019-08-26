import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person';

class App extends Component {
  state = {
    persons: [
      { name: 'Max', age: 28 },
      { name: 'Manu', age: 29 },
      { name: 'Jay', age: 23 }
    ],
    showPersons: false
  };

  switchNameHandler = newname => {
    this.setState({
      persons: [
        { name: newname, age: 1 },
        { name: 'asdfg', age: 123 },
        { name: 'TTffT', age: 112 }
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

  togglePersonHandler = () => {
    const doesShow = this.state.showPersons;
    this.setState({
      showPersons: !doesShow
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
        <button onClick={this.togglePersonHandler} style={style}>
          Switch Name
        </button>

        {this.state.showPersons ? (
          <div>
            <Person
              name={this.state.persons[0].name}
              age={this.state.persons[0].age}
              changed={this.nameChangedHandler}
            />
            <Person
              name={this.state.persons[1].name}
              age={this.state.persons[1].age}
              changed={this.nameChangedHandler}
            >
              MY hobby
            </Person>
            <Person
              name={this.state.persons[2].name}
              age={this.state.persons[2].age}
            />
          </div>
        ) : null}

        <h1>Hi</h1>
      </div>
    );
  }
}

export default App;
