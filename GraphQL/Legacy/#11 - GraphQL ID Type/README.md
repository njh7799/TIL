더미 데이터 베이스에 들어있는 id 는 string이다.

```js
var books = [
    { name: 'Name of the Wind', genre: 'Fantasy', id: '1' },
    { name: 'The Final Empire', genre: 'Fantasy', id: '2' },
    { name: 'The Long Earth', genre: 'Sci-Fi', id: '3' },
];
```

그런데 ID 타입으로 ID를 사용할 경우 어떻게 검색이 가능할까?

```js
const BookType = new GraphQLObjectType({
    name: 'Book',
    fields: ( ) => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        genre: { type: GraphQLString }
    })
});
```

답:

```js
{
  book(id:1) {
    id
    name
    genre
  }
}
```

이와 같이 입력하여도, reslove 내부에 넘어올 때는 string의 형태로 바뀌어서 넘어온다. 따라서 정수로 입력해도 무방