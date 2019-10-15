# mongoose

## Installing

```bash
npm install mongoose
```

## Connecting to MongoDB

```js
var mongoose    = require('mongoose');

mongoose.connection.on('error', console.error);
mongoose.connection.once('open', function(){
    console.log("Connected to mongod server");
});

mongoose.connect('mongodb://localhost/my_database');
```

## Defining Schema

```js
const Schema = mongoose.Schema;
const ObjectId = Schema.ObjectId;
 
const BlogPostSchema = new Schema({
  author: ObjectId,
  title: String,
  body: String,
  date: Date
});
```

## Create Model with Schema

```js
var BlogPost = mongoose.model('blogpost', BlogPostSchema);
```

## Create row

```js
var blogpost = new BlogPost({
    name: "NodeJS Tutorial",
    author: "velopert"
});
blogpost.save(function(err, book){
    if(err) return console.error(err);
    console.dir(blogpost);
});
```

## Modulation

```bash
models
	├─ book.js
	└─ author.js
```

```js
// author.js
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const authorSchema = new Schema({
    name: String,
    age: Number
});

module.exports = mongoose.model('Author', authorSchema);

```

