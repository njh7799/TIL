# [axios]( https://www.npmjs.com/package/axios )

## Installing

```bash
npm install axios 
```

## Setting a Default Global Configuration

```js
// 예시

axios.defaults.baseURL = 'https://jsonplaceholder.typicode.com'
axios.defaults.headers.common['Authorization'] = 'AUTH TOKEN'
axios.defaults.headers.post['Content-Type'] = 'application/json'
```

