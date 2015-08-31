FROM phusion/baseimage:0.9.17
MAINTAINER Chiwan Park <chiwanpark@icloud.com>

CMD ["/sbin/my_init"]
VOLUME ["/jupyter"]

RUN useradd -d /home/jupyter -m jupyter

RUN apt-get -y update && apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran python3-pip libfreetype6-dev python3.4-dev libxml2-dev libxslt1-dev pkg-config
RUN pip3 install numpy scipy matplotlib pandas lxml beautifulsoup4 scikit-learn jupyter openpyxl pypdf2 requests

RUN mkdir /etc/service/jupyter
RUN chmod 755 /jupyter

RUN mkdir -p /home/jupyter/.ipython/profile_default/static/custom
ADD custom.css /home/jupyter/.ipython/profile_default/static/custom/custom.css
ADD custom.js /home/jupyter/.ipython/profile_default/static/custom/custom.js
RUN chown -R jupyter /home/jupyter/.ipython

ADD jupyter.sh /etc/service/jupyter/run
RUN chmod +x /etc/service/jupyter/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888
