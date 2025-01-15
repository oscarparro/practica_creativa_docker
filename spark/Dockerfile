FROM ubuntu:22.04

WORKDIR /home/

RUN apt update && apt -y full-upgrade && apt install -y \
    curl \
    wget \
    openjdk-8-jdk \
    python3 \
    python3-pip \
    git \
    scala \
    gnupg2 && \
    apt clean

RUN wget https://archive.apache.org/dist/spark/spark-3.3.3/spark-3.3.3-bin-hadoop3.tgz && \
    tar xvf spark-3.3.3-bin-hadoop3.tgz && \
    mv spark-3.3.3-bin-hadoop3/ /opt/spark && \
    rm spark-3.3.3-bin-hadoop3.tgz



RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
	echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
	curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
	apt-get update && \
	apt-get install -y sbt

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV SPARK_HOME=/opt/spark

RUN git clone https://github.com/oscarparro/practica_creativa_bdfi.git &&\
    cd practica_creativa_bdfi && \
    resources/download_data.sh && \
    pip install -r requirements.txt

WORKDIR /

RUN cd /home/practica_creativa_bdfi && \
    python3 resources/train_spark_mllib_model.py .

RUN cd /home/practica_creativa_bdfi/flight_prediction && \
    sbt clean package && chmod 777 target/scala-2.12/flight_prediction_2.12-0.1.jar

EXPOSE 7077
EXPOSE 8081
EXPOSE 8082
EXPOSE 4040