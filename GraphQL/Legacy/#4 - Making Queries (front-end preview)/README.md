# Making Queries (front-end preview)

## 프론트에서 요청 보내기 예시

우선 프론트에서 요청을 보내기 위해 GraphiQL이라는 것을 사용한다.

```
{
	books{
		name
		genre
		id
	}
}
```

위와 같이 요청을 보내면, SELECT name, genre, id FROM books 와 같이 동작한다.

```
{
	books{
		name
		genre
		id
		author{
			name
			author
		}
	}
}
```

위와 같이 연관된 정보를 가져오게끔 하는 것 또한 가능하다.

**위 문법은 JS가 아니다** 쿼리 언어이다.

