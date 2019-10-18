스키마 파일은

3가지가 역할을 수행하여야 한다.

1. define type
2. define relationship between types
3. 

```js
const RootQuery = new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
        book: {
            type: BookType,
            args: { id: { type: GraphQLString } },
            resolve(parent, args){
                // code to get data from db / other source
                // 요청이 왔을 때 실제로 데이터를 어떻게 주는지에 대한 로직
            }
         }
    }
});
```

```js
나중에 사용할 때는 이렇게 쓴다
book(id:'123')
```

