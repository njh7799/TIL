# Diving Deeper into Components & React Internals

##  Splitting an App Into Components

directories

```shell
src
└ assets
└ components #stateless, dumb, presentational component 
	└ Cockpit
		Cockpit.js
		Cockpit.css
	└ Persons
		└Person
			Person.js
		Persons.js
└ containers #stateful, smart component
	App.js
	App.css
```



## Class-based vs Functional Components

|                         class-based                          |         functional          |
| :----------------------------------------------------------: | :-------------------------: |
|                  class XY extends Component                  |  const XY = props=>{....}   |
| Access to State(<br />access: this.state<br />change: setState) | Access to State(useState()) |
|                      Lifecycle Hooks O                       |      Lifecycle Hooks X      |
|              Access State and Props via 'this'               |  Access Props via 'props'   |
| Use if you need to manage State or access to Lifecycle Hooks and you don't want to use React Hooks |   Use in all other Cases    |

```javascript
// index.js
ReactDOM.render(<App title='Title'/>, document.getElementById('root'));
```

```javascript
//App.js
<Person title = {this.props.title}/>
```

# [Lifecycle](http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)

## Component Lifecycle - Creation

|                                        | Do                                | Don't                                  |
| -------------------------------------- | --------------------------------- | -------------------------------------- |
| constructor(props)                     | Set up State                      | Cause Side-Effects                     |
| getDerivedStateFromProps(props, state) | Sync state                        | Cause Side-Effects                     |
| render()                               | Prepare & Structure your JSX Code |                                        |
| Render Child Components                |                                   |                                        |
| componentDidMount()                    | Cause Side-Effects                | Update State(it'll triggers re-render) |

```js
//App.js
class App extends Component{
    constructor(props){
        super(props);
        console.log('[App.js] constructor')
        this.state = {
            
        } // initialize state
	}
}

static getDerivedStateFromProps(props,state){
    console.log('[App.js] getDerivedStateFromProps', props);
    return state
}

componentDidMount(){
	console.log('[App.js] componentDidMount')
}

render(){
	console.log('[App.js] render')
    
    persons = (
    	<Persons/>
    )
}
```

```javascript
// Persons.js
const persons = props =>{
	console.log('[Persons.js] rendering...')
	return props.persons.map((person, index) => {
		
	})
}
	
```

```javascript
// Person.js
const person = props =>{
	console.log('[Person.js] rendering...')
	return 대충 jsx
}
	
```

![create](https://user-images.githubusercontent.com/40619551/64921443-35747380-d7fe-11e9-8444-2f2d2c32fa6b.gif)





## Component Lifecycle - Update

|                                                              | Do                                | Don't                                       |
| ------------------------------------------------------------ | --------------------------------- | ------------------------------------------- |
| getDerivedStateFromPops(props, state)                        | Sync state to Props               | Cause Side-Effects(don't send http request) |
| shouldComponentUpdate(nextProps, nextState); May cancel updating process | Decide whether to Continue or Not | Cause Side-Effects                          |
| render()                                                     | Prepare & Structure your JSX Code |                                             |
| Update Child Components Props                                |                                   |                                             |
| getSnapshotBeforeUpdate(prevProps, prevState)                | Last-minute DOM ops               | Cause Side-Effects                          |
| componentDidUpdate()                                         | Cause Side-Effects                | Update State(triggers re-render)            |

### props change


```javascript
// Persons.js
// LifeCycle Hook을 확인하기 위해 Class-based로 수정

class Persons extends Component {
    static getDerivedStateFromPops(props, state){
        console.log('[Persons.js] getDerivedStateFromPops');
        return state;
	}
    
    shouldComponentUpdate(nextProps, nextState){
        console.log('[Persons.js] shouldComponentUpdate');
        
        // true일 경우 업데이트를 계속 진행
        // false일 경우 업데이트를 멈춤
        return true ;
	}
    
    getSnapshotBeforeUpdate(prevProps, prevState){
        console.log('[Persons.js] getSnapshotBeforeUpdate');
        return { message:'Snapshot!'}; // Snapshot value or null
        // snapshot은 data package
        // update 직전의 state의 저장이 가능
    }
    
    componentDidUpdate(prevProps, prevState, snapshot){
        console.log('[Persons.js] componentDidUpdate');
        console.log(snapshot); // 이게 가능해
    }
    
    componentWillUnmount() {
    	console.log('[Persons.js] componentWillUnmount');
  	}
    
    render(){
        console.log('[Persons.js] rendering...');
	}
}
```

![update props](https://user-images.githubusercontent.com/40619551/64921710-7c179d00-d801-11e9-8b8a-1353bd0ce4a8.gif)



### state change

```javascript
//App.js
class App extends Component{
    constructor(props){
        super(props);
        console.log('[App.js] constructor')
        this.state = {
            
        } // initialize state
	}
}

static getDerivedStateFromProps(props,state){
    console.log('[App.js] getDerivedStateFromProps', props);
    return state
}

componentDidMount(){
	console.log('[App.js] componentDidMount')
}

shouldComponentUpdate() {
    console.log('[App.js] shouldComponentUpdate');
    return true;
}

componentDidUpdate(){
    console.log('[App.js] componentDidUpdate')
}

render(){
	console.log('[App.js] render')
    
    persons = (
    	<Persons/>
    )
}
```

![update state](https://user-images.githubusercontent.com/40619551/64921823-c2b9c700-d802-11e9-9c35-c82f318e6098.gif)

## useEffect

### basic settings

- Component 이름은 대문자로 시작해야 한다. const cockpit => const Cockpit

```javascript
// Cockpit.js
const Cockpit = props => {
  useEffect(() => {
    console.log('[Cockpit.js] useEffect');
  });
   ...
```

![uE1](https://user-images.githubusercontent.com/40619551/64921964-de719d00-d803-11e9-93d5-f0dbc51c4cd4.gif)


- `state 변화 -> render 실행 -> 콕핏 실행`의 과정을 거치기 때문에, cockpit에 직접적인 변화가 없더라도 매번 실행 된다.
- componentDidMount 와 compenentDidUpdate가 섞여있다고도 볼 수 있다.
- 그렇다면 이를 어떻게 컨트롤 할 수 있을 것인가?

```javascript
// Cockpit.js
useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    setTimeout(() => {
      alert('Saved data to cloud');
    }, 1000);
  }, [props.persons]);
   ...
```

- 위와 같이 useEffect의 두번째 인자로 배열을 주면, 배열 안에 있는 요소에 변경이 생길 때만 실행이 된다.![uE2](https://user-images.githubusercontent.com/40619551/64921997-72436900-d804-11e9-9f56-c35c4b4f1dd3.gif)
- 만약 빈 배열을 넣을 경우, useEffect 메소드가  **최초 랜더링 된 직후 **한 번만 실행되고 재실행이 되지 않는다.(componentDidMount 와 같은 동작)
- [동작 예시 생략]

### cleanup

```javascript
//Cockpit.js
useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    return () => {
        console.log('[Cockpit.js] cleanup work in useEffect');
    };
}, []);

//App.js
this.state = {
      ...
      showCockpit: true
    };
...
 return (
      <div className={styles.App}>
        <button onClick={() => this.setState({ showCockpit: false })}>
          Remove Cockpit
        </button>
        {this.state.showCockpit ? (
          <Cockpit
            persons={this.state.persons}
            showPersons={this.state.showPersons}
            clicked={this.togglePersonsHandler}
          />
        ) : null}
        {persons}
      </div>
    );
```

- return 구문에 함수를 작성하면, unmount 될 때 함수가 실행된다.

- 위와 같이 useEffect를 작성하면, 두번째 인자가 빈 배열이기 때문에, component가 mount되어 render 될 때 `console.log('[Cockpit.js] useEffect')`가 한 번 실행되고, unmount 될 때 `console.log('[Cockpit.js] cleanup work in useEffect')` 가 실행 된다.

  ![cleanup](https://user-images.githubusercontent.com/40619551/64922126-7ff9ee00-d806-11e9-91af-cbec79dd1c84.gif)

  

- 두 번째 인자가 없는 경우

```javascript
useEffect(() => {
    console.log('[Cockpit.js] 2nd useEffect');
    return () => {
        console.log('[Cockpit.js] cleanup work in 2nd useEffect');
    };
});
```

- 두 번째 인자가 없을 때에는, re-rendering이 될 때 마다 실행 된다.

- 어떠한 component가 re-render 되던 간에 re-render가 발생할 때마다 실행되게 해야할 경우 사용되는 방법 

  [동작 예시 생략]

cleanup 예제)

```javascript
useEffect(() => {
    console.log('[Cockpit.js] useEffect');

    const timer = setTimeout(() => {
      alert('Saved data to cloud!');
    }, 1000);
    return () => {
      clearTimeout(timer);
      console.log('[Cockpit.js] cleanup work in useEffect');
    };
  }, []);
```

clearTimeout을 설정하지 않은 상태에서 실행하면, 창을 로드하고 바로 `Remove Cockpit` 버튼을 누르더라도 1초 후 alert 창이 뜬다. 하지만 위 코드 처럼 설정을 하면 `Remove Cockpit` 버튼을 누를 때, unmount가 되어 return 함수가 실행되기 때문에, timer가 동작을 멈추게 되고 결과적으로 1초가 경과해도 경고창이 나오지 않는다.
[동작 예시 생략]

### shouldComponentUpdate 를 이용한 최적화

문제 상황: state가 업데이트 될 때, person에 변화가 없어도 App이 re-rendering 되는 과정에서, Persons도 re-rendering 되는 낭비가 발생. 한 예로, `Remove Cockpit` 버튼을 누르면, person에는 변화가 없음에도, re-rendering이 일어남.

![what](https://user-images.githubusercontent.com/40619551/64922862-e6830a00-d80e-11e9-8be5-4a346c52f6e0.gif)

shouldComponentUpdate에서 현재 props와 nextProps를 비교하여 분기할 수 있다.

```javascript
// persons.js
shouldComponentUpdate(nextProps, nextState) {
    console.log('[Persons.js] shouldComponentUpdate');
    if (nextProps.persons !== this.props.persons) return true;
    else return false;
}
```

- 여기서 중요한 점은 nextProps.persons와 this.props.persons는 배열이기 때문에 **얕은 비교** 즉 **포인터의 비교**가 일어난 다는 것이다. App.js 를 살펴보면, persons에 변화가 있을 때에 `const persons = [...this.state.persons];` 와 같이 새로운 배열을 할당해주기 때문에, **포인터의 변화**가 발생한다. 만약 여기서 `const persons = this.state.persons;`와 같이 같은 persons의 주소에 변화를 주지 않았다면, 값이 바뀌어도 주소값이 같기 때문에 shouldComponentUpdate가 재대로 동작하지 않았을 것이다. 

[동작 예시 생략]

- Rendering Tip in Chrome
  ![tip](https://user-images.githubusercontent.com/40619551/64923161-4dee8900-d812-11e9-8ad4-860109bf7279.gif)
  - 화면상 변경을 보여줌
  - 이름에 타이핑을 해 보면, Cockpit이 계속 업데이트 되지만, 실제로 바뀌는 값이 없기 때문에 DOM이 갱신이 되지는 않지만, 이를 좀더 최적화 할 여지는 있음

### 97. Optimizing Functional Components with React.memo()

component를 React.memo로 감싸면, 마운팅이 될 때의 값이 저장된다. 그리고 앱에 변화가 생겼을 때, 그 변화가 현재 component에 영향을 끼치지 않는다면, 저장된 값을 바로 불러오는 방식을 통해 최적화가 가능해진다.

```javascript
//Cockpit.js

export default React.memo(Cockpit);
```

### shouldComponentUpdate 나 React.memo는 항상 하나요?

이 두가지를 이용하여 성능을 향상 시킬 수는 있다. 하지만, 이렇게 체크를 하는 것 또한 비용이다. 만약 부모 component에 변화가 일어날 때, 자식 컴포넌트가 거의 확실하게 변화가 일어난다면, 굳이 확인 하는 코드를 넣을 필요가 없다.

### 99. PureComponents instead of shouldComponentUpdate

상황: Persons 컴포넌트에서, persons 뿐만 아니라, clicked 함수 혹은 changed 함수가 변경 되는 경우도 있을 수 있다.

```javascript
shouldComponentUpdate(nextProps, nextState) {
    console.log('[Persons.js] shouldComponentUpdate');
    if (nextProps.persons !== this.props.persons ||
       	nextProps.changed !== this.props.changed ||
       	nextProps.clicked !== this.props.clicked
       ) return true;
    else return false;
  }
```

솔직히 이정도면 적어서 괜찮긴한데, 더 많아지면 감당 안 됨. 그래서 모든 props를 확인하는 친구가 나왔습니다.

```javascript
import React, {PureComponent} from 'react'

class Persons extends PureComponent{
    
}
```

Component 대신 PureComponent를 상속하면, props에 변화가 하나라도 있는지 감지하고, 없을 경우, shouldComponentUpdate 이하 단계를 건너 뛴다.

![Pure](https://user-images.githubusercontent.com/40619551/65153551-eaa86500-da64-11e9-92e9-fd5450988ca0.gif)

### 100. How React Updates the DOM

![image](https://user-images.githubusercontent.com/40619551/65154805-1e848a00-da67-11e9-98b0-754b5c70d16e.png)


- render 메소드가 호출 되었다고 해서 real DOM 에 바로 렌더링을 하는 것은 아니다.
- render 메소드가 실행 되고 난 후에는 **virtual DOM**을 비교한다. 비교 대상은 `Old Virtual DOM` 과 render 메소드가 호출되어 생성된 `Re-rendered Virtual DOM` 이다.
	- 왜 Real DOM으로 비교는 안하는가? 어어엄청 느리기 때문이다.
- 변화가 감지되면, real DOM에 반영하는데, 이 때도전부 다 갈아 치우는 것이 아니라, **바뀐 부분만 갈아 끼운다.**
- 변화가 감지되지 않으면, Real DOM을 건드리지 않는다.
- 즉, Real DOM은 Real DOM에 직접 적용될 변화가 있을 때에만 바뀌는 것이다.
- DOM 에 접근하는 건 매우 느리다. 때문에 최소화 하는 것이 중요하다. 그래서 위와같은 귀찮은 과정을 거치는 것이다.
  

### 101. Rendering Adjacent JSX Elements

rendering 할 때 루트 div는 하나만 있어야 한다. 단 하나.

근데 array는 된다. 그래서 실험 해 보았다.

```javascript
//before Person.js
return (
      <div className={styles.Person}>
        <p onClick={this.props.click}>
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p>{this.props.children}</p>
        <input
          type='text'
          onChange={this.props.changed}
          value={this.props.name}
        />
      </div>
    );
```

```javascript
//after Person.js
return [

        <p key="aaa" onClick={this.props.click}>
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>,
        <p key="bbb">{this.props.children}</p>,
        <input
		 key="ccc"
          type='text'
          onChange={this.props.changed}
          value={this.props.name}
        />

    ];
```

되긴 되는데, array 각 요소에 key를 달라고 경고가 뜬다. 위 코드는 걍 아무 key나 때려 박은거다.

근데 촌스럽다. 그래서 hoc라는걸 써볼거다. higher order component라는 뜻이고, 맨 위에서 아무 의미 없이 감싸주는 역할을 할 예정이다.

```bash
.
│  index.css
│  index.js
│  registerServiceWorker.js
│
├─components
│  ├─Cockpit
│  │      Cockpit.js
│  │      Cockpit.module.css
│  │
│  └─Persons
│      │  Persons.js
│      │
│      └─Person
│              Person.js
│              Person.module.css
│
├─containers
│      App.js
│      App.module.css
│      App.test.js
│
└─hoc
        Auxiliary.js
```

```js
// Aux.js - 윈도우 에서는 Auxiliary 라고 해야 됨
import React from 'react';

const aux = props => props.children;

export default aux;

```

```javascript
// Person.js
...
import Aux from '../../../hoc/Auxiliary';
class Person extends Component {
  render() {
    ...
    return (
      <Aux>
        <p onClick={this.props.click}>
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p>{this.props.children}</p>
        <input
          type='text'
          onChange={this.props.changed}
          value={this.props.name}
        />
      </Aux>
    );
  }
}
```

Aux는 바닐라 js 문법으로 구현한 친구이다. 근데 안만들어도 이미 있다.

### 103. Using React.Fragment

```javascript
//Person.js

return (
      <React.Fragment>
        <p onClick={this.props.click}>
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p>{this.props.children}</p>
        <input
          type='text'
          onChange={this.props.changed}
          value={this.props.name}
        />
      </React.Fragment>
    );
```

### 104. Higher Order Components - Introduction

진짜 아무 것도 안하고 감싸기만 하는 친구

```bash
│
└─hoc
        Auxiliary.js
        WithClass.js
```

```js
// WithClass.js

import React from 'react';

const WithClass = props => (
  <div class Name={props.classes}>
    {props.children}
  </div>
);

export default WithClass;

```

```js
// App.js
return (
      <WithClass classes={styles.App}>
        ...
      </WithClass>
```

### 105. Another Form of HOCs

functional component를 반환하는 일반 함수를 제작



```js
// withClass.js # 함수형 컴포넌트가 아니기 때문에 이름 변경
import React from 'react';

const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      <WrappedComponent />
    </div>
  );
};

export default withClass;

```

```js
// App.js
...
return (
      <Aux>
        ...
      </Aux>
    );
  }
}

export default withClass(App, styles.App);
```

### **106. Passing Unknown Props

```js
import React from 'react';

const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      // <WrappedComponent props = {...props}/>
      // 이처럼 작성하면 props에 들어가는 것이 아니고 props라는 이름의 prop가 하나 생기는 것이다. 따라서 스프레드 연산자를 통해 뿌려줘야 한다.
      ..
      <WrappedComponent {...props}/>
    </div>
  );
};

export default withClass;

```

**Q1)** 왜 withClass를 지나면 데이터가 소실되는가?
**A1)**

```js
//Persons.js

return (
        <Person
          click={() => this.props.clicked(index)}
          name={person.name}
          age={person.age}
          key={person.id}
          changed={event => this.props.changed(event, person.id)}
        />
      );
```
위 코드가 실행될 때 Person 안에 위 props들이 들어간다. 그런데 여기서 사용한 <Person/> 은 실제론, withClass(Person, styles.Person) 을 의미한다. 즉 props들은 withClass 로 전달이 되어

```js=
const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      <WrappedComponent/>
    </div>
  );
};
```
위의 2번째 줄의 props에서 props가 전달이 안되고 멈춘다.

**Q2)** withClass 는 어떻게 props에 데이터를 가지고 있을 수 있는가?

```js
const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      <WrappedComponent />
    </div>
  );
};
```

여기서 WrappedComponent가 props를 가지고 있다. 이 props가 2번째 줄의 props가 되는 것.

### 107. Setting State Correctly

```js
// App.js
this.state = {
      ...
      changeCounter: 0
    };
nameChangedHandler = (event, id) => {
    ...
    this.setState({
      changeCounter:this.state.changeCounter + 1
    });
  };
```

- 이름을 변경하면, changeCounter가 1씩 올라간다.
- setState는 컴포넌트의 state를 즉시 변경하고 리 렌더링 하지 않는다.
- 실제로는 React가 스케줄링한다. 리액트가 state를 변경한다.
- this.setState는 동기적으로 실행이 되지만, 내부 업데이트 동작은 그렇지 않다. 따라서 지금 this.state.changeCounter를 참조하는 것이 바로 직전 값임을 보장하지 않는다. 즉, race condition이 발생할 수 있다. 여기서 아래와 같이 코드를 변경하면 race condition을 방지하고 항상 직전의 state를 참조하게끔 할 수 있다.

```js
// App.js
// setSate 패러미터를 아래와 같은 익명 함수로 변경
this.setState((prevState, props) => {
      return { persons: persons,
               changeCounter: prevState.changeCounter + 1 };
    });
```

### 108. Using PropTypes

이 props이 뭘 입력 받고, 타입이 무엇인지 정해줄 수 있다.

```bash
npm install --save prop-types
```

```js
// Person.js
import PropTypes from 'prop-types';

class Person extends Component {
  ...
}

Person.propTypes = {
  click: PropTypes.func,
  name: PropTypes.string,
  age: PropTypes.number,
  chagned: PropTypes.func
};

```

### 109. Using Refs

```js
// Person.js
class Person extends Component {
constructor(props){
    super(props)
  this.inputElementRef = React.createRef();
}
componentDidMount(){
  this.inputElementRef.current.focus()
}

  render() {
    console.log('[Person.js] rendering...');
    return (
      <React.Fragment>
        ...
        <input
          ...
          ref={this.inputElementRef}
          type='text'
          ...
        />
      </React.Fragment>
    );
  }
}
```

 `ref={this.inputElementRef}` 를 통해서 input 태그와 inputElemenRef의 연결이 이루어진다.

위 코드를 실행시키면, Persons 컴포넌트가 호출 될 때, Person 컴포넌트가 순차적으로 호출 된다. 이 때 Person 컴포넌트의 input에는 focus가 주어지게 되는데, Person 컴포넌트가 순차적으로 호출됨에 따라, 다음 컴포넌트의 input으로 focus가 계속 넘어가게 된다. 따라서 결국 맨 마지막 컴포넌트의 input에서 focus가 멈추게 된다.

### 110. Refs with React Hooks

109의 내용은 functional component에서는 적용할 수 없다. 이를 위해서는 React Hook을 이용하여야 한다.

```js
// Cockpit.js

import React, { useEffect, useRef } from 'react';
...
  const toggleBtnRef = useRef(null);


  useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    toggleBtnRef.current.click();
    ...
  }, []);
  ...
  return (
    ...
      <button ref={toggleBtnRef} className={btnClass} onClick={props.clicked}>
        Toggle Persons
      </button>
    </div>
  );
};

export default React.memo(Cockpit);

```

useEffect 의 두번째 인자로 빈 배열을 넣을 경우, 돔에 컴포넌트가 렌더링 된 직후에 한 번만 실행된다. 이 타이밍에 `toggleBtnRef.current.click()` 를 실행하면 원하는 결과를 얻을 수 있다.

### 111. Understanding Prop Chain Problems

루트 컴포넌트에 있는 props을 리프 컴포넌트까지 전달해줄 때에, 그 사이에 컴포넌트가 다수 존재한다면, 상당히 귀찮아질 수 있다.
`App state 변경 -> Persons -> Person` : 너무 번거롭다.
우짜지

### 112. Using the Context API

```bash
.
├─components
│  ├─Cockpit
│  └─Persons
│      └─Person
├─containers
│
├─context
│      auth-context.js # 생성
└─hoc
```

```js
// auth-context.js

import React from 'react';

const authContext = React.createContext({
  authenticated: false,
  login: () => {}
});

export default authContext;

```

```js
// App.js
// 같은 state를 공유하는 아이들을 묶어준다.

...
return (
      <Aux>
        <button onClick={() => this.setState({ showCockpit: false })}>
          Remove Cockpit
        </button>
        <AuthContext.Provider
          value={{
            authenticated: this.state.authenticated,
            login: this.loginHandler
          }}
        >
          {this.state.showCockpit ? (
            <Cockpit
              personsLength={this.state.persons.length}
              showPersons={this.state.showPersons}
              clicked={this.togglePersonsHandler}
              login={this.loginHandler}
            />
          ) : null}
          {persons}
        </AuthContext.Provider>
      </Aux>
    );
```

```js
// Person.js
import AuthContext from '../../../context/auth-context'

...
render() {
    console.log('[Person.js] rendering...');
    return (
      <React.Fragment>
        <AuthContext.Consumer>
          {context =>
            context.authenticated ? <p>Authenticatd!</p> : <p>PLZ log in</p>
          }
        </AuthContext.Consumer>
        ...
        />
      </React.Fragment>
    );
  }

```

```js
// Cockpit.js

import AuthContext from '../../context/auth-context'

...
 return (
    ...
      <AuthContext.Consumer>
        {context => <button onClick={context.login}>Log in</button>}
      </AuthContext.Consumer>
    </div>
  );
```

### 113. contextType & useContext()

위 코드의 문제점:  `<AuthContext.Consumer></AuthContext.Consumer>` 내부에서만 context에 접근이 가능함. 따라서 componentDidMount 내부에서는 사용이 불가

` static contextType = AuthContext;` 를 추가해주면 된다.

```js
// Person.js

class Person extends Component {
    ...
    static contextType = AuthContext;
  	...
render() {
	...
    return (
      ...
        {this.context.authenticated ? <p>Authenticatd!</p> : <p>PLZ log in</p>}
        ...
     ...
    );
  }
  static contextType = AuthContext;
```

클래스 컴포넌트에서 사용 가능

하지만 함수형 컴포넌트에서는 static 변수 선언이 안되기 때문에 사용 불가한 방법. => Hooks로 가능!

```js
// Cockpit.js

import React, { useEffect, useRef, useContext } from 'react';
...

const Cockpit = props => {
  const toggleBtnRef = useRef(null);
  const authContext = useContext(AuthContext);

  ...
  return (
      ...
      {<button onClick={authContext.login}>Log in</button>}
   ...
  );
};

export default React.memo(Cockpit);

```

