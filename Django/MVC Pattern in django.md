# MVC Pattern in django

MVC 패턴이 무엇인가에 대해서는 언급하지 않고 넘어간다.

```
app
├─ view.py
├─ controller.py
├─ model.py
└─ url.py
```

위와 같이 디렉토리를 구성하는 것이 이상적이라 생각한다.

## view.py

- view 는 단순히 http request를 받아서 적당한 http response를 돌려주는 역할만 수행해야 한다. 즉, model 과 직접 소통하여 작업을 하는 단계가 있으면 안된다.
- view는 request를 받아서 body를 적당히 쪼갠 후, 이를 controller에 넘긴다. 그리고 controller 로 부터 리턴값을 받아서 이를 통해 reponse를 구성하는 구조가 되어야 한다.

## controller.py

- controller는 view로 부터 받은 데이터를 바탕으로 model에 접근하여 적합당 연산을 수행하고, 결과값을 view에게 return해준다.

## model.py

- controller가 요청하는 데이터를 조회해준다.

## 예시

> **시간표 작성 어플에서 강의를 넣는 경우**
>
> view 가 http request를 받아서 넣으려는 강의에 대한 정보를 추출하여 controller에게 넘긴다.
>
> controller는  model에 접근하여 view로 부터 받은  강의의 시간표가 현재 만들어진 시간표와 겹치는 지 확인한다. 시간표가 겹치지 않을 경우, 강의를 추가하고(model을 업데이트 함) 강의가 정상적으로 추가되었음을 view에게 알린다.(대충 true를 return) 시간표가 겹칠 경우, 강의를 추가하지 않고 강의 시간이 겹침을 view에게 알린다.(대충 false를 return)
>
> model은 controller에게 조회 당하는 역할정도? model이 스스로 나서서 무언가를 하는 것은 아니다.