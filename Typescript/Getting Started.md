https://typescript-kr.github.io/

# 타입 설정에 관하여

타입 설정을 하다가 재밌는 문제를 발견했다. 아래와 같은 상황에서 에러가 발생하지 않는 것이다.

결론부터 얘기하자면, typescript 는 `컴파일 단계`에서만 타입을 확인하고, `런타임` 에서는 확인하지 않는 것 같다. 따라서 아래의 첫번 째 경우에서는 에러가 날 수 없는 것이다.



## 1. input 의 type 이 any 인 경우

<img width="217" alt="스크린샷 2020-01-08 오후 11 20 02" src="https://user-images.githubusercontent.com/40619551/71988164-bd313280-3272-11ea-8623-ff45b3732567.png">
`input` 의 타입이 `any` 이기 때문에 컴파일 단계에서 위 코드는 어떠한 오류도 날 수 없다.

## 2. input 의 type 이 number 인 경우

<img width="242" alt="스크린샷 2020-01-08 오후 11 51 47" src="https://user-images.githubusercontent.com/40619551/71988165-bd313280-3272-11ea-8914-61d5955f24aa.png">
 이 경우 `input` 이 `number` 타입으로 정의가 되어 있는데 `string` 타입을 입력하였으므로 에러가 발생한다.

## 3. input 의 type 이 string 인 경우 
<img width="242" alt="스크린샷 2020-01-08 오후 11 54 24" src="https://user-images.githubusercontent.com/40619551/71988455-4c3e4a80-3273-11ea-81f9-a15489873b13.png">
마지막 경우를 보면, 입력이 `input` 이 `string` 이기 때문에 입력까지는 정상적으로 들어간다. 하지만 `type` 이 `number`인 a 에게 type이 `string` 인 `input`을 대입하려 하였기 때문에 에러가 발생한다.



## 제너릭

https://hyunseob.github.io/2017/01/14/typescript-generic/