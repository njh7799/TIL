이렇게 쿼리 변수를 넘겨줄 수 있다.

```js
export default graphql(getBookQuery,{
    options:(props)=>{
        return{
            variables:{
                id:props.bookId
            }
        }
    }
})(BookDetails);

```

