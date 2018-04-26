FROM node:4
MAINTAINER Nick Thieling <nick@adrift.io>

EXPOSE 3001 3232 6667 8333 18333
HEALTHCHECK --interval=5s --timeout=5s --retries=10 CMD curl -f http://localhost:3001/insight/

RUN apt-get install libzmq3-dev build-essential
RUN npm install -g bitcore

ENTRYPOINT [ "bitcored" ]
