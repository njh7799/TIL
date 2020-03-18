### 프로세스 실행
```
pm2 start index.js --name apiServer
```

### 선택 종료
```
pm2 delete apiServer
```

### 실행중인 프로세스

```shell
pm2 list
```

### 전부 종료

```shell
pm2 delete all
```

### 로그 보기

```shell
pm2 logs
```



