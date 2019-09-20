# [MongoDB](https://velopert.com/457)

으아아아아아 시작하기

```bash
> mongo
```



## DB commands

### db 리스트 확인

```bash
show dbs
```

### 현재 사용 중인 db

```bash
db
```

### 디비 생성 혹은 사용

```bash
use test_db
```

### db DROP

```bash
use test_db # db 선택
db.dropDatabase()
```

## Collection Commands

> Collection은 테이블을 의미한다.


### | 옵션

| Field     | Type    | 설명                                                         |
| :-------- | :------ | :----------------------------------------------------------- |
| capped    | Boolean | 이 값을 true 로 설정하면 capped collection 을 활성화 시킵니다. Capped collection 이란, 고정된 크기(fixed size) 를 가진 컬렉션으로서, size 가 초과되면 가장 오래된 데이터를 덮어씁니다. **이 값을 true로 설정하면 size 값을 꼭 설정해야합니다.** |
| autoIndex | Boolean | 이 값을 true로 설정하면, _id 필드에 index를 자동으로 생성합니다. 기본값은 false 입니다. |
| size      | number  | Capped collection 을 위해 해당 컬렉션의 최대 사이즈(maximum size)를 ~ bytes로 지정합니다. |
| max       | number  | 해당 컬렉션에 추가 할 수 있는 최대 갯수를 설정합니다.        |

### 테이블 생성

```bash
# 옵션 없음
db.createCollection("books") 
```

```bash
# 옵션 선택
db.createCollection("articles", {
... capped: true,
... autoIndex: true,
... size: 6142800,
... max: 10000
... })
```

```bash
# 테이블에 튜플을 넣을 때, 해당 테이블이 존재하지 않으면 자동으로 생성된다.
db.movies.insert({"title": "ironman"})
```

### 테이블 리스트 확인

```bash
show collections
```

### 테이블 DROP

```bash
db.books.drop()
```



## Tuple commands

### 데이터 추가

```bash
db.books.insert({"name": "NodeJS Guide", "author": "Velopert"})
```

```bash
db.books.insert([
... {"name": "Book1", "author": "Velopert"},
... {"name": "Book2", "author": "Velopert"}
... ]);
```

### Select  * from ${table}  where ~~

```bash
# find 메소드 안에 매개변수가 없으면, SElECT * from table
db.books.find()
```

### Delete

### | Parameter

| parameter | type     | 설명                                                         |
| :-------- | :------- | :----------------------------------------------------------- |
| *criteria | document | 삭제 할 데이터의 기준 값 (criteria) 입니다. 이 값이 { } 이면 컬렉션의 모든 데이터를 제거합니다. |
| justOne   | boolean  | 선택적(Optional) 매개변수이며 이 값이 true 면 1개 의 다큐먼트만 제거합니다. 이 매개변수가 생략되 |

```bash
# 조건에 맞는 값 삭제
db.books.remove({"name":"Book1"})
```



## Document 조회

| Parameter

| parameter  | Type     | 설명            |
| :--------- | :------- | :-------------- |
| query      | document | SQL의 where 문  |
| projection | document | SQL의 Select 문 |

### 예쁘게 조회

```bash
db.articles.find().pretty()
```

### 일치하는 값

```bash
db.articles.find({"writer": "Velopert"}).pretty()
```


### 비교(Comparison) 연산자

| operator | 설명                                                   |
| :------- | :----------------------------------------------------- |
| $eq      | (equals) 주어진 값과 일치하는 값                       |
| $gt      | (greater than) 주어진 값보다 큰 값                     |
| $gte     | (greather than or equals) 주어진 값보다 크거나 같은 값 |
| $lt      | (less than) 주어진 값보다 작은 값                      |
| $lte     | (less than or equals) 주어진 값보다 작거나 같은 값     |
| $ne      | (not equal) 주어진 값과 일치하지 않는 값               |
| $in      | 주어진 배열 안에 속하는 값                             |
| $nin     | 주어빈 배열 안에 속하지 않는                           |


### 특정 조건

- likes 값이 30 이하인 Document 조회

```bash
db.articles.find( { “likes”: { $lte: 30 } } ).pretty()
```

- likes 값이 10보다 크고 30보다 작은 Document 조회

```bash 
db.articles.find( { “likes”: { $gt: 10, $lt: 30 } } ).pretty()
```

- writer 값이 배열 [“Alpha”, “Bravo”] 안에 속하는 값인 Document 조회

```bash
db.articles.find( { “writer”: { $in: [ “Alpha”, “Bravo” ] } } ).pretty()
```

### 논리 연산자

| operator | 설명 |
| :------- | :--- |
| $or      |      |
| $and     |      |
| $not     |      |
| $nor     |      |

- 논리 연산자 예시

```bash
db.articles.find({ $or: [ { “title”: “article01” }, { “writer”: “Alpha” } ] })
```

### 정규 표현식도 가능

| option | 설명                                                        |
| :----- | :---------------------------------------------------------- |
| i      | 대소문자 무시                                               |
| m      | 정규식에서 anchor(^) 를 사용 할 때 값에 \n 이 있다면 무력화 |
| x      | 정규식 안에있는 whitespace를 모두 무시                      |
| s      | dot (.) 사용 할 떄 \n 을 포함해서 매치                      |

- 예시

```bash
db.articles.find( { “title” : /article0[1-2]/ } )
```

### where 연산자

구체적인 연산이 필요할 때 사용하는 것 같음.

- 예시

```bash
db.articles.find( { $where: “this.comments.length == 0” } )
```

### elemMatch 연산자

중첩 구조 찾을 때 사용. 원문 참고

```bash
# comments 의 name 에 "Charlie" 가 존재하는 경우들
db.articles.find( { “comments”: { $elemMatch: { “name”: “Charlie” } } } )
```

## Projection

find()메소드의 두 번째 매개 변수. Select 쿼리를 의미한다.

```bash
db.articles.find( { } , { “_id”: false, “title”: true, “content”: true } )
```

몇가지 더 있지만, 익숙해지고 나서 출처 링크를 통해 더 공부하면 될 듯 하다.

[출처](https://velopert.com/)