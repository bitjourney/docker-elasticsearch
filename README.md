# docker-elasticsearch-ci

Docker Image for CI Build

<!-- TOC depthFrom:2 -->

- [Feature](#feature)
- [Docker Hub](#docker-hub)
- [Usage](#usage)
- [Development](#development)
  - [Publish to Docker Hub](#publish-to-docker-hub)

<!-- /TOC -->

## Feature

- Disable Bootstrap check
  - https://discuss.circleci.com/t/running-elasticsearch-5/8559/7
- Disable X-Packs Security
  - because it is not required for CI environment

## Docker Hub

https://hub.docker.com/r/bitjourney/elasticsearch-ci/

## Usage

```sh
docker pull bitjourney/elasticsearch-ci
```

## Development

### Publish to Docker Hub

```sh
make publish
```
