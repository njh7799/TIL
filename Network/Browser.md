브라우저를 이용하여 특정 사이트에 접속하면 해당 사이트의 IP 와 80번 포트에 연결이 된다. 그런데 내 브라우저는 컴퓨터의 어떤 포트를 해당 사이트와 연결할까?

알아 보았다.

브라우저는 외부 인터넷과 물리적으로 연결될 수 없기 때문에 이를 OS에게 위임한다. 그러면 커널이 로컬 포트를 알아서 선택하여 연결해준다.

브라우저에서 여러개의 탭을 띄우면 띄운 만큼 각각 별도의 포트로 연결을 연다.

## Ref

- https://stackoverflow.com/questions/6632801/do-web-browsers-use-different-port-numbers-for-open-tabs
- https://brunch.co.kr/@alden/19