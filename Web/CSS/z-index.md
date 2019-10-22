# z-index

### position을 반드시 설정해주어야 한다.

position이 지정된 컴포넌트끼리만 z-index로 의한 정렬이 된다. 

```html
<div class="backdrop"></div>
<div class="n"></div>
```

```css
.backdrop{
  position:fixed;
  width:100%;
  height:100%;
  background-color:blue;
  z-index:50;
}
.n{
  position:relative;
  width:100px;
  height:100px;
  background-color:black;
  z-index:100;
}
```

