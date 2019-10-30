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

