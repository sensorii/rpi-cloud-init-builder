FROM resin/rpi-raspbian:jessie-20171110

RUN apt update
RUN apt install -y --no-install-recommends \
  build-essential \
  devscripts \
  fakeroot \
  git \
  python

ADD entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh
ENTRYPOINT /entrypoint.sh
