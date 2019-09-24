# A Real App The Burger Builder (Basic Version)

## 148. Planning an App in React - Core Steps

![image](https://user-images.githubusercontent.com/40619551/65515413-31410800-df1a-11e9-8760-bf16c1673d86.png)

## 149. Planning our App - Layout and Component Tree
설계를 해보자.

그림을 그려보자

![image](https://user-images.githubusercontent.com/40619551/65520376-6d786680-df22-11e9-8724-1d61c57c4bcc.png)



## 150. Planning the State

### State

- ingredients
  - meat, cheese
- purchased: true false
- total Price: $???

### State를 어디에서 관리할 것인가

App이 아니라 BurgerBuilder에서 관리한다!
왜? 위에 적힌 state는 BurgerBuilder에만 관련이 있기 때문.
특정 State는 각각의 page에서만 의미가 있고, 글로벌하게 의미가 있지 않기 때문에,  Page별로 관리를 해주는 것이 좋다. **BurgerBuilder**는 **statefull** 나머지는 stateless

## 151. Setting up the Project

구글 폰트 사용 [link](https://fonts.google.com/)

## 152. Creating a Layout Component

```bash
# dirctory structure
C:.
│  App.css
│  App.js
│  App.test.js
│  index.css
│  index.js
│  serviceWorker.js
│
├─assets
├─components
│  └─Layout
│          Layout.js
│
├─containers
└─hoc
        Auxiliary.js
```

```js
// Layout.js
import React from 'react';
import Aux from '../../hoc/Auxiliary';

const layout = props => (
  <Aux>
    <div>Toolbar, SideDrawer, Backdrop</div>
    <main>{props.children}</main>
  </Aux>
);

export default layout;

```

```js
// App.js
import React, { Component } from 'react';
import './App.css';
import Layout from './components/Layout/Layout';

class App extends Component {
  render() {
    return (
      <div>
        <Layout>
          <p>Test</p>
        </Layout>
      </div>
    );
  }
}

export default App;

```

Layout의 main 태그 내부에는 후에 페이지들이 들어가게 될 것이다.