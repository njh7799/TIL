import React, { Component } from 'react';
import './App.css';
import UserInput from './UserInput/UserInput';
import UserOutput from './UserOutput/UserOutput';

class App extends Component {
  state = {
    clicked: 0,
    username: [{ name: 'jack', id: 0 }, { name: 'hanamee', id: 1 }]
  };

  clickBox = event => {
    console.log(event.target.id);
    this.setState({
      clicked: event.target.id
    });
  };

  nameChanged = event => {
    this.setState({
      username: this.state.username.map(e => {
        if (e.id == this.state.clicked) {
          return { name: event.target.value, id: e.id };
        } else return e;
      })
    });
  };

  render() {
    const style = {
      backgroundColor: 'white',
      font: 'inherit',
      bording: '1px solid blue'
    };
    return (
      <div>
        <UserInput
          username={this.state.username}
          nameChanged={this.nameChanged}
        />
        <UserOutput
          username={this.state.username[0].name}
          clickBox={this.clickBox}
          id={this.state.username[0].id}
        >
          any paragraph texts of your choice
        </UserOutput>
        <UserOutput
          username={this.state.username[1].name}
          clickBox={this.clickBox}
          id={this.state.username[1].id}
        >
          Pass the event-handler method reference to the UserInput component and
          bind it to the input-change event
        </UserOutput>
      </div>
    );
  }
}

export default App;
