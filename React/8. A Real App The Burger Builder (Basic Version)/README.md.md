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

### 153. Starting Implementation of The Burger Builder Container

```bash
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
│          Layout.module.css
│
├─containers
│  └─BurgerBuilder
│          BurgerBuilder.js
│
└─hoc
        Auxiliary.js
```

```js
// BurgerBuilder.js

import React, { Component } from 'react';
import Aux from '../../hoc/Auxiliary'

class BurgerBuilder extends Component {
    render() {
        return (
            <Aux>
                <div>Burger</div>
                <div>Burger Controls</div>
            </Aux>
        );
    }
}

export default BurgerBuilder
```

### 154. Adding a Dynamic Ingredient Component

컴포넌트의 구조를 잘 짜는 것이 중요하다.

```bash
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
│  ├─Burger
│  │  │  Burger.js
│  │  │
│  │  └─BurgerIngredient
│  │          BurgerIngredient.js
│  │          BurgerIngredient.module.css
│  │
│  └─Layout
│          Layout.js
│          Layout.module.css
│
├─containers
│  └─BurgerBuilder
│          BurgerBuilder.js
│
└─hoc
        Auxiliary.js
```

### 155. Adding Prop Type Validation

PropTypes 을 이용하여, 타입에 대한 명세를 지정해준다.


### 156. Starting the Burger Component

```js
// Burger.js

import React from 'react';
import styles from './Burger.module.css'
import BurgerIngredient from './BurgerIngredient/BurgerIngredient'
const burger = (props) => {
    return (
        <div classNAme={styles.Burger}>
            <BurgerIngredient type="bread-top" />
            <BurgerIngredient type="cheese" />
            <BurgerIngredient type="meat" />
            <BurgerIngredient type="bread-bottom" />
        </div>
    );
}

export default burger;
```

현재는하드 코딩된 상태인데, 이를 해결하는 것이 다음 과제이다.

### 157. Outputting Burger Ingredients Dynamically
Burger Ingredients는 statefull component니까 답게 state를 추가하자.

```js
// Burger.js

...
    state = {
        ingredients: {
            salad: 1,
            bacon: 1,
            cheese: 2,
            meat: 2
        }
    }
    render() {
        return (
            <Aux>
                <Burger ingredients={this.state.ingredients}/>
                <div>Burger Controls</div>
            </Aux>
        );
    }
}

export default BurgerBuilder
```

constructor를 써도 되지만, 번거롭기 때문에 바로 state에 값을 배정해 주었다.

강사님 코드가 너무 더러워서 올리기에 부적절하다.

### 158. Calculating the Ingredient Sum Dynamically

리듀스를 잘쓰자

### 159. Adding the Build Control Component

하나의 컴포넌트가 하위 컴포넌트로 표현될 수 있는 경우 디렉토리 설계를 통해 이를 표현한다.

```js
C:.
│  
...
├─components
│  ├─Burger
│  │  │  Burger.js
│  │  │  Burger.module.css
│  │  │
│  │  ├─BuildControls
│  │  │  │  BuildControls.css
│  │  │  │  BuildControls.js
│  │  │  │
│  │  │  └─BuildControl
│  │  │          BuildControl.js
│  │  │          BuildControl.module.css
│  │  │
│  │  └─BurgerIngredient
│  │          BurgerIngredient.js
│  │          BurgerIngredient.module.css
│  │
...
```

### 160. Outputting Multiple Build Controls

합체

### 161. Connecting State to Build Controls

AddIngredientHandler를 만들건데, 동작은 BuildControls에서 하지만, BurgerBuilder에서 state를 관리하기 때문에, BurgerBuilder에서 정의해서 넘겨주어야 한다.

