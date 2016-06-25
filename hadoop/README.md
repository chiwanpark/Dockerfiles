# Hadoop

This repositories provides Docker image and scripts to run Hadoop with testing purpose. `Dockerfile` and some scripts are inspired by [Kai LIU's hadoop-cluster-docker repository](https://github.com/kiwenlau/hadoop-cluster-docker).

![Suggested structure of this Docker image](https://raw.githubusercontent.com/chiwanpark/Dockerfiles/master/hadoop/structure.png)

## Packages

* Oracle JDK 8
* Apache Hadoop 2.7.2

## Usage

1. Before running Hadoop cluster within Docker, you should check and configure by modifying `config.sh`. List of configuration is following:
    * Docker network name for cluster
    * Number of slave containers
    * Data volume directories for each container

1. Build docker image with the configuration and start cluster
    ```
    ./start-cluster.sh
    ```

1. Connect to master container
    ```
    docker exec -it hadoop-master bash
    ```
    or
    ```
    ./connect.sh
    ```

1. Stop the cluster
    ```
    ./stop-cluster.sh
    ```
