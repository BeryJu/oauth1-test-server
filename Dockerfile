FROM docker.io/python:3.13.2-slim AS poetry-locker

WORKDIR /work
COPY ./pyproject.toml /work
COPY ./poetry.lock /work

RUN pip install --no-cache-dir poetry && \
    poetry export -f requirements.txt --output requirements.txt && \
    poetry export -f requirements.txt --dev --output requirements-dev.txt

FROM docker.io/python:3.13.2-slim

WORKDIR /app

COPY --from=poetry-locker /work/requirements.txt /app
COPY --from=poetry-locker /work/requirements-dev.txt /app

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

EXPOSE 5000

HEALTHCHECK CMD [ "wget", "--spider", "http://localhost:5000/api/health" ]

CMD [ "python", "/app/app.py" ]
