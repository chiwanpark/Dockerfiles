FROM phusion/baseimage:0.9.18
MAINTAINER Chiwan Park <chiwanpark@icloud.com>

CMD ["/sbin/my_init"]
VOLUME ["/hadoop-data", "/root"]

# Install Oracle JDK 8
RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default

# Clean APT cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Hadoop 2.7.2
RUN wget http://apache.mirror.cdnetworks.com/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz && \
    tar -xzvf hadoop-2.7.2.tar.gz && \
    mv hadoop-2.7.2 /usr/local/hadoop && \
    rm hadoop-2.7.2.tar.gz

# Install third-party libraries
RUN mkdir /usr/local/hadoop/third-party && \
    wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar -P /usr/local/hadoop/third-party/

# Configure common environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_MAPRED_HOME=/usr/local/hadoop
ENV HADOOP_COMMON_HOME=/usr/local/hadoop
ENV HADOOP_HDFS_HOME=/usr/local/hadoop
ENV YARN_HOME=/usr/local/hadoop
ENV HADOOP_CLASSPATH=/usr/local/hadoop/third-party
ENV HADOOP_COMMON_LIB_NATIVE_DIR=/usr/local/hadoop/lib/native
ENV HADOOP_OPTS="-Djava.library.path=/usr/local/hadoop/lib"
ENV HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin

# Enable SSH and create SSH key
RUN rm -f /etc/service/sshd/down && \
    /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Add init script for namenode formatting
RUN mkdir -p /etc/my_init.d
ADD scripts/format-namenode.sh /etc/my_init.d/00-format-namenode.sh

# Add Hadoop service
RUN mkdir /etc/service/hadoop
ADD scripts/hadoopd.sh /etc/service/hadoop/run

# Copy configuration for Hadoop
COPY config/* /tmp/
RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    sed -i -E "s#export JAVA_HOME=.+#export JAVA_HOME=$JAVA_HOME#g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh


