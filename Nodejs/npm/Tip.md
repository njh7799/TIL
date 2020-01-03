# CLI 명령어 글로벌로 안하고 쓰는 방버

tsc 등의 CLI 문법을 사용하고 싶을 경우 `yarn add --global typscript`와 같이 글로벌에 설치하면 된다. 하지만 필자는 패키지는 글로벌에 설치하는 것을 매우 싫어하기 때문에, 로컬에서만 사용하는 방법을 알아보자.

1. 설치

```shell
yarn add typescript -D
```

2. script 추가

```json
// package.json
{
  "scripts": {
    "tsc": "tsc"
  },
  "devDependencies": {
    "typescript": "^3.7.4"
  }
}

```

3. tsconfig.json 설정 (typescript를 사용하는 경우에만)

```json
{
  "compilerOptions": {
    "target": "ES5",
    "module": "system",
    "moduleResolution": "node",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": false
  },
  "exclude": ["node_modules", ".npm"]
}
```

4. 실행

```
npm run tsc
```

