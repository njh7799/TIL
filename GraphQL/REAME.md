# Introduction to GraphQL

## graphQL 이란?

Client와 Server 간의 데이터 통신을 맡는 쿼리 언어이다.

본 강의에서는 React와 Node를 사용할 것이다.

flexible하고 efficient한 특징을 가진다.

### Resftul한 방식

```
domain.com/books/:id
domain.com/author/:id
```

GraphQL 방식

```
{
	book(id:123){
		title
		genre
		reviews
		author{
			name
			bio
			books{
				name
			}
		}
	}
}
```

쿼리를 한번만으로도 원하는 값을 얻을 수 있다.

또한 아래와 같이 받고 싶은 데이터만 받을 수도 있다.

```
{
	book(id:123){
		title
		author{
			name
			books{
				name
			}
		}
	}
}

```

