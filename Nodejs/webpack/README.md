클라이언트에서 별 설정을 하지 않고  ts 를 적용하고 웹팩을 돌리면 아래와 같은 에러가 발생한다.

![image](https://user-images.githubusercontent.com/40619551/75424646-6e576d80-5984-11ea-8efc-23b70e0e21af.png)

import 구문에서 해당 에러가 발생한다.

```js
import convertToTwoDigits from '../utils/convertToTwoDigits'
```

에러가 발하는 의미는 아래와 같이 바꾸어라는 뜻이다.

```js
import convertToTwoDigits from '../utils/convertToTwoDigits.js'
```

하지만 나는 타입스크립트를 사용하고, 촌스럽게 확장자명을 붙이고 싶지 않다. 여기서는 아래과 같이 웹펙 설정에 `libraryTarget` 을 추가해주면 간단히 해결된다.

```  js
output: {
  filename: '[name].js',
  path: __dirname + '/public/build',
  libraryTarget: 'umd', // 이 부분
},
```

