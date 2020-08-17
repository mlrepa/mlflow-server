FROM python:3.7-slim

RUN apt-get update && \
    apt-get install -y gcc curl build-essential

RUN pip install mlflow==1.10.0 psycopg2-binary==2.8.5

ENV HOME_DIR="/home"
WORKDIR ${HOME_DIR}

COPY start.sh start.sh
RUN chmod +x start.sh

USER 1000

CMD ./start.sh
