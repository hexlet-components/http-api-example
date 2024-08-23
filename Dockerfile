FROM node:22-alpine3.19

RUN apk add --no-cache make

WORKDIR /app
COPY package.json package-lock.json .

RUN npm install

COPY ./ .

EXPOSE 4010

CMD ["/bin/sh", "-c", "make mock"]
