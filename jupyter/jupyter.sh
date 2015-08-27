#!/bin/sh

exec /sbin/setuser jupyter /usr/local/bin/jupyter notebook --config=/jupyter/jupyter_notebook_config.py
