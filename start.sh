mlflow server \
        --host 0.0.0.0 \
        --port 1234 \
        --backend-store-uri sqlite:////${MLFLOW_WS}/mlflow.db \
        --default-artifact-root ${MLFLOW_WS}/mlruns
