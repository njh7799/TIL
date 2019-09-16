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

- [ref]([https://medium.com/@bluesh55/javascript-prototype-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-f8e67c286b67](https://medium.com/@bluesh55/javascript-prototype-이해하기-f8e67c286b67))
- [ref2]([https://lucas.codesquad.kr/course/boost-4-membership/amazon-carousel/CLASSES-%EC%99%80-Prototype](https://lucas.codesquad.kr/course/boost-4-membership/amazon-carousel/CLASSES-와-Prototype))