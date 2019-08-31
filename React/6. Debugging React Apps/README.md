# Debugging React Apps

## Syntax Error

console에 어디에서 뭐가 잘못됐는지 다 알려준다. 친절

## Logic Error

에러가 안뜨는데 알돌아가

1. chrome 개발자 도구
2. Source > App.js 파일 연다
3. 중단점 설정 가능
4. 그리고 다시 실행하면 중단점에서 멈춤
5. 밑에 보면 디버깅 툴 있음 step in 같은거
6. 변수 위에 커서 올리면 값 나옴

## react developer tools

크롬 개발자 도구에서 설치

## Error Boundary

```javascript
mkdir ErrorBoundary
touch ErrorBoundary.js
```

1. ErrorBoundary Component를 만든다.
```javascript
//ErrorBoundary.js
import React, { Component } from 'react';

class ErrorBoundary extends Component {
  state = {
    hasError: false,
    errorMessage: ''
  };

  componentDidCatch = (error, info) => {
    this.setState({ hasError: true, errorMessage: error });
  };
  render() {
    if (this.state.hasError) {
      return <h1>{this.state.errorMessage}</h1>;
    }
    return this.props.children;
  }
}

export default ErrorBoundary;

```

2. 에러가 예상되는 태그를 ErrorBoundary 태그로 감싼다.

```javascript
<ErrorBoundary key={person.id}>
    <Person
		name={person.name}
		age={person.age}
		click={() => this.deletePersonHandler(index)}
		key={index}
		changed={(event, id) =>
			this.nameChangedHandler(event, person.id)
		}
    ></Person>
</ErrorBoundary>
```

- `제어가 불가능한 에러가 발생할 확률이 있는 곳`에만 감싼다.
- 일반적으로 에러가 발생하는 경우는, 개발 중 실수가 있는 경우이다. 만약 ErrorBoundary를 전체 태그에 감싸게 된다면, 이러한 에러 또한 놓치게 된다.
- 개발 중에 웹에 띄울 때에는, 에러가 잡히지 않는다. 다만, 서버에 연동시켜서 동작하면 에러가 잡힌다.