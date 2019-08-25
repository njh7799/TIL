<h1>TDD -jest</h1>



<h2>package.json</h2>

```javascript
"scripts": {
    "test": "jest --watchAll"
}
```



<h2>App.test.js</h2>

```javascript
describe('test', ()=>{
	it('should output hello', ()=>{
        expect(hello()).toEqual('hello');
    })
    it('should output hellow', ()=>{
        expect(hellow()).toEqual('hellow');
    })
})
```

