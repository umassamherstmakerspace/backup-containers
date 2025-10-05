FROM node:current-alpine3.21

RUN apk update && apk add jq --no-cache
RUN npm install -g @bitwarden/cli

COPY ./crontab /crontab
COPY ./backup.sh /backup.sh

RUN crontab /crontab

CMD ["/usr/sbin/crond", "-f", "-d", "0"]