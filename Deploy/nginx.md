# nginX

## Web server with React [link](https://codechacha.com/ko/deploy-react-with-nginx/)

1. default 파일 제거

```bash
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
```

2. nginX 설정 파일 생성

```bash
cd /etc/nginx/sites-available/
sudo touch myapp.conf
vim myapp.conf
```

3. 설정 파일 세팅

```bash
server {
  listen 80;
  location / {
    root   /home/user/myapp/build;
    index  index.html index.htm;
    try_files $uri $uri/ /index.html;
  }
}
```

4. 뭔지 모르겠음

```bash
sudo ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/myapp.conf
```

5. nginX 실행

```bash
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl status nginx
```



## Reverse Proxy Server [link](https://medium.com/sjk5766/nginx-reverse-proxy-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-e11e18fcf843)

3. 까지 위와 동일

```bash
server {
  listen 80;
  location / {
    proxy_pass http://127.0.0.1:3000;
  }
  error_page 404 /404.html;
  location = /40x.html {
  }
  error_page 500 502 503 504 /50x.html;
    location = /50x.html {
  }
}
```



## HTTP load balancing [link](https://judo0179.tistory.com/16) [official](https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/)

```bash
# location
# /etc/nginx/nginx.conf

events { }
http {
    listen 80;
    upstream backend {
        server 106.10.51.202:3000;
        server 106.10.51.202:4000;
    }
    
    server {
        location / {
            proxy_pass http://backend;
        }
    }
}
```



## syntax check

```bash
nginx -t -c /etc/nginx/sites-available/myapp.conf
nginx -t -c /etc/nginx/nginx.conf
```

