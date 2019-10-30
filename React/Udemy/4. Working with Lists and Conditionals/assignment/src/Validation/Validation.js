import React from 'react';
const validation = props => {
  let outputString = '';
  if (props.textLength >= 5) outputString = 'Text long enough';
  else outputString = 'Text too short';
  console.log(props.textLength);
  return <p>{outputString}</p>;
};

export default validation;
