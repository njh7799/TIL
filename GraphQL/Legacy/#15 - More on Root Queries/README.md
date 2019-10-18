데이터 전체를 가지고 오고 싶을 경우, 루트 쿼리의 필드를 추가해주면 된다.

```js
books: {
    type: new GraphQLList(BookType),
    resolve(parent, args) {
    return books
    }
}
```

