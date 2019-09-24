# Commands

## List of Databases

```mysql
show databases
```

## List of  Tables

```mysql
show tables
```

## Show table detail

```mysql
desc {tablename}
```

## Create Database and User

```mysql
CREATE DATABASE mydb;
CREATE USER 'myuserid'@'%' IDENTIFIED WITH mysql_native_password BY '1q2w3e!Q'; # With 구문 안쓰면 node에서 에러가 나온다.
GRANT ALL ON mydb.* TO 'myuserid'@'%';
FLUSH PRIVILEGES; # 변경 사항 즉시 적용
```

# [Create Table](https://www.w3schools.com/php/php_mysql_create_table.asp)

```mysql
CREATE TABLE Users (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
```



## Insert Into table

```mysql
INSERT INTO Users (firstname, lastname, email)
VALUES ('Jack', 'Nam', 'rainy_waltz');
```



## Import and Export Database

```shell
 #import
 mysql -u {user} -p DATABASE < backup.sql
 
 #export
 mysqldump -u {user} -p DATABASE_NAME > backup.sql
```

