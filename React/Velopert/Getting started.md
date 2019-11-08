# Modern React with Velopert [link](https://react.vlpt.us/)



# useRef

쉬운 것 부터 보자. react component내에서 변수를 만들 때 사용하는 친구이다.

정의

```javascript
const nextId = useRef(4); // 정의
console.log(nextId.current); // 접근
```

# useEffect

## deps가 빈 배열일 경우

```js
function User({ user, onRemove, onToggle }) {
  useEffect(() => {
    console.log('컴포넌트가 화면에 나타남');
    return () => {
      console.log('컴포넌트가 화면에서 사라짐');
    };
  }, []);
    ...
}
```

- `내부 함수`: 컴포넌트가 처음 나타날때에만 `useEffect` 에 등록한 함수가 호출 
- `cleanup 함수`컴포넌트가 사라질 때 `cleanup` 함수가 호출 



## deps에 값이 있을 때

```js
function User({ user, onRemove, onToggle }) {
  useEffect(() => {
    console.log('user 값이 설정됨');
    console.log(user);
    return () => {
      console.log('user 가 바뀌기 전..');
      console.log(user);
    };
  }, [user]);
    ...
}
```

-  `내부 함수`: 컴포넌트가 처음 마운트 될 때 & 지정한 값이 바뀔 때에 호출
- `cleanup 함수`:  언마운트될 때 & 값이 바뀌기 직전에 호출 

