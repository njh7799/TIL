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

## Import and Export Database

```shell
 #import
 mysql -u {user} -p DATABASE < backup.sql
 
 #export
 mysqldump -u {user} -p DATABASE_NAME > backup.sql
```

