
# init 을 이용하여 기본 설정 하기
```
./node_modules/.bin/eslint --init
```

# 직접 설정하기

## eslint 설치  [link]( https://www.npmjs.com/package/eslint )

```bash
npm install eslint --save-dev
```



## prettier 설치

```bash
npm install prettier --save-dev
```



## prettier config 파일설치 [link](https://prettier.io/docs/en/integrating-with-linters.html)

### Disable formatting rules

 [`eslint-config-prettier`](https://github.com/prettier/eslint-config-prettier) 는 eslint가 Prettier과의 충돌 되는 부분을 비활성화해주는 config이다. 

```bash
npm install --save-dev eslint-config-prettier
```


`.eslintrc.json`
```js
{
  "extends": ["prettier"] // extends 배열의 가장 마지막에 넣는다.
}
```

### Use ESLint to run Prettier

 [`eslint-plugin-prettier`](https://github.com/prettier/eslint-plugin-prettier)는 Prettier의 규칙을 eslint에 적용시킬 수 있게끔 해주는 plugin이다.

```bash
npm install --save-dev eslint-plugin-prettier
```

```js
// .eslintrc.json
{
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": "error"
  }
}
```

  참고로 prettierrc 파일 설정을 끝내고 나면 `"prettier/prettier"` 설정 뒤에 `.prettierrc` 의 설정이 붙어서 적용된다.  예를 들자면, `.prettierrc` 파일이  `{"singleQuote": true, "parser": "flow"}` 라면  `"prettier/prettier": "error"` 는 `"prettier/prettier": ["error", {"singleQuote": true, "parser": "flow"}]`가 되는 것이다.



## Prettier 확장팩 설정

아래와 같이 수정한다.

`settings.json`

```json
{
    ...
    "editor.formatOnSave": true,
    "eslint.autoFixOnSave": true
}
```



## 중간 정리

`.eslintrc`

```js
module.exports = {
    "extends": ["prettier"],
    "plugins": ["prettier"],
    "rules": {
        "prettier/prettier": "error"
    }
};
```

`.prettierrc`

```js
{
    
}
```

`settings.json`

```js
{
    ...
    "editor.formatOnSave": true,
    "eslint.autoFixOnSave": true
}
```

자 이제 airbnb 규칙을 적용해 보자.

## airbnb 규칙 적용

```bash
npm install eslint-plugin-import eslint-config-airbnb-base --save-dev
```

참고로 `eslint-config-airbnb-base` 는 `eslint-plugin-import ` 가 없으면 동작하지 않기 때문에,  `eslint-plugin-import `  를 먼저 설치해주어야 한다.

`.eslintrc.js`

```js
module.exports = {
    "extends": ["airbnb-base", "prettier"], // 이 부분이 추가 되었다.
    "plugins": ["prettier"],
    "rules": {
        "prettier/prettier": "error"
    }
};
```



## 추가 규칙 적용

이제 기본적인 세팅이 끝났다. 나머지는 필자가 현재 참여하고 있는 프로젝트의 설정 파일을 첨부하겠다.

`.eslintrc`

```js
module.exports = {
    "parserOptions": {
        "ecmaVersion": 9
    },
    "extends": ["airbnb-base", "prettier"],
    "env": {
        "browser": true,
        "node": true,
    },
    "plugins": ['import', "prettier"],
    "rules": {
        "prettier/prettier": "error"
    }
};
```

`.prettierrc`

```js
{  
  "singleQuote": true, // " " 대신 ' ' 를 사용
  "semi": true, // 문장 끝에는 ; 를 붙여줌
  "useTabs": false, // 탭을 누르면 tab이 안되고 스페이스 여러 칸이 들어감
  "tabWidth": 2, // 탭 간격을 스페이스 2칸으로 함
  "trailingComma": "all", // 객체의 마지막 요소 뒤에 , 를 붙여줌
  "printWidth": 80 // 한 줄의 길이가 80을 넘지 않도록 함
}
```





## 최종 정리

앞 부분을 공부하기 귀찮을 수 있으니, 위의 과정을 한 번에 모아 보겠다.

1. 설치

```bash
npm install eslint prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-import eslint-config-airbnb-base --save-dev
```

`.eslintrc`

```js
module.exports = {
    "parserOptions": {
        "ecmaVersion": 9
    },
    "extends": ["airbnb-base", "prettier"],
    "env": {
        "browser": true,
        "node": true,
    },
    "plugins": ['import', "prettier"],
    "rules": {
        "prettier/prettier": "error"
    }
};
```

`.prettier`

```js
{  
  "singleQuote": true,
  "semi": true,
  "useTabs": false,
  "tabWidth": 2,
  "trailingComma": "all",
  "printWidth": 80
}
```

`settings.json`

```js
{
    ...
    "editor.formatOnSave": true,
    "eslint.autoFixOnSave": true
}    
```





## React의 경우

**react**

1. npm 패키지 설치

```bash
npm install --save-dev eslint-config-airbnb eslint eslint-plugin-jsx-a11y eslint-plugin-import eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier prettier
```

2. `eslintrc.js` 설정파일 추가

```js
module.exports = {
  extends: ['react-app', 'airbnb', 'airbnb/hooks', 'prettier'],
  plugins: ['react', 'jsx-a11y', 'import', 'prettier'],
  rules: {
    'react/jsx-one-expression-per-line': 0,
    'react/jsx-filename-extension': 0,
	'prettier/prettier': 'error',
  },
};
```
3. `.prettier`

```js
{  
  "singleQuote": true,
  "semi": true,
  "useTabs": false,
  "tabWidth": 2,
  "trailingComma": "all",
  "printWidth": 80
}
```
# Error

Cannot find module 'eslint-plugin-import'

![image](https://user-images.githubusercontent.com/40619551/68586254-9d2a0080-04c7-11ea-8e2f-2a69fe00d1da.png)

이 에러는 VS Code를 루트로 열지 않아서 생기는 에러이다.

eslint를 사용할 때에는 항상 `.eslintrc.js` 파일이 있는 디렉토리를 열어야 한다.

예시 1.

![image](https://user-images.githubusercontent.com/40619551/68586545-30fbcc80-04c8-11ea-9b02-334ae4306ca0.png)

 이렇게 열면 위의 에러가 뜬다.

예시 2.

![image](https://user-images.githubusercontent.com/40619551/68586601-525cb880-04c8-11ea-9b7d-abd9abd3b88f.png)

이렇게 열어야 에러를 방지할 수 있다.