![dd](https://user-images.githubusercontent.com/40619551/68212813-a88bb080-001d-11ea-80ba-23d575939f8d.gif)

1. 최초 페이지 로드 시
   
   - 컴포넌트들이 마운트 되어 `user 값이 설정됨` 로그와 user 값이 세번 찍힘
2. `velopert` 클릭 시
   
   - 컴포넌트에 변경이 생기기 전, `cleanup 함수`가 실행되고, 컴포넌트가 변경되고난 후, `useEffect 내부 함수`가 실행
3. 삭제 시
   
   - 컴포넌트가 언마운트 되어, `cleanup 함수`가 실행
   
   

## deps 파라미터를 생략했을 경우

```js
function User({ user, onRemove, onToggle }) {
  useEffect(() => {
    console.log(user);
  });
    ...
}
```

최초 마운트 되었을 때, 매번 리렌더링 될 때 실행

![](https://user-images.githubusercontent.com/40619551/68213666-55b2f880-001f-11ea-936b-966bcaebe2c8.gif)

위 경우는 최적화가 되어있지 않기 때문에, 다른 컴포넌트에 변경이 생겨도 re-rendering이 일어나는 예제이다.



# useMemo

첫번째 파라미터: 어떻게 연산할지 정의하는 함수
두번째 파라미터: deps 배열 

deps에 변경이 생길 경우, 첫 번째 파라미터의 함수의 실행 값을 넣어주고, 아닐 경우 이전에 연산한 값을 재사용

```js
const count = useMemo(() => countActiveUsers(users), [users]);
```



# useCallback

 `useMemo` 는 특정 결과값을 재사용 할 때 사용하는 반면, `useCallback` 은 특정 함수를 새로 만들지 않고 재사용하고 싶을때 사용한다.

* 주의)  함수 안에서 사용하는 상태 혹은 props 가 있다면 꼭, `deps` 배열안에 포함시켜야 한다.

```js
const onCreate = useCallback(() => {
    const user = {
        id: nextId.current,
        username,
        email
    };
    setUsers(users.concat(user));

    setInputs({
        username: '',
        email: ''
    });
    nextId.current += 1;
}, [users, username, email]);
```



# React.Memo

 컴포넌트의 props 가 바뀌지 않았다면, 리렌더링을 방지하는 함수

```js
import React from 'react';

const CreateUser = ({ username, email, onChange, onCreate }) => {
...
};

export default React.memo(CreateUser);
```





# useReducer

##  reducer

reducer 는 현재 상태와 액션 객체를 파라미터로 받아와서 새로운 상태를 반환해주는 함수이다.

```js
function reducer(state, action) {
  // 새로운 상태를 만드는 로직
  // const nextState = ...
  return nextState;
}
```

state에는 현재 상태, action에는 업데이트를 위한 정보가 담겨있다.

일반적인 action의 형태는 아래와 같다.

```js
// 카운터에 1을 더하는 액션
{
  type: 'INCREMENT'
}
// 카운터에 1을 빼는 액션
{
  type: 'DECREMENT'
}
// input 값을 바꾸는 액션
{
  type: 'CHANGE_INPUT',
  key: 'email',
  value: 'tester@react.com'
}
// 새 할 일을 등록하는 액션
{
  type: 'ADD_TODO',
  todo: {
    id: 1,
    text: 'useReducer 배우기',
    done: false,
  }
}
```

* convention  `type` 값은 대문자와 _ 로 구성한다.

## useReducer

```js
const [state, dispatch] = useReducer(reducer, initialState);
```

- state: 상태
- dispatch: 액션을 발생시키는 함수이다. 이 함수의 input 파라미터가 reducer의 action이 된다.
- reducer: 위에서 설명한 함수
- initialState: 초기 상태

예시 코드

```js
import React, { useReducer } from 'react';

function reducer(state, action) {
  switch (action.type) {
    case 'INCREMENT':
      return state + 1;
    case 'DECREMENT':
      return state - 1;
    default:
      return state;
  }
}

function Counter() {
  const [number, dispatch] = useReducer(reducer, 0);

  const onIncrease = () => {
    dispatch({ type: 'INCREMENT' });
  };

  const onDecrease = () => {
    dispatch({ type: 'DECREMENT' });
  };

  return (
    <div>
      <h1>{number}</h1>
      <button onClick={onIncrease}>+1</button>
      <button onClick={onDecrease}>-1</button>
    </div>
  );
}

export default Counter;
```



# Custom Hooks

custom hook이 뭔데요?

그냥 함수다. 함수인데, 내부에서 React Hook을 사용하여 state를 관리하는 함수이다. 아래 예시를 참고하자.

```js
import { useState, useCallback } from 'react';

function useInputs(initialForm) {
  const [form, setForm] = useState(initialForm);
  // change
  const onChange = useCallback(e => {
    const { name, value } = e.target;
    setForm(form => ({ ...form, [name]: value }));
  }, []);
  const reset = useCallback(() => setForm(initialForm), [initialForm]);
  return [form, onChange, reset];
}

export default useInputs;
```

이런식으로 코드를 관리해주면 하나의 파일에서 모든 state를 관리하지 않아도 된다는 장점이 있다. 또한 재사용성이 증대되며, 다양한 이점이 존재한다.



# Context API

상태를 관리할 때에, 저어어어기 아래 컴포넌트에서 사아아앙위 컴포넌트의 상태에 접근하기 위해선, 상태를 props로 넘겨주고, 넘겨주고, 넘겨주고..... 를 반복해야 한다. 몹시 비효율적이므로 등장한 친구가 Context API 이다. 이 친구를 이용하면 상태를 특정 범위 내에서 전역변수처럼 관리할 수 있다.

만약, 전역변수로 설정해야할 상태가 너무 많다면, 구조가 복잡해질 것이다. 이를 해결 하기 위해 dispatch를 함께 사용하면 매우 깔끔한 구조를 만들 수 있다.

자세한 동작 설명은 원문을 참고하자.

1. 조상 컴포넌트에서 아래와같이 선언

```js
const UserDispatch = React.createContext(null);
```

2. 조상 컴포넌트에서 Context가 접근할 수 있는 범위를 UserDispatch.Provider 로 감싸주고 value에 전역변수로 만들 값을 넣는다.

```js
<UserDispatch.Provider value={dispatch}>...</UserDispatch.Provider>
```

3. 자손 컴포넌트에서 전역 상태를 가져온다.

```js
import React, { useContext } from 'react';
import { UserDispatch } from './App';

const User = React.memo(function User({ user }) {
	const dispatch = useContext(UserDispatch);
    ...
```



### 코드 예시

```js
import React, { useRef, useReducer, useMemo, useCallback } from 'react';
import UserList from './UserList';
import CreateUser from './CreateUser';
import useInputs from './hooks/useInputs';

function countActiveUsers(users) {
  ...
}

const initialState = {
  users: [
      ...
  ]
};

function reducer(state, action) {
  ...
}

// UserDispatch 라는 이름으로 내보내줍니다.
export const UserDispatch = React.createContext(null);

function App() {
  ...
  return (
    <UserDispatch.Provider value={dispatch}>
      ...
      ...
      ...
    </UserDispatch.Provider>
  );
}

export default App;
```

