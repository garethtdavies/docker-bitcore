FROM ubuntu:xenial
MAINTAINER Nick Thieling <nick@adrift.io>

# EXPOSE 3001 3232 6667 8333 18333 # specify ports at runtime based on services used
HEALTHCHECK --interval=5s --timeout=5s --retries=10 CMD curl -f http://localhost:3001/insight/

RUN apt-get update && apt-get install -y \
  libzmq3-dev \
  build-essential \
  curl
  
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN . ~/.nvm/nvm.sh \
    && nvm install v4 \
    && nvm alias default v4 \
    && npm install bitcore -g

ENTRYPOINT [ "bitcored" ]
