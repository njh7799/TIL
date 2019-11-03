# Ubuntu

## Set host name [link](https://linuxhandbook.com/sudo-unable-resolve-host/)

```bash
vim /etc/hosts
```

`127.0.0.1 {hostname} ` 을 추가.



## Update apt

0. Update apt

```bash
sudo apt-get update
```

1.  Install the dependencies 

```bash
sudo apt-get install software-properties-common python-software-properties
```

2.  Add the repository for the stable version of Nginx 

```bash
sudo add-apt-repository ppa:nginx/stable
```

3.  Update it 

```bash
sudo apt-get update
```



## Language setting

```bash
sudo apt-get install language-pack-ko
```

## Locale setting

```bash
sudo locale-gen ko_KR.UTF-8
locale
sudo -i
cat << 'EOF' > /etc/default/locale
LANG="ko_KR.UTF-8"
LANGUAGE="ko_KR:ko:en_US:en"
EOF
```



## NginX Setting [link](https://medium.com/@soban1193/upgrading-nginx-to-the-latest-version-on-ubuntu-c0ad9116cf87)

Run install

```bash
sudo apt-get install nginx
```



## Node Setting [link](https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/)

그냥 `apt install npm` 을 해버리면 구버전이 받아지기 때문에 다른 방법을 써야 한다.

1. Add Node.js PPA

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

2. Install Node.js and NPM

```bash
sudo apt install nodejs
```

3. Check Node.js version

```bash
node -v
npm -v
```



## Handling connection timeout <small>[link](https://m.blog.naver.com/PostView.nhn?blogId=asdf2017&logNo=221170355124&proxyReferer=https%3A%2F%2Fwww.google.com%2F)</small>

가끔 apt 명령어를 수행할 때,  kr.archive.ubuntu.com 에서 데이터를 받아오지 못하는 경우가 있다. 본인의 경우에는 `connecting to kr.archive.ubuntu.com` 의 상태만 지속되다가 time out 이 되어 연결이 해지 되는 문제가 발생하였다. 여러 방법을 시도해보았지만, 전부 실패하였고, 결국 발견한 방법이 아래의 방법이다.

그냥 데이터를 받는 서버를 한국 서버에서 미국 서버로 바꾸는 것이다.

`vim /etc/apt/sources.list ` 명렁어를 통해 해당 파일을 수정한다. 이 때, kr.~~ 으로 되어있는 부분들 전부 us.~~ 로 바꿔주면 된다. 저장 후 apt 명령어를 사용하면 정상적으로 동작하는 것을 확인할 수 있다.