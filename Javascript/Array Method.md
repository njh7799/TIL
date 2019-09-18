# [Array Method](https://bblog.tistory.com/300)
## forEach

배열의 요소에 순차적으로 접근하여 콜백 함수를 실행

```javascript
const arr = [1, 2, 3, 4, 5];
arr.forEach(e=>{if(e%2) console.log(e)});
```



<h2>map</h2>
배열의 각 요소들을 일괄적으로 변경 시킴

새로운 배열을 생성하는 immutable 방식

```javascript
const arr = [1, 2, 3, 4, 5];
arr.map(e=>e*4);//[4, 8, 12, 16, 20]
```



<h2>filter</h2>
배열의 각 요소를 콜백함수가 규정한 규칙에 따라 걸러 냄

```javascript
const arr = [1, 2, 3, 4, 5];
arr.filter(e=>e%2);//[1, 3, 5]
```



<h2>find</h2>
조건을 만족하는 가장 빠른 요소 값을 반환

```javascript
const arr = [1, 5, 3, 4, 5]
arr.find(e=>!(e%2)); // 4
```



<h2>reduce</h2>
reduce는 누산기의 개념이 적용된다.

reduce의 패러미터는 callback 함수와 initial Value가 있다.

-  callback 함수

   최대 4가지 파라미터가 들어간다. initialValue가 없는 경우에는, previousValue에 배열의 첫번 째 인자가 들어간다.
  - previousValue: 이전 마지막 콜백 호출에서 반환된 값 || initialValue.
  - currentValue: 배열 내 현재 처리되고 있는 요소.
  - currentIndex: 배열 내 현재 처리되고 있는 요소의 인덱스.
  - array: reduce에 호출되는 배열.

- initial Value 초기 값.



<h2>slice</h2>
immutable 방식

```javascript
arr.slice(startIdx,endIdx)
//startIdx 부터 endIdx 직전 까지의 요소들을 배열의 형태로 반환한다.
```

```javascript
const arr = [1, 2, 3, 4, 5];
const arr2 = arr.slice(1,4)
//arr2 = [2, 3, 4]
```



<h2>splice</h2>
mutable 방식

```javascript
arr.splice(startIdx, len)
//startIdx 부터 len 만큼의 요소를 잘라낸다.
```

```javascript
const arr = [1, 2, 3, 4, 5];
const arr2 = arr.splice(1,2)
//arr1 = [1, 4, 5]
//arr2 = [2, 3]
```



<h2>etc</h2>
- for(i in arr)
  - arr 의 인덱스에 순차적으로 접근
- for(e of arr)
  - arr 의 요소에 순차적으로 접근



[ref](https://bblog.tistory.com/300)