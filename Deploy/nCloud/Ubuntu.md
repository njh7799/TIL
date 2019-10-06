# Ubuntu

그냥 `apt install npm` 을 해버리면 구버전이 받아지기 때문에 다른 방법을 써야 한다.

1. Add Node.js PPA

```bash
sudo apt install curl
```
```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
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

