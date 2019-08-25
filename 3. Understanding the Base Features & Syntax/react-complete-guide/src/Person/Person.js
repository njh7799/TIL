import React from 'react';
import './Person.css';
const person = props => {
  return (
    <div className='Person'>
      <p>
        I'm a {props.name} I am {props.age}!
      </p>
      <p>{props.children}</p>
      <input type='text' onChange={props.changed} value={props.name} />
    </div>
  );
};

export default person;
