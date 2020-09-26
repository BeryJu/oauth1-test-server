FROM python:3.8-slim-buster as locker

COPY ./Pipfile /app/
COPY ./Pipfile.lock /app/

WORKDIR /app/

RUN pip install pipenv && \
    pipenv lock -r > requirements.txt && \
    pipenv lock -rd > requirements-dev.txt

FROM python:3.8-slim-buster

COPY . /app
COPY --from=locker /app/requirements.txt /app
COPY --from=locker /app/requirements-dev.txt /app

RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 5000

CMD [ "python", "/app/app.py" ]
