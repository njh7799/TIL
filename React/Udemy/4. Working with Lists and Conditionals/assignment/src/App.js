import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Validation from './Validation/Validation';
import Char from './Char/Char';

class App extends Component {
  state = {
    userInput: ''
  };
  inputChangedHandler = e => {
    this.setState({
      userInput: e.target.value
    });
  };
  deleteLetterHandler = event => {
    let str = this.state.userInput;
    str = str.slice(0, index) + str.slice(index + 1, str.length);
    this.setState({
      userInput: str
    });
  };

  render() {
    let letters = this.state.userInput.split('').map((e, index) => {
      return (
        <Char
          letter={e}
          click={() => his.deleteLetterHandler(index)}
          key={index}
        />
      );
    });
    return (
      <div className='App'>
        <div>
          <input
            type='text'
            onChange={this.inputChangedHandler}
            value={this.state.userInput}
          />
          <p>{this.state.userInput.length}</p>
          <Validation textLength={this.state.userInput.length} />
        </div>
        {letters}
      </div>
    );
  }
}

export default App;
