FROM python:3.11
WORKDIR /app
RUN apt-get update
RUN apt-get install -y python3-pip python-is-python3 uvicorn python3-fastapi python3-requests python3-saneyaml python3-sqlalchemy python3-psycopg2 python3-dotenv
COPY ./db2api.py .
COPY ./endpoints.yaml .
CMD uvicorn db2api:app --host 0.0.0.0 --port $PORT
