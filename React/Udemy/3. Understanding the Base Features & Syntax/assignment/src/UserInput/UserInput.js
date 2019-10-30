import React from 'react';
const userInput = props => {
  const style = {
    backgroundColor: 'white',
    font: 'inherit',
    bording: '1px solid blue',
    'text-align': 'center',
    'margin-bottom': '10px'
  };
  return (
    <div className='UserInput' style={style}>
      <input type='text' onChange={props.nameChanged} />
    </div>
  );
};

export default userInput;
