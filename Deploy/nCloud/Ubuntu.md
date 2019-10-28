# Ubuntu

## NginX Setting [link](https://medium.com/@soban1193/upgrading-nginx-to-the-latest-version-on-ubuntu-c0ad9116cf87)

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

4. Run install

```bash
sudo apt-get install nginx
```



## Node Setting

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

출처: https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/

