# [데이터베이스 모델링과 ERD](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/ERD)

------

## 왜 필요한가

- 견고한 백엔드 설계를 위해 데이터베이스 모델링이 필요하다.
- ERD는 RDBMS의 개념적 설계 및 데이터 모델링 기법으로 가장 널리 사용된다.

------

## 학습 목표

- ERD의 주요 개념을 이해하고 실제 요구사항을 기반으로 ERD를 작성할 수 있다.
- MySQL workbench와 같은 프로그램을 사용해서 직접 ERD를 그리고 SQL을 도출할 수 있다.

------

## 학습지식

### 데이터 모델링

- 현실세계에서
- 응용 프로그램에 필요한 데이터를 분석 및 선택해서
- 물리적으로 저장하는 방법을 결정하는 정형화된 기법

![190929-erd1.png](https://firebasestorage.googleapis.com/v0/b/nextstep-real.appspot.com/o/lesson-attachments%2F-LJ9HU9CLE8wyHd7jnIX%2F190929-erd1.png?alt=media&token=c27dcfc5-0af9-4c98-afa5-7a9fcc931e51)

------

### 데이터 모델링 단계

![190929-erd2.png](https://firebasestorage.googleapis.com/v0/b/nextstep-real.appspot.com/o/lesson-attachments%2F-LJ9HU9CLE8wyHd7jnIX%2F190929-erd2.png?alt=media&token=be0f055e-2567-4448-a343-9880f7953a1d)

------

### 산출물로 본 모델링 과정

- 요구사항 분석 -> 요구사항 분석서
- 개념적 설계 -> ERD
- 논리적 설계 - 관계형 모델
- 물리적 설계 - SQL

------

### 요구사항 분석

어플리케이션의 요구사항을 데이터의 관점에서 바라본다.

- 사용자 / 앱이 데이터베이스에게 요구하는 것은 무엇인가?
- 무엇을 어떻게 저장할 것인가?

------

### 설계 예제: 회사 운영 SW

#### 회사 분석

- 회사는 부서로 구성되어 있다.
- 부서는 부서이름과 부서번호, 한 명의 부장을 가진다.
- 부장의 업무 시작날짜를 기록한다.
- 부서는 하나 이상의 장소에 있을 수 있다.

------

#### 프로젝트

- 부서는 여러 프로젝트를 관리한다.
- 프로젝트는 고유번호, 고유이름, 위치 정보를 가진다.
- 한 프로젝트는 하나의 부서에만 속한다.

------

#### 사원

- 사원은 한 부서에 속한다.
- 사원은 하나 이상의 프로젝트에 참여한다.
- 사원 데이터는 사번, 이름, 주소, 성별, 주소, 연봉 정보등이다.
- 각 사원은 프로젝트에 참여한 시간을 관리한다.
- 각 사원은 1 또는 0명의 직속 상관이 있다.

------

#### 사원가족

- 사원들의 경조사 등을 위해 가족 정보를 유지한다.
- 가족 구성원에 대해 이름, 성별, 생일, 관계만 저장한다.

------

### 개념적 설계: ERD 그리기

- 수작업으로 그리기 또는 ERWin 등의 프로그램 사용

------

### 개체와 속성

#### 개체 (Entity)

- 실제 현실에서 독립적으로 존재하는 어떤 것
- 직사각형으로 표현한다.

#### 속성 (Attribute)

- 개체를 설명할 수 있는 특성
- 타원으로 표현
- 키 속성 : 개체마다 고유한 값을 가지는 속성
- 키 속성은 밑줄로 표현하며 하나 이상 존재 가능

------

### 관계 (Relationship)

- 개체와 개체를 연결하는 정보
- 관계도 속성을 가질 수 있다.
- 1:1, 1:M, M:N 의 세가지 관계가 존재한다.
- 반드시 필요한 관계는 겹줄로 표현

------

### 약개체와 식별 관계

- 키가 없는 개체를 약개체 (weak entity)라고 한다.
- 약개체와 부모 개체와의 관계를 식별 관계 (identifying relationship)이라고 한다.

---

### [식별 관계와 비식별 관계](https://k9e4h.tistory.com/56)

- 식별 관계:
  - 부모테이블의 유니크 키나 기본키로 지정된 컬럼이 자식테이블의 기본키 컬럼과 연결된 경우 실선으로 표기되고 식별 관계라고 한다.
  - 자식 테이블의 PK 가 FK이면 1:1 관계, 자식 테이블의 PK가 FK + column의 형태를 가지면 1:N 관계이다.
- 비식별 관계:   부모테이블의 유니크 키나 기본키로 지정된 컬럼이 자식테이블의 일반 컬럼과 연결된 경우 점선으로 표기되고 비식별 관계라고 합니다.

출처: https://k9e4h.tistory.com/56 [Kim's :D]  

------

### 완성된 ERD

![190929-erd3.png](https://firebasestorage.googleapis.com/v0/b/nextstep-real.appspot.com/o/lesson-attachments%2F-LJ9HU9CLE8wyHd7jnIX%2F190929-erd3.png?alt=media&token=84f19089-e1a4-421b-9011-20914d6b5dfb)

------

### 1:1, 1:N, N:M

- 1:1 관계
  - 두 테이블 중 아무 테이블에 상대 테이블의 PK를 FK로 넣으면 된다.
- 1:N 관계
  - N 에 해당하는 테이블에 1 테이블의 PK를 FK를 넣어야 한다.
  - 데이터 베이스의 원자성 때문에 1에 넣을 수 없다.
- N:M 관계
  - 교차 릴레이션을 만들어서 관리한다.
  - 교차 릴레이션의 PK 는 두 테이블의 PK를 합친 것이다.

---

### Workbench로 그리기

- Workbench를 이용해서 ERD를 그릴 수 있다.
- MySQL Workbench의 경우 reverse / forward 엔지니어링 기능을 지원한다.

출처: [쿼드 스쿼드 루카스](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/ERD)

