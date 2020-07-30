FROM python:3.7-slim

RUN pip install mlflow==1.10.0

ENV HOME_DIR="/home"
WORKDIR ${HOME_DIR}

COPY start.sh start.sh
RUN chmod +x start.sh

USER 1000

CMD ./start.sh
