import React from 'react';
import './UserOutput.css';
const userOutput = props => {
  return (
    <div className='UserOutput' onClick={props.clickBox} id={props.id}>
      <p>
        {props.username}: {props.children}
      </p>
    </div>
  );
};

export default userOutput;
