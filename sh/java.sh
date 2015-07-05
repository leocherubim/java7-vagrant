#!/usr/bin/env bash
apt-get update

# instalando dependencias
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
apt-get install -y curl vim wget git-core

# instalacao heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# instalando o postgresql
apt-get install -y postgresql postgresql-contrib
sudo -u postgres psql -c "create user root with password 'root';"
sudo -u postgres psql -c "alter user root with superuser;"
sudo -u postgres psql -c "create database test;"

# instalando o mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get update
apt-get install -y mysql-server
echo "create database test" | mysql -uroot -proot

# instalacao do jdk 7
apt-get -y install openjdk-7-jre
echo export JAVA_HOME=\"/usr/lib/jvm/java-7-openjdk-i386\" >> /home/vagrant/.profile
echo PATH=\"\$JAVA_HOME/bin/:\$PATH\" >> /home/vagrant/.profile

# instalacao do tomcat 8
cd /opt
wget http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz
tar xzf apache-tomcat-8.0.22.tar.gz
#echo "export CATALINA_HOME=\"/opt/apache-tomcat-8.0.22\"" >> ~/.bashrc
echo export CATALINA_HOME=\"/opt/apache-tomcat-8.0.22\" >> /home/vagrant/.profile
source /home/vagrant/.profile
# cd /opt/apache-tomcat-8.0.22

#instalacao do maven
apt-get -y install maven
echo export M2_REPO=\"/usr/share/maven\" >> /home/vagrant/.profile
echo export M2=\"\$M2_REPO/bin\" >> /home/vagrant/.profile
echo PATH=\"\$M2:\$PATH\" >> /home/vagrant/.profile
echo export MAVEN_OPTS=\"-Xms256m -Xmx512m\" >> /home/vagrant/.profile
source /home/vagrant/.profile