```js
// BurgerBuilder.js

...
state = {
        ingredients: {
            salad: 0,
            bacon: 0,
            cheese: 0,
            meat: 0
        },
        totalPrice: 4
    }

    addIngredientHandler = (type) => {
        const oldCount = this.state.ingredients[type];
        const updatedCount = oldCount + 1;
        const updatedIngredient = {
            ...this.state.ingredients
        }
        updatedIngredient[type] = updatedCount;
        const priceAddition = INGREDIENT_PRICES[type]
        const oldPrice = this.state.totalPrice;
        const newPrice = oldPrice + priceAddition
        this.setState({ ingredients: updatedIngredient, totalPrice: newPrice })
    }
    ...
```

코드의 명확성을 위해 매직 넘버를 최소화 하고 모든 값에 변수를 할당해서 사용하였다.

```js
// BuildControls.js
...
const buildControls = (props) => (
    <div className={styles.BuildControls}>
        {controls.map(ctrl => (
            <BuildControl
                key={ctrl.label}
                label={ctrl.label}
                added={() => props.ingredientAdded(ctrl.type)} />
        ))}
    </div>
)
```

### 162. Removing Ingredients Safely

1. ingredient 의 수가 음수가 되지 않도록 설정
2. 재료가 없을 때에는 버튼 비활성화 기능 추가

```js
// BurgerBuilder.js
...
render() {
        const disabledInfo = {
            ...this.state.ingredients
        }
        for (let key in disabledInfo) {
            disabledInfo[key] = !disabledInfo[key]
        }
        return (
            <Aux>
                <Burger ingredients={this.state.ingredients} />
                <BuildControls
                    ingredientAdded={this.addIngredientHandler}
                    ingredientRemoved={this.removeIngredientHandler}
                    disabled={disabledInfo} />
            </Aux>
        );
    }
```



### 163. Displaying and Updating the Burger Price

그냥 하면 됨

### 164. Adding the Order Button

```js
class BurgerBuilder extends Component {
    state = {
		...
        purchasable: false
    }

    updatePurchaseState() {
        const ingredients = {
            ...this.state.ingredients
        }
        const sum = Object.values(ingredients).reduce((pre, val) => pre + val, 0);
        this.setState({ purchasable: !!sum })
    }

    addIngredientHandler = (type) => {
		...
        this.setState({ ingredients: updatedIngredient, totalPrice: newPrice })
        this.updatePurchaseState()
    }
    removeIngredientHandler = (type) => {
		...
        this.setState({ ingredients: updatedIngredient, totalPrice: newPrice })
        this.updatePurchaseState()
    }

    render() {
        const disabledInfo = {
            ...this.state.ingredients
        }
        for (let key in disabledInfo) {
            disabledInfo[key] = !disabledInfo[key]
        }
        return (
            <Aux>
                <Burger ingredients={this.state.ingredients} />
                <BuildControls
                    ...
                    purchasable={this.state.purchasable}
                />
            </Aux>
        );
    }
}
```

위와 같이 코드를 작성하면 IngredientHandler 내부의  setState가 동작하기 전에 updatePurchaseState가 동작하기 때문에, 업데이트 되지 않은 값을 참조하는 문제가 발생한다. 아래와 같은 방법으로 이 문제를 해결할 수 있다.

```js
class BurgerBuilder extends Component {
    state = {
		...
        purchasable: false
    }

    updatePurchaseState(ingredients) {
        const sum = Object.values(ingredients).reduce((pre, val) => pre + val, 0);
        this.setState({ purchasable: !!sum })
    }

    addIngredientHandler = (type) => {
		...
        this.setState({ ingredients: updatedIngredient, totalPrice: newPrice })
        this.updatePurchaseState(updatedIngredient)
    }
    removeIngredientHandler = (type) => {
		...
        this.setState({ ingredients: updatedIngredient, totalPrice: newPrice })
        this.updatePurchaseState(updatedIngredient)
    }

    render() {
        const disabledInfo = {
            ...this.state.ingredients
        }
        for (let key in disabledInfo) {
            disabledInfo[key] = !disabledInfo[key]
        }
        return (
            <Aux>
                <Burger ingredients={this.state.ingredients} />
                <BuildControls
                    ...
                    purchasable={this.state.purchasable}
                />
            </Aux>
        );
    }
}
```



