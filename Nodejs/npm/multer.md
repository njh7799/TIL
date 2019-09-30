# [multer](https://wayhome25.github.io/nodejs/2017/02/21/nodejs-15-file-upload/)

## install

```bash
npm install --save multer
```

## usage

```js
// basic setting
var multer = require('multer'); // multer모듈 적용 (for 파일업로드)
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  }
  filename: function (req, file, cb) {
    cb(null, file.originalname) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
})
var upload = multer({ storage: storage })
```

```jade
# template
doctype html
html
  head
    meta(charset='utf-8')
  body
    form(action='upload' method='post' enctype="multipart/form-data")
      input(type='file' name='userfile')
      input(type='submit')
```

```js
// router
app.get('/upload', function(req, res){
  res.render('upload');
});

app.post('/upload', upload.single('userfile'), function(req, res){
  res.send('Uploaded! : '+req.file); // object를 리턴함
  console.log(req.file); // 콘솔(터미널)을 통해서 req.file Object 내용 확인 가능.
});
```

