#!/bin/bash

source config.sh

echo "Stopping Hadoop cluster and master node..."
docker stop -t 120 hadoop-master
docker rm hadoop-master

for i in $(seq 1 $N); do
    echo "Stopping Hadoop slave node $i"
    docker stop -t 120 "hadoop-slave$i"
    docker rm "hadoop-slave$i"
done

echo "Removing docker network for Hadoop"
docker network rm "$NETWORK"
