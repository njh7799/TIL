 https://brownbears.tistory.com/191 

 https://www.imperva.com/learn/performance/reverse-proxy/ 

## Reverse Proxy

![image](https://user-images.githubusercontent.com/40619551/66755724-8c3f9c80-eed3-11e9-8a97-2b1a009150c9.png)

### 동작 원리

- Receiving a user connection request
- Completing a TCP three-way handshake, terminating the initial connection
- Connecting with the origin server and forwarding the original request

### 주요 특징

-  **Content caching** : 캐싱을 한다.
-  **Traffic scrubbing** : 외부와의 트래픽을 줄인다.
-  **IP masking** : 서버의 실제 IP를 알 수 없게 한다. 사용자가 접근하는 IP는 프록시 서버의 IP이다.
-  **Load balancing** :  개별적인 HTTP 세션들을 라우팅 한다. 

## 이유

- 위의 특징들 외에도 보안 이슈가 있다.
- 실제 서버에 다이렉트로 연결을하게 되면, 그 서버가 털릴 경우, DB가 바로 털릴 수 있다.한 단계 거쳐서 숨겨 놓으면 위험이 줄어든다.
- 또한 방화벽등 보안 설정등을 이 프록시 서버에서 함으로써 실 서버의 보안성을 높힌다