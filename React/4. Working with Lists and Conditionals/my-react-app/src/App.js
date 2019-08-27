import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person';

class App extends Component {
  state = {
    persons: [
      { id: 'asdfs', name: 'Manu', age: 29 },
      { id: 'asdfg', name: 'Jay', age: 23 },
      { id: 'asdfd', name: 'Max', age: 28 }
    ],
    showPersons: false
  };

  nameChangedHandler = (event, id) => {
    const personIndex = this.state.persons.findIndex(p => p.id === id);
    const persons = [...this.state.persons];
    persons[personIndex].name = event.target.value;
    this.setState({
      persons: persons
    });
  };

  togglePersonHandler = () => {
    const doesShow = this.state.showPersons;
    this.setState({
      showPersons: !doesShow
    });
  };

  deletePersonHandler = personIndex => {
    const persons = this.state.persons.slice();
    persons.splice(personIndex, 1);
    this.setState({
      persons: persons
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

    let persons = null;

    if (this.state.showPersons) {
      persons = (
        <div>
          {this.state.persons.map((person, index) => {
            return (
              <Person
                name={person.name}
                age={person.age}
                click={() => this.deletePersonHandler(index)}
                key={index}
                changed={(event, id) =>
                  this.nameChangedHandler(event, person.id)
                }
              ></Person>
            );
          })}
        </div>
      );
    }

    return (
      <div className='App'>
        <h1>Hi, I'm a React App</h1>
        <button onClick={this.togglePersonHandler} style={style}>
          Switch Name
        </button>
        {persons}
        <h1>Hi</h1>
      </div>
    );
  }
}

export default App;
