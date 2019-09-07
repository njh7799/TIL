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



## 뷰 추가하기

```python
#polls/view.py
...
def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
```

```python
#polls/urls.py
from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('', views.index, name='index'),
    # ex: /polls/5/
    path('<int:question_id>/', views.detail, name='detail'),
    # ex: /polls/5/results/
    path('<int:question_id>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```



## 템플릿 추가하기

```python
# polls/templates/polls/index.html
{% if latest_question_list %}
    <ul>
    {% for question in latest_question_list %}
        <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
    {% endfor %}
    </ul>
{% else %}
    <p>No polls are available.</p>
{% endif %}
```

```python
# polls/views.py
from django.http import HttpResponse
from django.template import loader # loader를 import 한다.

from .models import Question


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    
    # 템플릿을 가져온다.
    template = loader.get_template('polls/index.html') 
    
    # 템플릿에 넘겨줄 context를 json 형태로 저장
    context = {
        'latest_question_list': latest_question_list,
    }
    
    # 가져온 템플릿을 이용하여 렌더링 한다.
    return HttpResponse(template.render(context, request)) 
```



## 렌더링 간단하게 하기

```python
# polls/views.py
from django.shortcuts import render

from .models import Question


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)
```



## 템플릿에서 url 소프트 코딩하기

```html
before
<li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>

after
<li><a href="{% url 'polls:detail' question.id %}">{{ question.question_text }}</a></li>

...
# the 'name' value as called by the {% url %} template tag
path('<int:question_id>/', views.detail, name='detail'),
...
```

```python
# polls.urls.py
polls/urls.py¶
from django.urls import path

from . import views

# 앱 이름 설정!
app_name = 'polls' 
urlpatterns = [
    
    # url 이름 설정!
    path('', views.index, name='index'),
    path('<int:question_id>/', views.detail, name='detail'),
    path('<int:question_id>/results/', views.results, name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```

