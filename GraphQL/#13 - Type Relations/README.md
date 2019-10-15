# Type Relations

books가 author 정보를 가지고 있어야 한다.

```js
// dummy data
var books = [
    { name: 'Name of the Wind', genre: 'Fantasy', id: '1', authorId: '1' },
    { name: 'The Final Empire', genre: 'Fantasy', id: '2', authorId: '2' },
    { name: 'The Long Earth', genre: 'Sci-Fi', id: '3', authorId: '3' },
];

var authors = [
    { name: 'Patrick Rothfuss', age: 44, id: '1' },
    { name: 'Brandon Sanderson', age: 42, id: '2' },
    { name: 'Terry Pratchett', age: 66, id: '3' }
];
```

와 신박하다
```js
const BookType = new GraphQLObjectType({
    name: 'Book',
    fields: ( ) => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        genre: { type: GraphQLString },
        author: {
            type: AuthorType,
            resolve(parent, args){
                console.log(parent); // 부모 객체 즉 { name: 'Name of the Wind', genre: ..} 이 친구가 나온다.
                return _.find(authors, { id: parent.authorId });
            }
        } 
    })
});
```

book(id:1) 을 하면 먼저 book 객체를 찾고 그 다음 author 객체를 찾아 꽂아 놓는 식.