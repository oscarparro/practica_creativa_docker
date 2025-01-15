FROM ubuntu:22.04

WORKDIR /home/

RUN apt update && apt install -y \
    curl \
    openjdk-8-jdk \
    python3 \
    python3-pip \
    git && \
    dpkg --configure -a && \
    apt clean

RUN git clone https://github.com/oscarparro/practica_creativa_bdfi.git && \
    chmod -R 777 practica_creativa_bdfi && \
    /home/practica_creativa_bdfi/resources/download_data.sh && \
    pip install -r /home/practica_creativa_bdfi/requirements.txt

ENV PROJECT_HOME=/home/practica_creativa_bdfi
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

COPY flask.sh /
RUN chmod 777 /flask.sh

ENTRYPOINT ["/flask.sh"]

EXPOSE 5001
