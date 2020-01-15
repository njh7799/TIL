# Event Bubbling Capturing Delegation

우선 Event Bubbling & Capturing과 Event Delegation 은 그 의미가 완전히 다르다는 사실을 알고 가자.

## Event Delegation

 상위 요소에 이벤트를 붙였을 때, 하위 요소들에게도 이벤트가 적용되는 것을 의미한다.

```html
<div id="yellow">
	<div id="green">
		<div id="blue">
		</div>
	</div>
</div>
```

```css
#yellow{
  width:300px;
  height:300px;
  background-color:yellow;
}

#green{
  width:200px;
  height:200px;
  background-color:green;
}

#blue{
  width:100px;
  height:100px;
  background-color:blue;
}
```

```js
document.getElementById("yellow").addEventListener("click", ()=>{console.log("yellow")});
document.getElementById("green").addEventListener("click", ()=>{console.log("green")});
document.getElementById("blue").addEventListener("click", ()=>{console.log("blue")})
```



위의 예시에서 `id="one"` 인 요소에만 이벤트를 붙여도 하위 요소 모두 적용 된다.

참고로 `addEventlistener` 가 아니라 그냥 `onclick=func()` 의 방식으로 붙여도 위임이 적용 된다.

## Event Bubbling Capturing

중첩된 요소가 있을 때, 중첩된 부분에 이벤트가 발생할 경우, 모든 중첩된 요소에 대하여 이벤트가 순차적으로 발생하는 것을 의미한다.

위의 예시에서 모든 div에 `onclick=(e)=>console.log(e.currentTarget)`을 붙였다고 가정해보자. 이 때 겹치는 부분을 클릭하면 one, two, three 로그가 다 찍힐 것이다. Bubbling 과 Capturing은 그 순서에 대한 것일뿐이다.