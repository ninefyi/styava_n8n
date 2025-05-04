FROM alpine:3.15.4

RUN apk update
RUN apk add --no-cache git
RUN apk add --no-cache docker-engine
RUN apk add --no-cache docker-cli
RUN apk add --no-cache docker-compose

ADD ./app /app

EXPOSE 8000
EXPOSE 35729
EXPOSE 3000
EXPOSE 1313