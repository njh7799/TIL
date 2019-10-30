import './Char.css';
import React from 'react';

const Char = props => {
  return (
    <div className='Char' onClick={props.click}>
      {props.letter}
    </div>
  );
};

export default Char;
