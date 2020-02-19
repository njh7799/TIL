# Errors
## timed out

> `ssh: connect to host 106.??.??.??? port 1028: Connection timed out`

보안 설정이 안되어 접근이 불가능 할 때 나오는 에러이다. ACG 에서 포트 및 IP가 정상적으로 열려 있는지 확인한다.

## Name or service not known

> `ssh: Could not resolve hostname --.--.---.---:22: Name or service not known`

문법이 잘못된 경우이다. 위 예시의 경우 포트는 -p 태그를 이용하여 별도로 설정해주어야 하는데, `:22`로 직접 설정하여 문제가 발생하였다.

