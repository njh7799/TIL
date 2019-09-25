# Add React to a Website

[official ref](https://reactjs.org/docs/add-react-to-a-website.html)

### HTML 파일
```html
<!--Doctype html-->
<html>
    <head>
        title= title
        <!--리액트 삽입-->
        <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>     
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>
        <!--JSX 적용-->
        <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
        
        <!--리액트 실행-->
        <script src="/views/containers/TableManager/TableManager.js" type="text/babel"></script>
    </head>
  <body>
      <div id="root">
      </div>
   </body> 
</html>
  
```


### JS 파일
```js
'use strict';

const e = React.createElement;

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  render() {
    if (this.state.liked) {
      return 'You liked this.';
    }

    return (
      <div>
        {this.props.help}
        <button onClick={() => this.setState({ liked: true })}>Like</button>
      </div>
    );
  }
}

ReactDOM.render(<LikeButton help='me' />, document.querySelector('#root'));
```

