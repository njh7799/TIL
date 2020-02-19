# Commands

### Get the details of files

```shell
ls -l
```

### Edit authority of file*

```shell
sudo chmod xxx filename
```

### Edit File with editor

```shell
vi filename
```

### Check Process running

```shell
ps -ef
\+ ps -ef | grep manage
```

### Run server in background

```shell
sudo python3 manage.py runserver XXXXXX.XXXXXXX.XXXXXXX.com:80 & 
(XX~~XX is public DNS)
```

### [프로세스 죽이기](https://www.lesstif.com/pages/viewpage.action?pageId=12943674)

```shell
sudo kill -15 n //(n is PID)  
```

### 클립보드에 저장

```
pbcopy < ~/.ssh/id_rsa_foo.pub
```

### 변수를 이용하여 문자열 만들기

```sh
foo="${foo} World"
```

### 현재 디렉토리 이용하기

```
ls "`pwd`/file.txt"
```

### 하나 빼고 다 옮기기

```sh
mv ~/Linux/Old/!(Tux.png) ~/Linux/New/
```

