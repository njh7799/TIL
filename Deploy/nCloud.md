# nCloud

## nCloud 서버 열기


![새 파일 2019-10-04 10 50 58_2](https://user-images.githubusercontent.com/40619551/66266201-a4bd1080-e85c-11e9-947b-1e1a94a4cecc.jpg)
![새 파일 2019-10-04 10 50 58_3](https://user-images.githubusercontent.com/40619551/66266202-a555a700-e85c-11e9-9ff5-ae398b0c288d.jpg)
![새 파일 2019-10-04 10 50 58_4](https://user-images.githubusercontent.com/40619551/66266203-a555a700-e85c-11e9-9ec5-9de28d22533c.jpg)
![새 파일 2019-10-04 10 50 58_5](https://user-images.githubusercontent.com/40619551/66266204-a555a700-e85c-11e9-8c5e-880379a94a91.jpg)
![새 파일 2019-10-04 10 50 58_6](https://user-images.githubusercontent.com/40619551/66266205-a5ee3d80-e85c-11e9-8882-55f85fdb8cb4.jpg)
![새 파일 2019-10-04 10 50 58_7](https://user-images.githubusercontent.com/40619551/66266206-a5ee3d80-e85c-11e9-960c-1f50d67863bd.jpg)
![새 파일 2019-10-04 10 50 58_8](https://user-images.githubusercontent.com/40619551/66266207-a5ee3d80-e85c-11e9-90ed-75316b833a43.jpg)
![새 파일 2019-10-04 10 50 58_9](https://user-images.githubusercontent.com/40619551/66266208-a5ee3d80-e85c-11e9-8099-39665f4b7985.jpg)
![새 파일 2019-10-04 10 50 58_10](https://user-images.githubusercontent.com/40619551/66266209-a686d400-e85c-11e9-9bb1-a0463b6df22d.jpg)
![새 파일 2019-10-04 10 50 58_11](https://user-images.githubusercontent.com/40619551/66266210-a686d400-e85c-11e9-9818-a2d2cb00b0dd.jpg)
![새 파일 2019-10-04 10 50 58_12](https://user-images.githubusercontent.com/40619551/66266211-a686d400-e85c-11e9-9bc8-ceb7bf41a9d5.jpg)
![새 파일 2019-10-04 10 50 58_13](https://user-images.githubusercontent.com/40619551/66266212-a71f6a80-e85c-11e9-8f0b-1e6d401659b7.jpg)
![새 파일 2019-10-04 10 50 58_14](https://user-images.githubusercontent.com/40619551/66266213-a71f6a80-e85c-11e9-9829-6af19699b46b.jpg)
![새 파일 2019-10-04 10 50 58_15](https://user-images.githubusercontent.com/40619551/66266214-a71f6a80-e85c-11e9-9f37-877194e6680e.jpg)
![새 파일 2019-10-04 10 50 58_16](https://user-images.githubusercontent.com/40619551/66266215-a71f6a80-e85c-11e9-8779-0ec8f1f3a9a2.jpg)

## [SSL VPN으로 접속하기](https://docs.ncloud.com/ko/security/security-5-1.html)

위 단계에서 VPN Agent 설치 및 실행까지 끝났다면, 아래는 비교적 간단하다.

1. VPN Agent를 연결 상태로 유지한다.
2. nCloud 서버의 username 과 password를 파악한다.

![image](https://user-images.githubusercontent.com/40619551/66266259-37f64600-e85d-11e9-9310-77fe6e5a93b8.png)

위 사진에서 관리자 비밀번호 확인을 누르면 확인할 수 있다.

3. ssh 접속한다.
![image](https://user-images.githubusercontent.com/40619551/66266280-96bbbf80-e85d-11e9-92d5-f67e158a1891.png)
비밀번호는 위에서 확인 했을 것이다.

4. 비밀번호를 변경한다.
```bash
passwd
```
![image](https://user-images.githubusercontent.com/40619551/66266289-c1a61380-e85d-11e9-9fbd-08e5e45e73ee.png)



출처: nCloud 공식 홈페이지 및 nCloud Platform Hands-on 교육