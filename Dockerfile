FROM node:4-stretch
MAINTAINER Nick Thieling <nick@adrift.io>

# EXPOSE 3001 3232 6667 8333 18333 # specify ports at runtime based on services used
HEALTHCHECK --interval=5s --timeout=5s --retries=10 CMD curl -f http://localhost:3001/insight/

RUN apt-get update && apt-get install -y \
  libzmq3-dev \
  build-essential
  
RUN npm install -g bitcore@4.1.0 # must pin for now https://github.com/bitpay/bitcore/issues/1454

ENTRYPOINT [ "bitcored" ]
