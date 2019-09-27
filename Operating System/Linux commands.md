# Linux Commands

**Install python**
sudo apt-get install python3.6

**Install pip**
https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/

**Get the details of files** 
ls -l

**Edit authority of file** 
sudo chmod xxx filename

**Edit File with editor**
vi filename

**Check Process running**
ps -ef
\+ ps -ef | grep manage

**Run server in background**
sudo python3 manage.py runserver XXXXXX.XXXXXXX.XXXXXXX.com:80 & 
(XX~~XX is public DNS)

**Kill process**
sudo kill -9 n
(n is PID)  