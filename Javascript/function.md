<h1>함수</h1>

- 선언식과 표현식

  - 선언식

    ```javascript
    function printName() {
    	return 'anonymouse';
    }
    ```

  - 표현식

    ```javascript
    const printName = function() {
    	return 'anonymouse';
    }
    ```

- arrow function

  - this가 함수 내부에 바인딩 되지 않는다

  - 정의 방법

    ```javascript
    const func1 = (e)=>e*2
    const func2 = (e)=>{return e*2}
    ```

    