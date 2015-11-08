# Zeppelin

Docker image containing snapshot version of Apache Zeppelin and latest stable version of Apache Flink

## Build

```
docker build --tag zeppelin .
```

## Run

1. Build or pull the image
```
docker pull chiwanpark/zeppelin
```

1. Run with following command:
```
docker run --name <CONTAINER_NAME> -d -p <DEST_PORT>:8080 -v <VOLUME_PATH>:/zeppelin chiwanpark/zeppelin
```
