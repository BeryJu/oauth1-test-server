# OAuth1 Test Server

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/beryju/oauth1-test-server?style=flat-square)
![Docker pulls](https://img.shields.io/docker/pulls/beryju/oauth1-test-server.svg?style=flat-square)

Based on https://flask-oauthlib.readthedocs.io/en/latest/oauth1.html and https://github.com/lepture/example-oauth1-server

Can be used for e2e testing.

## Credentials

By default, a user with the Username `example-user` is created.

## Configuration

- `OAUTH1_CLIENT_ID`: OAuth Client ID
- `OAUTH1_CLIENT_SECRET`: OAuth Client Secret
- `OAUTH1_REDIRECT_URI`: Allowed redirect URI

## URLs/API Endpoints

- `/oauth/request_token`: Request Token endpoint, accepts both GET and POST
- `/oauth/access_token`: Access Token endpoint, accepts both GET and POST
- `/oauth/authorize`: Authorize endpoint
- `/api/me`: Returns User information

## Running

This service is intended to run in a docker container

```
docker pull beryju/oauth1-test-server
docke run -d --rm \
    -p 5000:5000 \
    -e OAUTH1_CLIENT_ID=2NVVBip7I5kfl0TwVmGzTphhC98kmXScpZaoz7ET \
    -e OAUTH1_CLIENT_SECRET=wXzb8tGqXNbBQ5juA0ZKuFAmSW7RwOw8uSbdE3MvbrI8wjcbGp \
    -e OAUTH1_REDIRECT_URI=http://localhost.... \
    beryju/oauth1-test-server
```

Or if you want to use docker-compose, use this in your `docker-compose.yaml`.

```yaml
version: '3.5'

services:
  oauth1-test-server:
    image: beryju/oauth1-test-server
    ports:
      - 5000:5000
    environment:
      OAUTH1_CLIENT_ID: 2NVVBip7I5kfl0TwVmGzTphhC98kmXScpZaoz7ET
      OAUTH1_CLIENT_SECRET: wXzb8tGqXNbBQ5juA0ZKuFAmSW7RwOw8uSbdE3MvbrI8wjcbGp
      OAUTH1_REDIRECT_URI: http://localhost....
```
