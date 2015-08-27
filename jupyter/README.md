# Jupyter

Docker image containing Jupyter and other python packages for scientific research.

## Including Packages

* lxml
* bs4 (Beautiful Soup 4)
* scipy
* numpy
* pandas
* openpyxl
* pypdf2
* scikit-learn
* matplotlib
* jupyter

## Build

```
docker build --tag jupyter .
```

## Run

1. Build or pull the image

```
docker pull chiwanpark/jupyter
```

1. Before running the jupyter image, you should create configuration file (`jupyter_notebook_config.py`) to data volume (mapped path to `/jupyter` in container).

1. Run with following command:

```
docker run --name <CONTAINER_NAME> -d -p <DEST_PORT>:8888 -v <VOLUME_PATH>:/jupyter chiwanpark/jupyter
```
