field 를 왜 ()=>() 이렇게 함수로 만드니?

참조의 문제 때문에. 그냥 객체로 만들면 위에서 부터 실행되다가, 특정 객체가 선언 되지 않았다면서 에러가 나타날 가능성이 농후.