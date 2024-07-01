FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install python3.10 -y
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
RUN apt-get install curl -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip install html5lib
RUN pip install tensorflow-cpu --upgrade
RUN pip install keras --upgrade
RUN pip install jupyterlab

# tensorboard
EXPOSE 6006

# jupyter
EXPOSE 8888
EXPOSE 8889

VOLUME /home/notebooks

CMD ["jupyter", "lab", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--port=8889"]
