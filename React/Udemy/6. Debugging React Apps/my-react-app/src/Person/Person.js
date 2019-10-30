import React from 'react';
import './Person.css';
import Radium from 'radium';
import ErrorBoundary from '../ErrorBoundary/ErrorBoundary';
const person = props => {
  const style = {
    '@media (min-width:500px)': {
      width: '450px'
    }
  };
  return (
    <div className='Person' onClick={props.click} style={style}>
      <p>
        I'm a {props.name} I am {props.age}!
      </p>
      <p>{props.children}</p>
      <input type='text' onChange={props.changed} value={props.name} />
    </div>
  );
};

export default Radium(person);
