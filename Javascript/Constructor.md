# Constructor

## 클래스 생성자와 함수형 생성자의 메소드 비교

클래스형 생성자로 인스턴스를 만들었을 경우, 각 인스턴스의 메소드가 같은 주소값을 참조한다.

반면, 함수형 생성자로 인스턴스를 만들었을 경우엔, 각 인스턴스의 메소드가 독립적인 주소값을 가진다.

함수형 생성자를 만든 후, 해당 생성자의 protype 에 새로운 메소드를 추가한 후, 다시 인스턴스를 생성하여 메소드를 비교하였을 경우, 해당 메소드는 같은 주소값을 참조한다. 

```js
class C {
  method() {}
}

function F() {
  this.innerMethod = function() {};
}

F.prototype.method = function method() {};

const classInst = new C();
const classInst2 = new C();
const functionalInst3 = new F();
const functinoalInst4 = new F();

console.log(classInst.method === classInst2.method); // true
console.log(functionalInst3.method === functinoalInst4.method); //true
console.log(functionalInst3.innerMethod === functinoalInst4.innerMethod); //false

```

[참고 자료](https://www.notion.so/atercatus/Contructor-fn-vs-Prototype-vs-Class-4fc9813ae59f4007b88faeae368885ee)