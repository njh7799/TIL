여러개의 쿼리를 하나의 컴포넌트에서 처리할 경우.

특히, mutation 이 있을 경우, 어떻게 mutation을 발생시키는가?

```js
// queries.js

import { gql } from 'apollo-boost';

const getAuthorsQuery = gql`
    {
        authors {
            name
            id
        }
    }
`;

const getBooksQuery = gql`
    {
        books {
            name
            id
        }
    }
`;

const addBookMutation = gql`
    mutation{
        book(name:"", ganre:"", authorId:""){
            name
            id
        }
    }
`


export { getAuthorsQuery, getBooksQuery, addBookMutation }
```

```js
// AddBook.js

import { graphql, compose } from 'react-apollo';

import { getAuthorsQuery, addBookMutation } from '../queries/queries'
...
submitForm = e=> {
        e.preventDefault();
        this.props.addBookMutation()
    }
...
export default compose(
    graphql(getAuthorsQuery, {name:"getAuthorsQuery"}),
    graphql(addBookMutation,{name:"addBookMutation"})
)(AddBook);
```

