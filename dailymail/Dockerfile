FROM alpine:latest
LABEL maintainer strokovnjaka

RUN apk add --update --no-cache python3

## Copy mailto script
COPY mailto.py /home

CMD python3 /home/mailto.py