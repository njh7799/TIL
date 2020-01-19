# 선택

우선 두 가지 선택지가 있습니다. `tslint-prettier` 를 사용하는 방법과 그렇지 않은 방법. 저는 사용하지 않는 방법으로 하겠습니다.

# VSCode 확장 프로그램 설치

1. TSLint
2. Prettier

# 필요 모듈 설치

```
yarn add -D tslint prettier tslint-config-prettier tslint-plugin-prettier
```

- tslint: lint 를 적용시키기 위한 모듈
- prettier:prettier 를 적용시키기 위한 모듈
- tslint-config-prettier: tslint 에서 prettier 와 충돌하는 규칙을 정지 시키는 모듈
- tslint-plugin-prettier: tslint 에게 prettier 의 설정을 주입시키는 모듈

# 환경 파일 설정

프로젝트의 루트 디렉토리에 다음 두 파일을 생성

```
// tslint.json
{
   "extends": ["tslint-plugin-prettier", "tslint-config-prettier"],
   "rules": {
     "prettier": true
   }
 }// .prettierrc
{
   "trailingComma": "all",
   "tabWidth": 2,
   "semi": true,
   "singleQuote": true
}
```

# 레퍼런스

Prettier 공식: https://prettier.io/docs/en/integrating-with-linters.html

Pravusid 님: https://pravusid.kr/javascript/2019/03/10/eslint-prettier.html