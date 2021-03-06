# Code review cheat sheet



## 자료형

- 변수가 null 일 가능성
- 배열/리스트의 인덱스가 다음 값일 상황이 있는지
  - -1, 0, 1, 2: 이 경우에 대해 안전하면 99&는 안전하다.



## 조건문

- 서로 다른 조건이 혼합된 if / if else 중첩
- 여러 개의 boolean 표현식이 결합된 if 문
- boolean 값을 거꾸로 이해하고 썼을 가능성



## 반복문

- 반복에 진입하지 않을 가능성
- 반복을 이탈할 수 없을 가능성
- 반복 도중에 반복대상의 자료형을 변경하지 않는지



## 함수

- 서로 다른 자료형의 값을 반환하지는 않는지
- 선언하는 것보다 인자가 적게 넘어오는 경우는 없는지
  - 특히 Javascript



## 시작과 끝

- Transcation이 올바르게 수행되지 않을 가능성
  - 시작되기 전에 이미 문제가 있을 가능성
  - 끝난 뒤에 뒤늦게 문제가 있을 가능성
- drag start - drag end
  - 어떤 케이스로 중도 이탈이 발생할 수 있을까



## 이불 밖은 위험해

- node-machine-id의 사례
  - https://bit.ly/2mmhdJe



## Recursion

- 재귀 탈출 조건이 온전한가
- 어떤 경우에 탈출 조건을 만족하지 못할까



## 계단 주의

- 한 코드 블럭 안에는 가급적 같은 깊이의 코드만
  - 추상화 수준이 비슷한 코드를 의미



## Circulation

- 다음 단계로 전이가 막혔다면, 어디서일까?



## CRUD

- 거의 모든 정보는 관련 CRUD 기능이 존재한다.
- CRUD 중 누락된 것이 있는지
- 권한 없이 수행될 여지는 없는지
  - 가량 Update 권한이 없는데 삭제할 수 있다거나
  - GET으로 Delete할 수 있다거나
  - 권한이 없는데 Read할 수 있다거나



## Dangling event handler

- 등록된 이벤트 핸들러가 어떤 경우에 해제되지 않을까
- 이벤트 핸들러가 중복으로 등록되지는 않을까
- 객체 폐기 때 객체가 등록한 이벤트 핸들러도 같이 제거되는지



## Inverted Dependency

- 상위 레이어 객체의 참조를 가지고 있지는 않은가
- 내가 가진 프로퍼티의 수명주기를 내가 관리해도 되는가



## 모델의 것은 모델에게, 컨트롤러의 것은 컨트롤러에게

- 만약 CLI가 있다면 이 코드는 어디에 위치할까
- Web MVC에서 Controller는 HTTP로 건너온 입력값을 중개하는 역할만 담당해야
- Entity와 Service는 제공 가능한 모든 Use Case를 제공해야



## 변경된 부분만 말고 전체를 살펴보기

- diff 만 보면 변경된 부분이 전체 속에서 가지는 의막 잘 보이지 않음
- 좋은 도구는 이걸 편하게 보게 해줌



## 비동기는 일단 꺠진다고 보자

- 이중 요청은 거의 항상 발생한다.
  - PIE 파일 저장 후 종료의 사례
- 항상 방어장치를 만들자
  - 동시 진입 거절
  - 순차 진행 강제
  - 병렬 진행

## Optimization

- 성능 최적화를 위한 분기와 상태변수를 추가 :x:
- 관측해보고 실제로 병목일 때만  :o:

---

## One More thing

## 요구사항 누락이야 말로 가장 큰 결함

- 요구 사항을 제대로 구현 했는지
- 구현을 깨뜨려 보기
  - 음수, 특수문자, 너무 긴 문자열 넣업기
  - 같은 동작을 여러 번 시도해 보기