### 165. Creating the Order Summary Modal

주문에 대한 정보를 보여줄 모달을 제작할 것이다.

UI를 관리하기 위해 component 내부에 UI 디렉토리를 생성한다.

```bash
...
│  │
│  └─UI
│      └─Modal
│              Modal.js
...
```



```js
// Modal.js
import React from 'react';
import styles from './Modal.module.css'
const modal = (props) => (
    <div className={styles.Modal}>
        {props.children}
    </div>
)

export default modal;
```

모달을 어디에서 사용할 것인가?

 모달이 논리적으로 포함 되며, 스테이트를 가져서 모달의 display를 관리할 수 있는 곳
즉, BurgerBuilder가 된다.

BurgerBuilder.js 파일은 이제 `주문정보`를 관리해야 한다. 하지만 직접 관리를 하기에는 덩치가 꽤 크다. 따라서 component를 제작하여 이를 관리한다.

BurgerBuilder는 주문에 대한 정보의 처리를 도와줄 component로 OrderSummary를 만들었다. 또한 이를 Burger 디렉토리의 바로 내부에 위치시킨다.

```js
// Ordersummary.js
import React from 'react'

import Aux from '../../../hoc/Auxiliary'

const orderSummary = (props) => {
    const ingredientSummary = Object.keys(props.ingredients)
        .map(igKey => {
            return <li key={igKey}>
                <span style={{ textTransform: 'capitalize' }}>
                    {igKey}
                </span>:
                {props.ingredients[igKey]}
            </li>
        })

    return (
        <Aux>
            <h3>Your Order</h3>
            <p>A delicous burger with the following ingredients:</p>
            <ul>
                {ingredientSummary}
            </ul>
        </Aux>
    )
}

export default orderSummary
```

```js
import React, { Component } from 'react';

import Aux from '../../hoc/Auxiliary'
import Burger from '../../components/Burger/Burger'
import BuildControls from '../../components/Burger/BuildControls/BuildControls'
import Modal from '../../components/UI/Modal/Modal'
import OrderSummary from '../../components/Burger/OrderSummary/OrderSummary'

const INGREDIENT_PRICES = {
    salad: 0.5,
    cheese: 0.4,
    meat: 1.3,
    bacon: 0.7
}

class BurgerBuilder extends Component {
    state = {
        ingredients: {
            salad: 0,
            bacon: 0,
            cheese: 0,
            meat: 0
        },
        totalPrice: 4,
        purchasable: false
    }

    ...

    render() {
		...
        return (
            <Aux>
                <Modal><OrderSummary ingredients={this.state.ingredients}/></Modal>
				...
                />
            </Aux>
        );
    }
}

export default BurgerBuilder
```



### 166. Showing & Hiding the Modal (with Animation!)

애니메이션 효과를 넣기 위해서는 Modal을 렌더링 하거나 하지 않는 방식으로 해서는 안된다. Modal의 style에 직접적인 변화를 줘야 한다.

```js
// BurgerBuilder.js

class BurgerBuilder extends Component {
    state = {
        ...
        purchasing: false
    }

    ...

    purchaseHandler = () => {
        this.setState({ purchasing: true })
    }

    render() {
        ...
        return (
            <Aux>
                <Modal show={this.state.purchasing}><OrderSummary ingredients={this.state.ingredients} /></Modal>
                <Burger ingredients={this.state.ingredients} />
                <BuildControls
                    ...
                    ordered={this.purchaseHandler}
                />
            </Aux>
        );
    }
}

export default BurgerBuilder
```

> 시나리오
>
> 1. BuildControls 의 Order button을 클릭하면 purchaseHandler가 동작한다.
> 2. purchaseHandler 가 purchasing의 값을 true로 바꾸어 준다.
> 3. Modal 에 purchsing 값이 전달된다.
> 4. Model 내에서inline style을 통해, purchasing 값이 true이면 모달이 보이도록 한다.

