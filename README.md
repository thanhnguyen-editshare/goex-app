# [HTTP API goex editor](https://github.com/thanhnguyen-editshare/goex-app.git) application instance


## Requirements

These services must be installed, configured and running:

 * Python (>= 3.6)
 * FFmpeg
 * MongoDB
 * RabbitMQ (celery backend)


## Installation steps:

### Manual installation
```
git clone https://github.com/thanhnguyen-editshare/goex-app.git
cd goex-app/
pip install -r requirements.txt
honcho start
```

 :exclamation:
 Using Gunicorn is not required, you can use any WSGI HTTP Server.
 Using Honcho is not required, you can run processes listed in `Procfile` with another tool (e.g. Supervisor).

### Run with docker

#### docker-compose
```
git clone https://github.com/thanhnguyen-editshare/goex-app.git
docker-compose up -d
```

:exclamation:
 When running with docker compose, services listed above such as FFmpeg, MongoDB, rabbitMQ are not required on the host.

#### goex server container

If you prefer to run only a goex server container and connect it to already running on **localhost** MongoDB and RabbitMQ,
you can use next commands:

```
git clone https://github.com/thanhnguyen-editshare/goex-app.git
cd goex-app/
# build an image
docker build -t <image-name> .
# run a container using "host" network mode
docker run -d --network host --name <container-name> <image-name>
```

Method described above will work only on Linux hosts, and is not supported on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
As an option you can use [links](https://docs.docker.com/network/links/) or [network](https://docs.docker.com/network/) to conntect your containers.
