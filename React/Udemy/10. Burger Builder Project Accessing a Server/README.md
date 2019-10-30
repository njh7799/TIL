# Burger Builder Project Accessing a Server

##  205. Module Introduction 

##  207. Creating the Firebase Project 

##  208. Creating the Axios Instance 

##  209. Sending a POST Request 

##  210. Displaying a Spinner while Sending a Request 

## 211.  Handling Errors 

에러 핸들러 래퍼를 만든다

```js
const withErrorHandler = (WrappedComponent, axios) => {
    return class extends Component {
        state = {
            error: null
        }
        componentDidMount() {
            axios.interceptors.request.use(req => {
                this.setState({ error: null })
                return req;
            })
            axios.interceptors.response.use(res => res, error => {
                this.setState({ error: error })
            })
        }
    ...
```



## 212.  Retrieving Data from the Backend 

하위 컴포넌트의 componentDidmount 내부에서 에러가 발생했을 경우에 이를 잡지 못한다.

intercepter는 현재 상위 컴포넌터의 componentDidmount에 존재한다. 위 메소드는 하위 컴포넌트의 마운트가 끝난 이후에 실행된다. 따라서 하위 컴포넌트에서 에러가 먼저 발생을 할 경우,  에러를 핸들링 상위 컴포넌트의 componentDidmount는 실행되기 전이기 때문에 핸들링 할 수 없다. 

##  213. Removing Old Interceptors 

매번 unmount 될 때마다 제거해주자. 지우지 않고 방치하면 메모리 누수가 발생한다.