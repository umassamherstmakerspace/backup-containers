FROM alpine:latest

RUN apk update && apk add npm --no-cache
RUN npm install -g @bitwarden/cli

COPY ./crontab /crontab
COPY ./backup.sh /backup.sh

RUN crontab /crontab

CMD ["/usr/sbin/crond", "-f", "-d", "0"]