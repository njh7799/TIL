
## init 을 이용하여 기본 설정 하기
```
./node_modules/.bin/eslint --init
```

## 직접 설정하기

### eslint

1. 설치

```bash
npx install-peerdeps --dev eslint-config-airbnb-base
```

2. .eslintrc.js 파일 추가

```js
module.exports = {
    "parserOptions": {
        "ecmaVersion": 9
    },
    "extends": ["airbnb-base"], // airbnb-base 설정을 사용한다.
    "env": {
        "browser": true, // 브라우저 환경
        "node": true, // 노드 환경
    },
    "plugins": ['import'], // require 대신 import를 사용
    "rules": {
        // 적용 규칙
    }
};
```

이제 여기게 prettier를 얹어 보겠다.

### eslint-config-prettier

 [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier)은 prettier 에서 관리 해 줄 수 있는 코드 스타일의 ESLint 규칙을 비활성화시켜 준다. 이것을 사용하게 된다면 ESLint 는 자바스크립트 문법 관련된 것들만 관리하게 되고, 코드스타일 관련 작업은 prettier 가 담당하게 된다. 예를 들어 ` Expected linebreaks to be 'LF' but found 'CRLF'.eslint(linebreak-style) ` 이런 경고나 ` Missing semicolon.eslint(semi) ` 이런 경고가 더 이상 나타나지 않게 된다.

1. 설치

```bash
npm install eslint-config-prettier
```

2.  .prettierrc 파일  설정

```js
{  
  "singleQuote": true, // " " 대신 ' ' 를 기본으로 사용한다.
  "semi": true, // 문장의 끝에는 ; 를 붙여준다.
  "useTabs": false, // 기본 탭 들여쓰기를 비활성화 한다.
  "tabWidth": 2, // 탭을 스페이스 두 칸으로 한다.
  "trailingComma": "all", // 객체나 배열의 마지막 요소에 , 를 붙인다.
  "printWidth": 80 // 한 줄에 80 길이만큼만 둔다.
}
```

3. .eslintrc.js 파일 수정

```js
module.exports = {
    "parserOptions": {
        "ecmaVersion": 9
    },
    "extends": ["airbnb-base", "prettier"], // 이거 하나만 바뀐 것이다.
    "env": {
        "browser": true,
        "node": true,
    },
    "plugins": ['import'],
    "rules": {
    }
};
```





## Error

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