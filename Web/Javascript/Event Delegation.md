

# Event Delegation.md

부모 태그에게 이벤트를 주면 자식 태그들에게도 이벤트가 위임 되는 규칙

```html
/*HTML*/
<body>
	<div class="red">
		<div class="blue">
			<div class="green">

			</div>
		</div>
	</div>
</body>
```

```css
/*CSS*/
.red{
  width:300px;
  height:300px;
  background-color:red
}
.blue{
  width:200px;
  height:200px;
  background-color:blue;
}
.green{
  width:100px;
  height:100px;
  background-color:green;
}
```

```js
/*JS*/
document.querySelector('body').addEventListener('click', (event)=>console.log(event.target))
```

아무 것도 없는 빈 화면(body) 를 클릭하면, target이 body가 된다.

마찬가지로, 붉은 화면을 클릭하면 target이 .red가 되며, 파란 화면, 초록 화면 또한 마찬가지이다.

여러 태그가 겹치는 부분에서는 최상위(가장 자식) 태그가 event의 target이 되는 것이다.

![s](https://user-images.githubusercontent.com/40619551/65928878-8f01b280-e43a-11e9-815a-2c2275af43e8.gif)

이벤트 위임 방식을 사용하면서, 특정 태그를 클릭했을 경우에만 동작하게끔 하고 싶으면 js 코드를 아래와 같이 수정하면 된다.



```js
/*JS*/
const blue = document.querySelector('.blue')
document.querySelector('body').addEventListener('click',
                                                (event)=>{
                                                    if(blue!==event.target) return;
                                                    console.log(event.target)
                                                })
```



참고: [ref](https://joshua1988.github.io/web-development/javascript/event-propagation-delegation/)