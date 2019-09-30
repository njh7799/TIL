# [조인, 정규화, 인덱스](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/Join-and-Index)

------

## 왜 필요한가

- 관계형 데이터 베이스의 관계로부터 원래의 데이터를 복원하기 위해 필요하다.
- 올바른 개념적 / 논리적 데이터베이스 설계를 이해하기 위한 기초 지식이다.

------

## 학습 목표

- 조인의 필요성에 대해 이해한다.
- 논리적 조인의 종류와 용도에 대해 설명할 수 있다.

------

## 학습지식

### 조인

RDB의 두 테이블을 합쳐서 하나의 정보로 보여주는 연산

- 그냥 처음부터 한 테이블로 만들면 안 될까?
  - 데이터의 중복이 발생할 수 있다.
- 좋은 테이블이란 무엇일까?

------

### 테이블의 크기

- 한 컬럼으로만 구성된 테이블들 VS
- 모든 컬럼을 하나의 테이블로 합치기

각각의 장단점은 무엇일까?

------

### 정규화와 조인

- 잘못 설계된 테이블에서는 이상 현상이 발생한다.
  - CRUD 모두 이상 현상이 존재
- 이상 현상을 막기 위해 테이블을 분리하는 작업을 정규화라고 한다.
- 정규화한 테이블에서 원래의 정보를 복원하기 위해서는 **조인**이 필요하다.

------

### 실습

아래 내용으로 테이블을 만들어 보자.

![img](http://public.codesquad.kr/honux/images/table1.png)

------

### 외래 키

- BOARD 테이블에서는 USER 테이블 레코드의 참조가 발생한다.
- 이 때 사용하는 USER의 UID 값을 외래 키라고 한다.

![img](https://lucas.codesquad.kr/course/boost-4-membership/http://public.codesquad.kr/honux/images/table1.png)

------

```sql
DROP TABLE IF EXISTS USER;
CREATE TABLE USER (
	ID VARCHAR(32),
	NAME VARCHAR(32) NOT NULL,
	PRIMARY KEY(ID)
	);

INSERT INTO USER VALUES
('apple', 'honux'),('banana','crong'),('carrot','pobi');
```

------

```sql
DROP TABLE IF EXISTS BOARD;
CREATE TABLE BOARD(
	ID INT NOT NULL AUTO_INCREMENT,
	DATE DATE,
	UID VARCHAR(32),
	TITLE VARCHAR(64) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(UID) REFERENCES USER(ID)
        ON DELETE CASCADE ON UPDATE CASCADE);
```

------

```sql
INSERT INTO BOARD (DATE, UID, TITLE) VALUES
	('2015-1-1','apple', 'hello'),
	('2015-1-2','banana', 'hi'),
	('2015-1-3','apple', 'good'),
	('2015-1-4','banana', 'zizi'),
	('2015-1-3',NULL, 'I am hacker');

DESC USER;
DESC BOARD;

SELECT * FROM USER;
SELECT * FROM BOARD;
```

------

### Cross Join

카테시안 프로덕트라고 하기도 하며 가능한 모든 쌍을 나타낸다.

```sql
SELECT * FROM USER CROSS JOIN BOARD;
```

어떤 의미가 있을까?

------

### Inner Join

```sql
SELECT * FROM USER U CROSS JOIN BOARD B
	WHERE U.ID = B.UID;

SELECT * FROM USER U INNER JOIN BOARD B ON U.ID = B.UID;

SELECT * FROM USER U JOIN BOARD B ON U.ID = B.UID;
```

약간의 정보 손실이 발생한다.

------

### Left Outer Join

```sql
SELECT * FROM USER U LEFT JOIN BOARD B ON U.ID = B.UID;
```

- 왼쪽 테이블이 바깥쪽 테이블이 된다는 의미

------

### Right Outer Join

```sql
SELECT * FROM USER U RIGHT JOIN BOARD B ON U.ID = B.UID;
```

------

### 참조 무결성 제약 조건

외래키 컬럼의 값이 가져야 하는 제약 조건

1. 반드시 참조 테이블의 Primary Key 값 또는
2. NULL 값이어야 한다.

------

### ON DELETE CASCADE

### ON UPDATE CASCADE

참조대상 테이블에서 삭제 또는 변경이 일어날 때 참조되는 레코드 값도 함께 삭제 또는 변경이 일어나도록 지정해 준다

```sql
UPDATE USER SET ID='blueberry' WHERE ID='banana';
SELECT * FROM BOARD;
DELETE FROM USER WHERE ID='apple';
SELECT * FROM BOARD;
```

------

### Primary Key(PK)

- PK가 가지는 논리적 의미와 물리적 의미는 무엇일까?
- Foreign Key(FK) 가 가지는 논리적 의미와 물리적 의미는 무엇일까?

아래 내용에 대해 검색해 본다.

```txt
Index
B-tree
Clustered Index
Secondary Index
```

------

### Index와 효과적인 탐색

- Primary Key, Foreign Key 컬럼에는 기본적으로 Index가 자동으로 생성된다.
- Index가 있을 컬럼의 경우 O(log n) 으로 탐색 가능
- Index가 없는 컬럼은 O(n) 시간 소요

------

### Index의 장단점

- 삽입시 성능 저하
- 검색 및 조인시 성능 향상
- `explain`을 이용해서 외래 키가 있는 경우와 없는 경우를 비교해 봅시다.

출처: [쿼드 스쿼드 루카스](https://lucas.codesquad.kr/course/boost-4-membership/todo-backend/ERD)
