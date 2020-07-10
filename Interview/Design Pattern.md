# 디자인 패턴

## MVC

- [생활코딩](https://opentutorials.org/course/697/3828)
- [🛠 📐📏 Understanding MVC Architecture with React](https://medium.com/createdd-notes/understanding-mvc-architecture-with-react-6cd38e91fefd)
- [MVC Implemented by React and Causality-Redux](https://medium.com/dailyjs/mvc-implemented-by-react-and-causality-redux-c4125a01e95c)

### Controller

사용자가 접근 한 URL에 따라서 사용자의 요청사항을 파악한 후에 그 요청에 맞는 데이터를 Model에 의뢰하고, 데이터를 View에 반영해서 사용자에게 알려준다. 

### Model

일반적으로 CI의 모델은 데이터베이스 테이블에 대응된다. 이를테면 Topic이라는 테이블은 topic_model이라는 Model을 만든다. 그런데 이 관계가 강제적이지 않기 때문에 규칙을 일관성 있게 정의하는 것이 필요하다.

### View

View는 클라이언트 측 기술인 html/css/javascript들을 모아둔 컨테이너이다. 




## Flux

- [공식](https://haruair.github.io/flux/docs/overview.html#content)

### Actions
Objects with property and data.

### Stores
Contain the application’s state and logic.

### The Dispatcher
Processes registered actions and callbacks.

### Views
Listen to changes from the stores and re-render themselves.



## 3 layer architecture

### Controller Layer

클라이언트가 요청한 URL에 따라서 프로세스를 처리하고 클라이언트에게 response를 보낸다. 이 때 비지니스 로직이 포함되어서는 안된다. Service 를 이용하여 동작한다.

### Service Layer

비지니스 로직을 처리한다. 모델을 이용한다.

### Data Access Layer(Model Layer)

DB에 직접 접근하여 데이터를 가져온다.



### 예시

```js
// controller

route.post('/', 
  validators.userSignup, // this middleware take care of validation
  async (req, res, next) => {
    // The actual responsability of the route layer.
    const userDTO = req.body;

    // Call to service layer.
    // Abstraction on how to access the data layer and the business logic.
    const { user, company } = await UserService.Signup(userDTO);

    // Return a response to client.
    return res.json({ user, company });
  });
```

```js
// service

import UserModel from '../models/user';
import CompanyModel from '../models/company';

export default class UserService() {

  async Signup(user) {
    const userRecord = await UserModel.create(user);
    const companyRecord = await CompanyModel.create(userRecord); // needs userRecord to have the database id 
    const salaryRecord = await SalaryModel.create(userRecord, companyRecord); // depends on user and company to be created
    
    ...whatever
    
    await EmailService.startSignupSequence(userRecord)

    ...do more stuff

    return { user: userRecord, company: companyRecord };
  }
}
```



- [견고한-node.js-프로젝트-아키텍쳐-설계하기](https://velog.io/@hopsprings2/견고한-node.js-프로젝트-아키텍쳐-설계하기)



## Observer Pattern & Publisher Subscriber Pattern	

### 차이점

> 1. Observer패턴은 Observer와 Subject가 서로를 인지하지만 Pub-Sub패턴의 경우 서로를 전혀 몰라도 상관없습니다.
> 2. Observer패턴에 비해 Pub-Sub패턴이 더 결합도가 낮습니다.(Loose Coupling)
> 3. Observer패턴은 대부분 동기(synchronous) 방식으로 동작하나 Pub-Sub패턴은 대부분 비동기(asynchronous) 방식으로 동작합니다.
> 4. Observer패턴은 단일 도메인 하에서 구현되어야 하나 Pub-Sub패턴은 크로스 도메인 상황에서도 구현 가능합니다.


- [observer-pubsub-pattern](https://jistol.github.io/software engineering/2018/04/11/observer-pubsub-pattern/)
