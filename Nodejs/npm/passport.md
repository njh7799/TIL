# passport

https://www.zerocho.com/category/NodeJS/post/57b7101ecfbef617003bf457

## 디렉토리

```
C:.
  app.js
├─models
├─passport.js

routes
```

## install

```bash
npm install express-session passport passport-local connect-flash
```

## setting
```js
// passport.js

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const Users = require('./user');

module.exports = () => {
  passport.serializeUser((user, done) => { // Strategy 성공 시 호출됨
    done(null, user); // 여기의 user가 deserializeUser의 첫 번째 매개변수로 이동
  });

  passport.deserializeUser((user, done) => { // 매개변수 user는 serializeUser의 done의 인자 user를 받은 것
    done(null, user); // 여기의 user가 req.user가 됨
  });

  passport.use(new LocalStrategy({ // local 전략을 세움
    usernameField: 'id',
    passwordField: 'pw',
    session: true, // 세션에 저장 여부
    passReqToCallback: false,
  }, (id, password, done) => {
    Users.findOne({ id: id }, (findError, user) => {
      if (findError) return done(findError); // 서버 에러 처리
      if (!user) return done(null, false, { message: '존재하지 않는 아이디입니다' }); // 임의 에러 처리
      return user.comparePassword(password, (passError, isMatch) => {
        if (isMatch) {
          return done(null, user); // 검증 성공
        }
        return done(null, false, { message: '비밀번호가 틀렸습니다' }); // 임의 에러 처리
      });
    });
  }));
};
```



## 로그인에 적용

```js
// routes/loginRouter.js

var express = require('express');
var router = express.Router();
const passport = require('../passport');
/* GET home page. */
router.get('/', (req, res) => {
  res.render('login');
});


// POST 1번 방식
router.post(
  '/',
  passport.authenticate('local', {
    successRedirect: '/admin',
    failureRedirect: '/login'
  })
);

// POST 2번 방식
router.post('/', passport.authenticate('local', { failureRedirect: '/login' }), (req, res) => {
    res.redirect('/' + req.user.username);
});


module.exports = router;

```

