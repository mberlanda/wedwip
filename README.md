
# How to setup postgresql db

http://www.postgresql.org/download/linux/ubuntu/
sudo apt-get install postgresql-9.4
sudo apt-get install libpq-dev
sudo su postgres -c psql
CREATE USER user WITH PASSWORD 'password' SUPERUSER;
sudo vim /etc/postgresql/9.4/main/pg_hba.conf
change from 
   local   all             all                                peer
to
   local   all             all                                trust
sudo service postgresql restart
