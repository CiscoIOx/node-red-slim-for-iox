FROM node:6-alpine

RUN mkdir -p /usr/src/node-red
RUN mkdir /data

WORKDIR /usr/src/node-red

RUN adduser -h /usr/src/node-red -D -H node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

COPY package.json /usr/src/node-red/

RUN npm config set proxy http://proxy-sjc-1.cisco.com:80/
RUN npm install

EXPOSE 1880

ENV FLOWS=flows.json
