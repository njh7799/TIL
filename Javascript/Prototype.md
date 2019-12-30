# Prototype chain



![img](https://miro.medium.com/max/1729/1*mwPfPuTeiQiGoPmcAXB-Kg.png)

- 생성된 객체의 `__proto__` => 생성자의 prototype
- 생성자의 prototype의 `__proto__` => 상위 생성자의 prototype
- 생성자의 prototype의 constructor => 생성자

```js
function Parent(name) {
    this.name = name;
}

Parent.prototype.getName = function() {
    return this.name;
};

function Child(name) {
    Parent.call(this, name);
    this.age = 0;
}

//Object.create(Parent.prototype) 로 생성된 객체의 __proto__ 는 Parent의 prototype이다.
// 이 코드를 실행하고 나면 Child.prototype 의 __proto__ 는 Parent의 prototype이 된다.
Child.prototype = Object.create(Parent.prototype);

//위의 코드만 실행하고 난 뒤에는 Child.prototype에 constructor가 없기 때문에 아래와 같은 코드를 통해 이를 추가해줘야 한다.
Child.prototype.constructor = Child;

Child.prototype.getAge = function() {
    return this.age;
};

var c = new Child(); // (2)
```

- [Prototype](https://medium.com/@bluesh55/javascript-prototype-이해하기-f8e67c286b67)
- [Prototype Chain](https://meetup.toast.com/posts/104)
- [Prototype Chain 내 게시글](https://medium.com/@njel7799/prototype-chain-프로토타입-체인-81911be02b44)

# 이하 [lucas](https://lucas.codesquad.kr/course/boost-4-membership/Amazon-carousel/CLASSES-와-Prototype) 발 자료

## 왜 필요한가?

객체지향 프로그래밍은 코드로 구현해보면서 경험하는 것이 중요하다.

또한 JavaScript.객체지향 프로그래밍은 prototype과 같은 특별한 개념을 중심으로 동작한다.

이 언어적인 특징을 잘 이해해야 JavaScript세계에서 객체지향 프로그래밍으로 복잡한 애플리케이션을 컨트롤 할 수 있다.

## 학습 목표

- prototype 을 이해하고, 그 실체를 확인한다.
- ES6 Classes로 객체를 만드는 방법을 안다.

------

## 학습지식

#### 객체표현 - 1. Class - ES2015

Class가 생기고, class에서 제공하는 constructor라는 생성자가 주어짐.
class를 new키워드로 호출하면 constructor가 자동호출 됨.

constructor는 instance를 만들어서 반환. 다시말해 객체(instance)를 생성해서 반환.

```javascript
class Health {
  constructor(name, healthTime) {
    this.name = name;
    this.healthTime = healthTime;
  }

  showHealth(){
     console.log(this.name + "님, 오늘은 " + this.healthTime + "에 운동을 하셨네요");
  }

}

const ho = new Health("crong", "12:12");
ho.showHealth();
코드복사
```

\#ES Classes의 브라우저 지원범위는?
https://caniuse.com/#feat=es6-class

------

#### 객체표현 - 2. constructor pattern

function을 new 키워드로 호출하면, 그 함수는 constructor가 됨.

```javascript
const Health = function(name,healthTime) {
  this.name = name;
  this.healthTime = healthTime;
  this.showHealth = function() {
    console.log(this.name + "님, 오늘은 " + this.healthTime + "에 운동을 하셨네요");
  }
}

const ho = new Health("crong", "12:12");
ho.showHealth();
코드복사
```

------

#### 객체표현 - 3. prototype pattern

(가장 중요한 부분으로 내용이 길다. 🚂)

constructor 패턴과 유사하나,

메서드를 prototype객체에 보관해서 constructor pattern보다는 메모리 효율 성에서 매우 유리함.

<iframe src="https://player.vimeo.com/video/266039157" width="800" height="450" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="margin: 0px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 16px; line-height: 28.8px; font-family: &quot;Nanum Barun Gothic&quot;, Courier, &quot;Apple SD 산돌고딕 Neo&quot;, -apple-system, &quot;Lucida Grande&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, &quot;Segoe UI&quot;, 돋움, dotum, sans-serif; vertical-align: initial; box-sizing: border-box; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"></iframe>



[Prototype pattern](https://vimeo.com/266039157) from [Yoda codd](https://vimeo.com/codesquad) on [Vimeo](https://vimeo.com/).

```javascript
const Health = function(name, healthTime) {
  this.name = name;
  this.healthTime = healthTime;
}

Health.prototype.showHealth = function() {
  console.log(this.name + "님, 오늘은 " + this.healthTime + "에 운동을 하셨네요");
}

const ho = new Health("crong", "12:12");
ho.showHealth();

코드복사
```

ho 라는 객체를 열어서 prototype의 어떻게 실제 존재하는지도 들여다 보자.

또한 ho2로 만들어진 prototype객체의 메서드와 ho의 prototype객체의 메서드가 서로 같은 메모리 주소를 참조하는지도 확인해보자. (=== 으로 비교)

##### 이렇게 만들어진 객체 들여다보기.

myHealth 개발자도구의 콘솔창에서 열어보면 다음과 같다.

```javascript
myHealth => 
    name : "달리기", 
    lastTime : "23:10", 
    > __proto__ : Object
        showHealth: ()
        > __proto__: Object  
코드복사
```

**proto** 는 prototype객체를 표현한 것이고,
모든 객체는 prototype으로 연결되어 있어, prototype안에 있는 어떠한 메서드를 사용하면, prototype을 타고 올라가면서 찾는다. 이것을 prototype체인이라고 한다.

##### 왜 prototype?

prototype은 효과적으로 동작.
생성자를 통해 생성된 객체(인스턴스)들이 여러개 있어도,
prototype에 연결된 객체들(movieObject)는 동일한 메모리 공간에서 효율적으로 재사용 됨.
즉, 두 객체의 prototype은 같음.

```javascript
myHealth.__proto__ === myHealth2.__proto__  //true
myHealth2.__proto__ === myHealth3.__proto__  //true
//__proto__ 객체는 자바스크립트 내부에서만 사용되는 속성이다.
코드복사
```

prototype객체는 최상위 Object까지 연결되어 있음.
prototype연결고리를 만들어서 객체간의 상속관계를 만들 수 있음.

##### prototype을 사용한 예제

두 개의 모듈을 생성자 역할을 하는 함수를 만들고, 각각 생성자에 prototype속성에다가 메서드를 추가하는 예제이다.
이처럼 class없이도 구현할 수 있다.

```javascript
//VM 모듈
const VM = function(elBase) {
    this.elBase = elBase;
    this.init();
}

VM.prototype = {
  init : function() {
	this.elBase.addEventListener("click", this.clickListener);
    this.xxx.addEventListener("click", this.xxxxListener);
  }
}

//Wallet 모듈
const Wallet = function(elBase) {
    this.elBase = elBase;
    this.init();
}

Wallet.prototype = {
  init : function() {
    this.elBase.addEventListener("click", this.clickListener);
    this.xxx.addEventListener("click", this.xxxxListener);
  },
	run : function() {
    //blah....
  }
}
코드복사
```

------

#### 객체표현 - 4. Object.create

Object.create는 직접적으로 prototype키워드를 사용하진 않지만, Prototype object를 만드는 것과 동일.

```javascript
const healthObj = {
  showHealth : function() {
    console.log(this.name + "님, 오늘은 " + this.healthTime + "에 운동을 하셨네요");
  }
}

const ho = Object.create(healthObj, {
   name: { value: "crong" },
   healthTime: { value: "12:22" } 
})

ho.showHealth();
코드복사
```

Object.create는 prototype기반 객체연결(상속형태)을 좀더 매끄럽게 사용하기 위해 탄생했다고 이해할 수 있음.

Object.create를 사용하면 객체연결구조가 잘 만들어짐.

하지만 이 방법은 많이 쓰이지 않고 있는데 이유는, ES6 Classes의 extend를 사용해서 이제 보다 쉽게 클래스간 상속 구조를 만들 수 있게 됐기 때문.

------

#### 언제 object literal을 사용하고, 언제 class 를 사용할까?

1. object literal

여러개의 객체를 만들어서 생성할 필요가 없을때, 즉 일반화할 필요가 없는 경우에는 단순히 object literal로 객체를 표현.

1. class

하나 이상으로 개별적인 객체를 생성해야 할 때.