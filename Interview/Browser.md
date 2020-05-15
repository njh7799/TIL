## html 파싱

html 파싱 중 parsing blocking 요소를 만나면 만나기 직전까지를 먼저 화면에 렌더링 한다. 이 때 Hi 부분을 다시 그리는 것을까 Bye만 그리는 것일까?

```html
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style.css" />
  </head>
  <body>
    <div>Hi</div>
    <script type="text/javascript" src="./script.js"></script>
    <div>Bye</div>
  </body>
</html>

```

실험 결과 Bye만 새롭게 그리는 것으로 확인 되었다.