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

```python
# mysite/settings.py
INSTALLED_APPS = [
    'polls.apps.PollsConfig',
    ...
]

# 혹은
INSTALLED_APPS = [
    'polls', # polls/apps.py 에 저장되어 있음
    ...
]
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



## Time zone 설정 방법

```python
#mysite/settings.py
TIME_ZONE = 'Asia/Seoul'
```



# 모델

## 모델의 추가 및 변경 반영

```python
#polls/models.py
from django.db import models


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```

```bash
#shell
python manage.py makemigrations {app-name}
python manage.py migrate
```



## (번외) 프로젝트 내에서 shell 사용하기

```shell
python manage.py shell
```



## 모델 객체에 이름 설정해주기

```python
from django.db import models

class Question(models.Model):
    # ...
    def __str__(self):
        return self.question_text

class Choice(models.Model):
    # ...
    def __str__(self):
        return self.choice_text
```




## 관리자 

- 관리자 만들기

```shell
python manage.py createsuperuser
```

- 관리자 페이지 접근

```shell
#url
localhost:8000/admin
```



## 관리자 페이지에서 모델 객체에 접근

```python
#polls/admin.py
from django.contrib import admin

from .models import Question

admin.site.register(Question)
```



## (번외) runserver 쉽게 하기

![캡처](https://user-images.githubusercontent.com/40619551/64477410-41e14680-d1d6-11e9-8a61-06ebbb10f621.JPG)



# 뷰

