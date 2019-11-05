# Modern React with Velopert [link](https://react.vlpt.us/)

## UseEffect

#### deps가 빈 배열일 경우

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

#### deps에 값이 있을 때

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

#### deps 파라미터를 생략했을 경우

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