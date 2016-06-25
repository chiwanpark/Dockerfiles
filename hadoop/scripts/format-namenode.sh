#!/bin/bash

if [ ! -f "/hadoop-data/formatted" ] && [ $DAEMON = "master" ]; then
    echo "Format HDFS namenode"
    $HADOOP_HOME/bin/hdfs namenode -format
    touch "/hadoop-data/formatted"
fi
