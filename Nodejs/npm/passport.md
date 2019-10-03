# passport



## 디렉토리

```
C:.
  app.js
├─models
├─passport
│      index.js
│      localStrategy.js

routes
```

## install

```bash
npm install express-session passport passport-local connect-flash
```

## setting
```js
// passport/index.js

const localSetting = require('./localStrategy');
const passport = require('passport');

// serilaizerUser를 등록해줄 setConfig 메소드 설정
passport.setConfig = () => {
  passport.serializeUser((user, done) => {
    done(null, user); //  user가 session(req.session.passport.user)에 저장됨
  });

  // 메모리에 한번만 저장
  passport.deserializeUser((id, done) => {
    // 매개변수 id는 req.session.passport.user에 저장된 값
    done(null, id); // req.user에 idr값 저장
  });
  localSetting(passport);
};

module.exports = passport;
```

```js
// passport/localStrategy.js

const localStrategy = require('passport-local').Strategy;
const { users } = require('../models')

// passport의 LocalStrategy를 등록해주는 함수 작성
// 이를 passport/index.js 에서 불러와서 사용
module.exports = passport => {
    passport.use(
        new localStrategy(
            { usernameField: 'username', passwordField: 'password' },
            async (username, password, done) => {
                const [rows, fields] = await users.findByUsername(username)
                const userojb = rows[0];
                if (!userojb) done(null, false);
                if (userojb.password != password) done(null, false);
                else done(null, userojb);
            }
        )
    );
};


```


```js
// app.js

/// passport 설정
const session = require('express-session');
const passport = require('./passport');
var flash = require('connect-flash');
app.use(flash());
app.use(
  // 기본적인 세션설정
  session({
    resave: false,
    saveUninitialized: false,
    secret: 'pyh',
    cookie: {
      httpOnly: true,
      secure: false
    }
  })
);
app.use(express.urlencoded({ extended: false })); // 클라이언트의 form값을 req.body에 넣음
app.use(passport.initialize()); // passport 동작
app.use(passport.session()); // passport.deserializeUser 실행
passport.setConfig();
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

