# Transaction (참고자료)

------

## 왜 필요한가

- 관계형 데이터베이스의 중요 성질인 트랜잭션에 대해 이해해야 견고한 백엔드 응용을 개발할 수 있다.

------

## 학습 목표

- 트랜잭션 격리수준에 대해 이해한다.

------

## 학습지식

### Jim Gray (1944-2007)

![img](http://www.allthingsdistributed.com/images/jimgray.gif)

- 세계 최초의 관계형 데이터베이스 System-R 개발
- 트랜잭션 개념 제안
- 2 Phase Locking
- Granularity Locking
- 튜링상과 찰스배비지상 수상

------

### MySQL 스토리지 엔진

- InnoDB는 레코드 기반 저장구조
- cf. column store (Amazon Redshift)
- RID (page #, slot #)를 통해 레코드 접근
- Secondary Index는 PK를 참조함
- B-tree 기반 클러스터링 인덱스
- 레코드 기반 잠금을 지원하지만 실제 물리적 잠금은 인덱스에 걸림

------

### 트랜잭션의 성질

A: Atomicity
C: Consistency
I: Isolation
D: Durability

------

### 참고: CAP 이론

C: Consistency
A: Availability
P: Partition Tolerence

셋 모두 만족시키는 시스템은 구현할 수 없다.
(트랜잭션의 일관성과 의미가 다소 다름)

많은 NoSQL은 일관성을 포기함

------

### 참고: Eventual Consistency

미래의 언젠가 일관성이 보장되긴 하는데 그 시점은 정해지지 않았을 경우

S3, DynamoDB등 많은 AWS 제품군이 이를 지원

------

### 참고, NoSQL의 특성

BA: Basically Available
S: Soft State
E: Eventual Consistency

산 VS 염기??

------

### 트랜잭션과 Serial Schedule

- 가장 쉽게 ACID를 지원하는 방법은?
- 한 번에 하나씩의 트랜잭션만 실행

#### Serial Schedule

세 트랜잭션 A, B, C가 있을 때 한 번에 하나씩 실행했을 때 가능한 결과들의 집합

> 3!

------

### Serializable Schedule

실제 데이터베이스의 트랜잭션 결과가 Serial Schedule의 부분집합인 경우 Serializable이라고 함

------

### Lock 없이 트랜잭션을 동시에 실행한다면

#### Lost Update Problem

- 두 개의 트랜잭션이 동시에 한 아이템의 데이터를 변경했을 때 발생하는 문제점
- **트랜잭션을 지원하는 데이터베이스에서는 발생하면 안 됨**
- DB 자체에서는 절대로 발생하지 않는 문제

------

#### (P1) Dirty Read Problem

- 한 트랜잭션에서 변경한 값을 다른 트랜잭션에서 읽을 때 발생하는 문제

![img](http://public.codesquad.kr/honux/images/201707261242.png)

------

#### (P2) Non-repeatable Read Problem

- 한 트랜잭션에서 같은 값을 두 번 읽었을 때 각각 다른 값이 읽히는 경우

![img](http://public.codesquad.kr/honux/images/201707261243.png)

------

#### (P3) Phantom Read Problem

- 주로 통계나 분석, aggregation function 등을 수행하는 쿼리에서 잘못된 값이 들어오는 경우

![img](http://public.codesquad.kr/honux/images/201707261246.png)

------

### Transaction Isolation Level

#### ANSI SQL (SQL92)

![img](http://public.codesquad.kr/honux/images/201707261251.png)

- 데이터베이스마다 지원하는 레벨이 다름
- MySQL과 MS-SQL은 4가지 모두 지원
- MySQL default: Repeatable Read
- Serializable은 엄청나게 느리기 때문에, 상황에 맞는 것을 사용하여야한다.
- MySQL은 Repeatable Read가 default이다. 그리고 이 모드로 해도 사실 문제는 거의 발생하지 않는다.
- 커넥션마다 isolation level 설정이 가능하다. global하게 안해도 됨

------

#### Isolation Level 확인 및 변경 (MySQL 5.7 이전)

```sql
SHOW VARIABLES LIKE 'tx_isolation';
SET TRANSACTION ISOLATION LEVEL 레벨;
START TRANSACTION;
-- QUERY START
COMMIT | ROLLBACK;
코드복사
```

#### 가능한 레벨

```sql
READ UNCOMMITTED
READ COMMITTED
REPEATABLE READ
SERIALIZABLE
코드복사
```

------

#### Isolation Level 확인 및 변경 (MySQL 5.7)

https://dev.mysql.com/doc/refman/5.7/en/set-transaction.html

```
SELECT @@GLOBAL.transaction_isolation, @@transaction_isolation;
SET GLOBAL transaction_isolation='REPEATABLE-READ';
SET SESSION transaction_isolation='SERIALIZABLE';
코드복사
```

#### 가능한 레벨 (MySQL 5.7)

```sql
READ-UNCOMMITTED
READ-COMMITTED
REPEATABLE-READ
SERIALIZABLE
코드복사
```

------

### MVCC

MySQL의 InnoDB는 오라클과 같이 MVCC를 내부적으로 사용

- 업데이트 중에도 읽기가 블록되지 않는다.
- 읽기 내용은 격리 수준에 따라 달라질 수 있다.
- 업데이트시 X락이 인덱스에 걸린다.

------

- 업데이트시 락의 대상이 실제 업데이트 아이템보다 더 클 수 있다.
- 동시 업데이트를 수행시 나중 트랜잭샌은 블록된다. 일정 시간 지나면 Lock Timeout이 발생한다.
- 업데이트시 이전 값을 Undo Log로 롤백 세그먼트에 유지한다. 이 값은 롤백시와 격리 수준에 따라 다른 값을 읽기 위해 사용된다.

------

### Repeatable Read

- MySQL의 기본 동작 모드
- 첫 번째 읽기에 스냅샷을 생성함
- 이후 동일 트랜잭션에서는 스냅샷에서부터 값을 읽음
- **잠금의 대상은 unique index, secoendary index의 유무에 따라 달라짐**

------

### Read Committed

- 커밋된 아이템을 읽을 수 있는 모드
- 커밋되지 않은 값은 읽을 수 없다.
- 같은 트랜잭션에서는 최근의 스냅샷을 읽는다.

------

### Read Uncommitted

- 다른 트랜잭션에서 바꾼 값이 트랜잭션 중간에도 반영된다.
- Read Committed와는 다른 값이 읽힐 수 있다.
- 일반적으로 그냥 최신 업데이트 값을 읽는다.
- **상당히 위험하다!**

------

### Serializable

- MySQL에서는 모든 SELECT문에 S락이 걸린다.
- Repeatable Read에서도 Phantom 문제가 발생하지 않으므로 많이 사용하지 않는다.
- **역시 매우 위험하다!**

------

### 기타 팁

- autocommit을 끄자 (특히 JDBC 등에서 주의)
- 긴 트랜잭션은 데드락의 원인
- 배치 작업 중간에 커밋을 하자
- 아무것도 하지 않는 트랜잭션 / 커넥션의 주의!
- 트랜잭션 중간에 사용자 입력이 존재하면 안됨!
- 서버 모니터링은 주기적으로
   