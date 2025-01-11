FROM ubuntu:22.04

WORKDIR /home/

# Install Python3 & Pip & Other dependencies
RUN apt update && apt install -y curl && \
	apt install curl mlocate openjdk-8-jdk -y && \
	apt install -y python3 && \
	apt install -y python3-pip && \
	dpkg --configure -a

# Install Git & Clone the repository
RUN apt update && apt install -y git && \
    git clone https://github.com/oscarparro/practica_creativa_bdfi.git && \
	chmod 777 practica_creativa_bdfi && \
    practica_creativa_bdfi/resources/download_data.sh && \
	pip install -r practica_creativa_bdfi/requirements.txt

# Environment variables
ENV PROJECT_HOME=/home/practica_creativa_bdfi
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PATH="$PROJECT_HOME/bin:$PATH"
ENV PATH="$SPARK_HOME/bin:$PATH"
ENV PATH="$JAVA_HOME/bin:$PATH"

# Update localhost variables to the refered container names
#RUN cd practica_creativa/resources/web && \
#	pip install joblib && \
#	sed -i 's@MongoClient()@MongoClient("mongo", 27017)@g' predict_flask.py && \
#	sed -i 's@localhost:9092@kafka:9092@g' predict_flask.py

# Execute the web from entrypoint file
COPY flask.sh /
RUN chmod 777 /flask.sh

ENTRYPOINT ["/flask.sh"]

# Expose the required port for the web
EXPOSE 5001