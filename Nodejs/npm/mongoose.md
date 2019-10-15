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
blogpost.save(function(err, book){ // blogpost.save() 메소드는 저장된 객체를 반환한다.
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

---

## CRUD

 출처:  https://velopert.com/594 

##  Create ( POST /api/books )

```js
app.post('/api/books', function(req, res){
    var book = new Book();
    book.title = req.body.name;
    book.author = req.body.author;
    book.published_date = new Date(req.body.published_date);

    book.save(function(err){
        if(err){
            console.error(err);
            res.json({result: 0});
            return;
        }

        res.json({result: 1});

    });
});
```

## RETRIEVE ( GET /api/books )

```js
// GET ALL BOOKS
app.get('/api/books', function(req,res){
    Book.find(function(err, books){
        if(err) return res.status(500).send({error: 'database failure'});
        res.json(books);
    })
});
```



##  RETRIEVE ( GET /api/books/:book_id )

```js
// GET SINGLE BOOK
app.get('/api/books/:book_id', function(req, res){
    Book.findOne({_id: req.params.book_id}, function(err, book){
        if(err) return res.status(500).json({error: err});
        if(!book) return res.status(404).json({error: 'book not found'});
        res.json(book);
    })
});
```



##  RETRIEVE ( GET /api/books/author/:author )
```js
// GET BOOKS BY AUTHOR
app.get('/api/books/author/:author', function(req, res){
    Book.find({author: req.params.author}, {_id: 0, title: 1, published_date: 1},  function(err, books){
        if(err) return res.status(500).json({error: err});
        if(books.length === 0) return res.status(404).json({error: 'book not found'});
        res.json(books);
    })
});
```



## UPDATE ( PUT /api/books/:book_id )

```js
// UPDATE THE BOOK
app.put('/api/books/:book_id', function(req, res){
    Book.findById(req.params.book_id, function(err, book){
        if(err) return res.status(500).json({ error: 'database failure' });
        if(!book) return res.status(404).json({ error: 'book not found' });

        if(req.body.title) book.title = req.body.title;
        if(req.body.author) book.author = req.body.author;
        if(req.body.published_date) book.published_date = req.body.published_date;

        book.save(function(err){
            if(err) res.status(500).json({error: 'failed to update'});
            res.json({message: 'book updated'});
        });

    });

});
```

velopert 에서 다 그래로 긁어온 코드이기 때문에 동작 원리 등은 원본 출처에서 확인 바란다.

---

추가) 몽고디비는 id를 직접 만들어 주기 때문에 별로도 설정해줄 필요가 없다!