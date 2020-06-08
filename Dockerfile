# base ubuntu 18.04 image
FROM ubuntu:bionic

## system-wide dependencies
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
build-essential git ffmpeg bc \
python3 python3-dev python3-pip python3-setuptools python3-wheel

# install goex app
WORKDIR /opt/goex-app
COPY ./ /opt/goex-app
RUN pip3 install -r requirements.txt

# run
ENTRYPOINT ["honcho"]
CMD ["start"]
