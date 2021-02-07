FROM ubuntu:20.04
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password zakurra2002" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password zakurra2002" | debconf-set-selections
RUN apt-get install -y mysql-server
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y default-jre
COPY WebServerDatabase-jar-with-dependencies.jar /root/
COPY corsirecupero.sql /root/
CMD service mysql start && mysql -u root -pzakurra2002 < /root/corsirecupero.sql && java -jar /root/WebServerDatabase-jar-with-dependencies.jar