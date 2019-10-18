쿼리도 variables 설정 가능하다.

```js
const getBooksQuery = gql`
    query($id:String){
        book(id:$id) {
            name
            id
            genre
            author{
                id
                name
                age
                books{
                    name
                    id
                }
            }
        }
    }
`;
```

