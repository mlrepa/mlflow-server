# Description

Simple mlflow server


# Build

```bash
docker build -t mlrepa/mlflow-server .
```


# Create network
```bash
docker network create mlflow-server
```

# Run

```bash
# <MLFLOW_WS> - your mlflow workspace folder on disk
export MLFLOW_WS=<MLFLOW_WS>

# up server
docker run \
        --name=mlflow-server \
        -p 1234:1234 \
        --expose 1234 \
        --network=mlflow-server \
        --rm \
        -e MLFLOW_WS=$MLFLOW_WS \
        -v $MLFLOW_WS:$MLFLOW_WS \
        mlrepa/mlflow-server
```


# Stop

```bash
docker stop mlflow-server
```

# Usage examples

## from host

```python
import mlflow

mlflow.set_tracking_uri('http://0.0.0.0:1234')

with mlflow.start_run(): 
   mlflow.log_param('p', 12) 
   mlflow.log_artifact('mymodel.joblib') 
```

## from docker

run you docker application:

```bash
docker run \
        --name=<your_container> \
        -v $MLFLOW_WS:$MLFLOW_WS \
        --network=mlflow-server <your_image>
```

enter container:

```bash
docker exec -ti <your_container> /bin/bash 
```

python code:

```python
import mlflow

mlflow.set_tracking_uri('http://mlflow-server:1234')

with mlflow.start_run(): 
   mlflow.log_param('p', 12) 
   mlflow.log_artifact('mymodel.joblib')
```