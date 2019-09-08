# Errors

## pycharm unresolved reference

간혹 가다가 분명히 가상 환경에 package를 설치 하였음에도 package 밑에 붉은 줄이 나오면서 unresolved reference 라는 에러 표시가 나올 때가 있다. 보통 에러 표시만 나오고, 제대로 동작하지만, 존재 만으로 상당한 불쾌감을 주며 자동 완성 기능도 안돼서 몹시 짜증난다.

사진 보여주고 싶은데, 지금 고쳐서 에러 사진 안나옴ㅎㅎ 

보통 이 문제가 발생하는 이유는 interpreter로 설정된 파이썬이 있는 경로에 해당 패키지가 설치 되어있지 않기 때문이다.

필자 또한 interperter을 글로벌에 있는 python으로 설정을 해 놓았기 때문에(글로벌 파이썬에는 rest api 가 설치되어있지 않다. 가상 환경에 설치했음) 위와 같은 문제가 발생했다.

해결 방법은 걍 interpreter를 가상 환경에 있는 python으로 바꿔주면 된다.

![캡처](https://user-images.githubusercontent.com/40619551/64488394-6a267f00-d282-11e9-95bb-8f7876936d5e.JPG)

매우 쉽다 