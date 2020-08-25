FROM nvidia/cuda:10.1-cudnn7-devel

RUN apt-get update && apt-get install python3.7 -y && apt-get install python3-pip -y

ADD libs/requirements.txt .

RUN pip3 install -r requirements.txt


ENV MAIN_PATH=/usr/local/bin/jupyter-docker
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

EXPOSE 8888

CMD cd ${MAIN_PATH} && sh config/run_jupyter.sh
