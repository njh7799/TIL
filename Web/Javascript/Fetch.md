# Fetch

## 전체 코드

```javascript
//POST 방식으로 fetch 보내기
fetch('./reduplication', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
          username: 'jack'
          email: 'rainy_waltz@naver.com'
      })
    }).then(response => response.json()).then(data=>console.log(data));
```

## 요청

```javascript
fetch('./reduplication', {
    
    //전송 방식 설정
      method: 'POST',
    
    //헤더 설정
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
```

## 수신

```javascript
//response에 .json()메소드를 실행하면, response의 body가 promise에 감싸서 나온다
.then(response => response.json())

//Promise 객체를 .then 구문을 통해 푼다.
    .then(data=>console.log(data));
```

