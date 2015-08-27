FROM phusion/baseimage:0.9.17
MAINTAINER Chiwan Park <chiwanpark@icloud.com>

CMD ["/sbin/my_init"]
VOLUME ["/jupyter"]

RUN useradd -d /home/jupyter -m jupyter

RUN apt-get -y update && apt-get -y install python3-pip python3-lxml python3-bs4 python3-matplotlib python3-scipy python3-numpy python3-pandas
RUN pip3 install scikit-learn jupyter openpyxl pypdf2

RUN mkdir /etc/service/jupyter
RUN chmod 755 /jupyter

ADD jupyter.sh /etc/service/jupyter/run
RUN chmod +x /etc/service/jupyter/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888
