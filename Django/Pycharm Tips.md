# Pycharm Tips

## Configuration 추가

오른쪽 위에 보이는 재생 버튼이다. 이거 설정해 놓으면 저장된 스크립트를 실행 시킬 수 있는데, python manage.py runserver 는 진짜 허구한 날 쓰니까 이런거 저장하면 된다.

![캡처](https://user-images.githubusercontent.com/40619551/64488437-24b68180-d283-11e9-9dec-04051231387b.JPG)

- Script path에 스크립트를 실행 시킬 파일의 디렉토리: ..src\manage.py
- Parameters에 실행 시킬 명령어 runserver
- Python interpreter에 사용할 인터프리터를 추가해주자.

맨위에 두개만 설정하면 안돌아가서 스트레스를 받을 수 있으니, 미리미리 다 설정 해 놓자.

## root directory 설정

```
from postings.models import BlogPost
```

분명히 tutorial에서 시킨대로 했는데, 경로를 찾을 수 없다고 나오는 경우가 종종 있다. 이러한 에러가 발생하는 이유는, root directory가 설정되어 있지 않거나 잘못 설정되어 있기 때문이다.

위의 예시를 보면 `from postings.models` 라고 되어 있는데, 이는 루트 디렉토리에서 부터의 경로를 뜻한다. 따라서 루트디렉토리가 개판이면 결과가 안나올 수 밖에 없다.

![KakaoTalk_20190913_174827531](https://user-images.githubusercontent.com/40619551/64849692-e5a37a00-d64e-11e9-9ab7-e57a39a2e1ab.png)

이렇게 root 를 직접 설정 해주면 해결