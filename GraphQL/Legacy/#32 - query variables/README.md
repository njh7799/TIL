# query variables

변수는 query variable을 통해 mutation에 전달할 수 있다.

```js
const addBookMutation = gql`
    mutation($name:String!, $genre:String!, $authorId: ID!){
        addBook(name:$name, ganre:$genre, authorId:$authorId){
            name
            id
        }
    }
`
```

