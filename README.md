# OAuth1 Test Server

![GitHub branch checks state](https://img.shields.io/github/checks-status/beryju/oauth1-test-server/master?style=flat-square)

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
- `/api/health`: Healthcheck URL

## Running

This service is intended to run in a docker container

```
docker pull ghcr.io/beryju/oauth1-test-server
docke run -d --rm \
    -p 5000:5000 \
    -e OAUTH1_CLIENT_ID=2NVVBip7I5kfl0TwVmGzTphhC98kmXScpZaoz7ET \
    -e OAUTH1_CLIENT_SECRET=wXzb8tGqXNbBQ5juA0ZKuFAmSW7RwOw8uSbdE3MvbrI8wjcbGp \
    -e OAUTH1_REDIRECT_URI=http://localhost.... \
    ghcr.io/beryju/oauth1-test-server
```

Or if you want to use docker-compose, use this in your `docker-compose.yaml`.

```yaml
version: '3.5'

services:
  oauth1-test-server:
    image: ghcr.io/beryju/oauth1-test-server
    ports:
      - 5000:5000
    environment:
      OAUTH1_CLIENT_ID: 2NVVBip7I5kfl0TwVmGzTphhC98kmXScpZaoz7ET
      OAUTH1_CLIENT_SECRET: wXzb8tGqXNbBQ5juA0ZKuFAmSW7RwOw8uSbdE3MvbrI8wjcbGp
      OAUTH1_REDIRECT_URI: http://localhost....
```
