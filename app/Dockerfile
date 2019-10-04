FROM node:12.9-alpine

WORKDIR /app
COPY package.json *yarn* /app/
RUN yarn install

COPY . /app
EXPOSE 8082
