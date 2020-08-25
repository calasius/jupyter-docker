#!/bin/bash

docker build -t jupyter-docker -f config/jupyter-docker.Dockerfile .
docker run --gpus all -ti -v ${PWD}:/usr/local/bin/jupyter-docker -p 8888:8888 jupyter-docker
