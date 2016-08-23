#!/bin/bash

source config.sh

# update slaves information
cat /dev/null > config/slaves
for i in $(seq 1 $N); do
    echo "hadoop-slave$i" >> config/slaves
done

# rebuild container image
echo "Rebuilding docker image..."
docker build -t chiwanpark/hadoop:$VERSION .

# create internal network for hadoop
echo "Creating docker network for Hadoop"
docker network create --driver=bridge $NETWORK

# create slave container
for i in $(seq 1 $N); do
    echo "Starting Hadoop slave node $i"
    docker run -itd --env DAEMON="slave" --volume="${VOLUMES[$i]}:/hadoop-data" --net="$NETWORK" --name "hadoop-slave$i" --hostname "hadoop-slave$i" chiwanpark/hadoop:$VERSION
done

# create master container
echo "Starting Hadoop master node"
docker run -itd --env DAEMON="master" --volume="$MASTER_HOME:/root" --volume="${VOLUMES[0]}:/hadoop-data" --net="$NETWORK" --name hadoop-master --hostname hadoop-master chiwanpark/hadoop:$VERSION
