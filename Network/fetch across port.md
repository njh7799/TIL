# fetch across port

![image](https://user-images.githubusercontent.com/40619551/66368145-19fe2200-e9d2-11e9-9bd3-49f4d2a06f25.png)


### express 해결 방법
```js
router.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://127.0.0.1:3000');
    next();
});
```