### 167. Implementing the Backdrop Component

모달이 떴을 때, 모달 밖 화면 아무데나 클릭하면 모달이 꺼지게 만들기

```bash
...
│  │
│  └─UI
│      ├─Backdrop
│      │      Backdrop.js
│      │
│      └─Modal
│              Modal.js
│              Modal.module.css
...
```

```js
// Backdrop.js

import React from 'react'
import styles from './Backdrop.module.css'
const backdrop = (props) => (
    props.show ? <div className={styles.Backdrop}></div> : null
);

export default backdrop
```

배경 전체를 덮는 것이기 때문에 사실 위치는 크게 중요하지 않다.

시나리오를 살펴 보았을 때, 모달과 백드롭이 가장 관계가 깊기 때문에, 모달 내부에 백드롭을 위치 시킨다.



### 168. Adding a Custom Button Component

버튼은 특정 컴포넌트에만 있는 것이 아니라, 지속적으로 쓰인다. 따라서 버튼을 UI component로 관리하면 편하다.

```bash
...
│  │
│  └─UI
│      ├─Backdrop
│      │      Backdrop.js
│      │      Backdrop.module.css
│      │
│      ├─Button
│      │      Button.js
│      │      Button.module.css
│      │
│      └─Modal
│              Modal.js
│              Modal.module.css
...
```

```js
// Button.js

import React from 'react'

import styles from './Button.module.css'
const button = (props) => {
    <button
        className={[styles.Button, styles[props.btnType]].join(' ')}
        onClick={props.clicked}>{props.children}</button>
}

export default button;
```



### 169. Implementing the Button Component

```js
// OrderSummary.js

...
import Button from '../../UI/Button/Button'

const orderSummary = (props) => {
    ...

    return (
        <Aux>
            ...
            <Button btnType="Danger" clicked={props.purchaseCanceled}>CANCEL</Button>
            <Button btnType="Success" clicked={props.purchaseContinued}>CONTINUE</Button>
        </Aux>
    )
}

export default orderSummary
```

purchaseCanceled 와  purchaseContinued는 BurgerBuilder 단계에서 정의하여 넘겨준다.



### 170. Adding the Price to the Order Summary

가격을 넣자

### 171. Adding a Toolbar

```bash
├─components
...
│  │
│  ├─Navigation
│  │  └─Toolbar
│  │          Toolbar.js
```

```js
// Layout.js

const layout = props => (
  <Aux>
    <Toolbar />
    <main className={styles.Content}>
      {props.children}
    </main>
  </Aux>
);
```

### 172. Using a Logo in our Application

로고도 하나의 컴포넌트로 관리하는 것이 편하다

```bash
├─components
...
│  │
│  ├─Logo
│  │     Logo.js
```

- img 태그의 경로 지정 문제
```js
import React from 'react'

const logo = (props) => (
    <div>
        <img scr={}/>
    </div>

)

export default logo;
```

src를 단순히 상대 경로로 때려 넣으면 안된다. 리액트를 실행시키면, 웹팩이 번들링 단계를 거치기 때문. 번들링을 거치고 난 디렉토리는 현재 작업하고 있는 디렉토리와 그 구조가 상이하다.

따라서 웹팩에게 어떠한 경로에 있는 이미지 파일을 사용할 것이라는 것을 알려 주어야 한다.

그 방법은 아래와 같다.

```js
import React from 'react'

import burgerLogo from '../../assets/images/burgerLogo.png'

const logo = (props) => (
    <div>
        <img src={burgerLogo} alt="MyBurger" />
    </div>

)

export default logo;
```

### 173. Adding Reusable Navigation Items

component 디렉토리에 Navigation 디렉토리를 생성해서 작성한다.

### 174. Creating a Responsive Sidedrawer

### 175. Working on Responsive Adjustments

### 176. More about Responsive Adjustments

### 177. Reusing the Backdrop