# [Getting Started](https://docs.djangoproject.com/ko/2.1/intro/)

## 설치

```shell
pip install Django
```



## project 실행

1. 

```
django-admin startproject mysite
```
디렉토리 내부에 mysite 폴더를 만들고 그 내부에 mysite 디렉토리를 또 만든다.
![startproject1](https://user-images.githubusercontent.com/40619551/64148618-b0cd4100-ce5e-11e9-8a5d-722ae1f8d0a6.JPG)





2. 

```shell
django-admin startproject mysite .
```
디렉토리에 바로 mysite 폴더를 만든다.
본인은 이 방법을 선호한다.
![startproject2](https://user-images.githubusercontent.com/40619551/64148650-c2164d80-ce5e-11e9-9a3b-7cefc3ded708.JPG)



##  로컬서버 동작

```shell
python manage.py runserver
```



## 앱 만들기

```shell
python manage.py startapp polls
```



## view 작성

```python
# polls/views.py
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
```



	## url 연결

```python
# mysite/urls.py
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
```

```python
# polls/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
```

