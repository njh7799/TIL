# Inheritance

---

## extends를 이용한 간단한 클래스 상속

### constructor 와 super을 이용하여 부모 클래스의 변수값을 전달

```js
class Parent {
    constructor() {
        this.hanammme = 15;
    }
}

class Child extends Parent {
    constructor() {
        super();
        this.jack = 13;
    }
    print() {
        console.log(this.hanammme)
    }
}

new Child().print()
```

### constructor을 사용하지 않을 경우

```js
class Parent {
    constructor() {
        this.hanammme = 15;
    }
}

class Child extends Parent {
    jack = 13;
    print() {
        console.log(this.hanammme)
    }
}

new Child().print()
```

ES6 에서는 위와 같은 선언 또한 허용된다.

**의문점** 그렇다면 두 번째 방법으로 선언 했을 때 내부 동작은

```js
constructor(in) {
	super(in);
	this.jack = 13;
}
```

```js
constructor() {
	super();
	this.jack = 13;
}
```

 둘 중 어떤 것 일까?

당연히 전자이다.

```js
// constructor 값을 의도적으로 전달해주지 않을 때
class Parent {
    constructor(ing) {
        this.hanammme = ing;
    }
}

class Child extends Parent {
    constructor() {
        super();
        this.jack = 13;
    }
    print() {
        console.log(this.hanammme)
    }
}

new Child(123).print()

결과: undefined
```

```js
// constructor 값을 직접 전달해 줄 때

class Parent {
    constructor(ing) {
        this.hanammme = ing;
    }
}

class Child extends Parent {
    constructor(ing) {
        super(ing);
        this.jack = 13;
    }
    print() {
        console.log(this.hanammme)
    }
}

new Child(123).print()

결과: 123
```

```js
// constructor를 생략했을 때

class Parent {
    constructor(ing) {
        this.hanammme = ing;
    }
}

class Child extends Parent {
        jack = 13;
    print() {
        console.log(this.hanammme)
    }
}

new Child(123).print()

결과: 123
```

