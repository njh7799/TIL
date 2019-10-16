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

강의: [GraphQL Tutorial]( https://www.youtube.com/playlist?list=PL4cUxeGkcC9iK6Qhn-QLcXCXPQUov1U7f )



## Server Side Usage

```js
// app.js

const express = require('express');
const graphqlHTTP = require('express-graphql');
const schema = require('./schema/schema');
const mongoose = require('mongoose');
const cors = require('cors')
const app = express();

// 외부의 모든 접근을 허용한다.
app.use(cors())

// 몽고DB를 연결한다.
mongoose.connect('mongodb://localhost/gql')
mongoose.connection.once('open', () => {
    console.log('conneted to database');
});

// bind express with graphql
app.use('/graphql', graphqlHTTP({
    schema,
    graphiql: true
}));

// 4000 포트를 연다.
app.listen(4000, () => {
    console.log('now listening for requests on port 4000');
});

```

```js
// schema/schema.js

const graphql = require('graphql');
const Book = require('../models/book');
const Author = require('../models/Author');
const _ = require('lodash');

const {
    GraphQLObjectType,
    GraphQLString,
    GraphQLSchema,
    GraphQLID,
    GraphQLInt,
    GraphQLList,
    GraphQLNonNull
} = graphql;

// Book의 데이터 타입 정의
const BookType = new GraphQLObjectType({
    name: 'Book',
    fields: () => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        genre: { type: GraphQLString },
        author: {
            type: AuthorType,
            resolve(parent, args) { // parent는 검색된 book 객체를 의미한다.
                return Author.findById(parent.authorId);
            }
        }
    })
});

// Author의 데이터 타입 정의
const AuthorType = new GraphQLObjectType({
    name: 'Author',
    fields: () => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        age: { type: GraphQLInt },
        books: {
            type: new GraphQLList(BookType),
            resolve(parent, args) {
                return Book.find({ authorId: parent.id });
            }
        }
    })
});

// Root Query 명세
// 외부에서 graphQL에 접근하는 entry 포인트 들을 정의힌다.
const RootQuery = new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
        book: { // 이름
            type: BookType, // 타입
            args: { id: { type: GraphQLID } }, // arguments
            resolve(parent, args) { // 반환될 값. args는 입력된 arguments를 의미한다.
                return Book.findById(args.id);
            }
        },
        author: {
            type: AuthorType,
            args: { id: { type: GraphQLID } },
            resolve(parent, args) {
                return Author.findById(args.id);
            }
        },
        books: {
            type: new GraphQLList(BookType),
            resolve(parent, args) {
                return Book.find({});
            }
        },
        authors: {
            type: new GraphQLList(AuthorType),
            resolve(parent, args) {
                return Author.find({});
            }
        }
    }
});

// Mutation 명세
const Mutation = new GraphQLObjectType({
    name: 'Mutation',
    fields: {
        addAuthor: {
            type: AuthorType,
            args: {
                name: { type: GraphQLString },
                age: { type: GraphQLInt }
            },
            resolve(parent, args) {
                let author = new Author({
                    name: args.name,
                    age: args.age
                });
                return author.save();
            }
        },
        addBook: {
            type: BookType,
            args: {
                name: { type: new GraphQLNonNull(GraphQLString) },
                genre: { type: new GraphQLNonNull(GraphQLString) },
                authorId: { type: new GraphQLNonNull(GraphQLID) }
            },
            resolve(parent, args) {
                let book = new Book({
                    name: args.name,
                    genre: args.genre,
                    authorId: args.authorId
                });
                return book.save();
            }
        }
    }
});

module.exports = new GraphQLSchema({
    query: RootQuery,
    mutation: Mutation
});

```

