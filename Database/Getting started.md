# DBMS 개요

- 백엔드 개발에서 가장 중요한 구성요소중 하나
- RDBMS vs NoSQL



## 학습지식

---

### Data, Database, and DBMS

- Data
  - 저장매체에 저장할 수 있는 정보
- Database
  - 데이터의 집합.
- Database Management System
  - 데이터 베이스를 관리하는 APP
  - 흔히 DB라고 부르면 보통 DBMS를 뜻한다.



---

### Data, Information, and Knowledge

![image](https://user-images.githubusercontent.com/40619551/65404863-3a947c80-de15-11e9-8780-5e27b7fc8e94.png)

- data
- Information: 
  - 데이터를 가공한 것
  - 유의미한 정보
  - 예시) 로그인 횟수
- Knowledge
  - Information을 가공한 것
  - 통계 자료를 활용하기도 함
  - 예시) abuser로 추정되는 사용자
- Widom
  - 미래를 예측

---

### RDBMS

- 데이터를 효율으로 저장공간에 저장할 수 있다.
- 중복되지 않게 데이터를 저장할 수 있는 방법.
- 오라클, MySQL, MS-SQL, PostgreSQL, ...

---

### SQL

- Structured Query Language
- 선언적 언어: What을 정의 (cf. 절차적 언어: How를 정의)
- RDMBS 제어에 사용됨

---

### NOSQL

- Not Only SQL
- 관계형 데이터베이스가 아닌 나머지
- 그래프 디비, 도큐먼트 디비, KV Store
- MongoDB, Redis, DyanmoDB, neo4j, Casandra, HBASE, ...

---

### 데이터베이스 관련 용어

### CAP

- 분산 시스템이 가져야 할 세가지 특징
  - Consistency: 일관성. 사용자가 요청을 했을 때 언제나 같은 응답이 오는 것. 데이터의 동기화가 잘 되어 있어야 한다.
  - Availability: 가용성. 언제가 응답을 주는 서비스.
  - Partition Tolerence: 물리적으로 일부 서버가 다운 되더라도, 전체 시스템에 영향을 주지 않는 것.
- CAP를 모두 갖추는 시스템을 만드는 것은 사실상 불가능하다. 이론적으로 불가능. 따라서 위 세가지 중에서 무언가를 희생 해야 한다. Consistency를 희생하는 것이 대세. Eventual consistency: 일정 시간이 지나면 Consistency를 보장해줌. 상시 보장해주지 않는다.

### ACID

- 관계형 DB는 transaction에서 ACID를 만족

- Atomicity: 원자성. All or Nothing
- Consistency: 데이터는 언제나 완전 무결한 상태여야 한다.
- Isolation: 동시에 실행됨에도 마치 한번에 하나씩 실행되는 것 처럼 동작
- Durability: 한번 저장되면 유지 됨

### 확장성

- 수평 확장 VS 수직 확장

  - 수직 확장: 돈 부어서 비싼거로 바꾸기

    - 관계형 DB는 수직 확장만 가능
    - 가성비 문제 때문에 한계에 봉착할 수 있음

  - 수평 확장: 서버를 더 사서 연결 

    - NoSQL은 대부분 지원해준다.

---

### SQL VS NoSQL

- CAP: NoSQL이 중요시
- ACID: RDBMS이 중요시(돈은 관계형 DB)
- Transaction?
- 확장성?

---

## [용어](https://m.blog.naver.com/PostView.nhn?blogId=classe82&logNo=20153660200&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

| 파일 시스템    | 데이터베이스 모델링   | 관계형 데이터베이스         |
| -------------- | --------------------- | --------------------------- |
| 파일(file)     | 엔터티(Entity)        | 테이블(table)               |
| 레코드(record) | 튜플(Tuple)           | 행(row)                     |
| 필드(field)    | 어트리뷰트(attribute) | 컬럼(column)                |
| 키(key)        | 유일값(identifier)    | 기본키(Primary key), unique |

http://db-engines.com/en/ranking

