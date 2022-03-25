FROM python:3.10.4-slim-buster as locker

COPY ./Pipfile /app/
COPY ./Pipfile.lock /app/

WORKDIR /app/

RUN pip install pipenv && \
    pipenv lock -r > requirements.txt && \
    pipenv lock -rd > requirements-dev.txt

FROM python:3.10.4-slim-buster

WORKDIR /app

COPY --from=locker /app/requirements.txt /app
COPY --from=locker /app/requirements-dev.txt /app

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

EXPOSE 5000

HEALTHCHECK CMD [ "wget", "--spider", "http://localhost:5000/api/health" ]

CMD [ "python", "/app/app.py" ]
