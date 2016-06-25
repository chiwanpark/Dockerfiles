#!/bin/bash

# image version
VERSION=0.1.0

# docker network name
NETWORK=hadoop-internal

# container specific setting
# number of slaves (number of containers is 1 + number of slaves)
N=3
# directory setting for data volume
# (first is directory for namenode, the others are directory for datanode and yarn worker)
VOLUMES=( "/opt/hadoop-namenode" "/mnt/dfs1" "/mnt/dfs2" "/mnt/dfs3" )
