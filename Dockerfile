FROM ubuntu:latest
WORKDIR /app
RUN apt-get update
RUN apt-get install -y python3 python3-pip python-is-python3 uvicorn
RUN pip install sqlalchemy requests psycopg2-binary python-dotenv fastapi pyyaml
COPY ./db2api.py .
COPY ./endpoints.yaml .
CMD ["uvicorn", "db2api:app", "--host", "0.0.0.0", "--port", "80"]
