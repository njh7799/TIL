

# [타입스크립트에서의 jest](https://www.npmjs.com/package/ts-jest)

## 설치

```shell
yarn add -D jest ts-jest @types/jest
yarn add -D @babel/preset-env @babel/preset-typescript babel-plugin-transform-class-properties
```

## 바벨 설정
```shell
{
  "presets": ["@babel/preset-typescript", "@babel/preset-env"],
  "plugins": ["transform-class-properties"]
}
```


## 예시

```js
import convertToTwoDigits from './convertToTwoDigits';

describe('convertTo', () => {
  it('should convert single-digit string to two-digit string', () => {
    const input = '1';
    const output = '01';
    expect(convertToTwoDigits(input)).toEqual(output);
  });
  it('should convert two-digit string to two-digit string', () => {
    const input = '02';
    const output = '02';
    expect(convertToTwoDigits(input)).toEqual(output);
  });
  it('should convert single-digit number to two-digit string', () => {
    const input = 3;
    const output = '03';
    expect(convertToTwoDigits(input)).toEqual(output);
  });
  it('should convert two-digit number to two-digit string', () => {
    const input = 14;
    const output = '14';
    expect(convertToTwoDigits(input)).toEqual(output);
  });
});

```

