# [Cookie and Session](https://interconnection.tistory.com/74)

## HTTP의 특징

stateless & connectionless

[https://medium.com/wasd/node-js-%EC%99%80-cookie-session%EC%9C%BC%EB%A1%9C-%EC%82%AC%EC%9A%A9%EC%9E%90%EC%9D%98-%EC%A0%95%EB%B3%B4-%EC%A0%80%EC%9E%A5-part-1-b66d8b35a6e6](https://medium.com/wasd/node-js-와-cookie-session으로-사용자의-정보-저장-part-1-b66d8b35a6e6)



## 로그인 설계

1. 로그인 request 발생
2. sessions table 에 session 튜플 생성
   session 튜플 구성 요소 : {uuid, username(PK), name}
3. uuid를 가진 쿠키 생성 