FROM phusion/baseimage:0.9.17
MAINTAINER Chiwan Park <chiwanpark@icloud.com>

CMD ["/sbin/my_init"]
VOLUME ["/zeppelin"]

RUN useradd -d /home/zeppelin -m zeppelin
RUN apt-get -y update && apt-get -y install openjdk-7-jdk git wget

RUN mkdir /etc/service/zeppelin
RUN chmod 755 /zeppelin

WORKDIR /home/zeppelin
USER zeppelin

RUN wget http://apache.mirror.cdnetworks.com/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && tar -xzf apache-maven-3.3.3-bin.tar.gz
RUN git clone https://github.com/apache/incubator-zeppelin.git

WORKDIR /home/zeppelin/incubator-zeppelin
RUN /home/zeppelin/apache-maven-3.3.3/bin/mvn install -DskipTests -Dflink.version=0.9.1 -Dhadoop.version=2.7.1
ADD zeppelin-env.sh /home/zeppelin/incubator-zeppelin/conf/zeppelin-env.sh
ADD zeppelin-site.xml /home/zeppelin/incubator-zeppelin/conf/zeppelin-site.xml

USER root
ADD zeppelin.sh /etc/service/zeppelin/run
RUN chmod +x /etc/service/zeppelin/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /home/zeppelin/apache-maven-3.3.3

EXPOSE 8080
