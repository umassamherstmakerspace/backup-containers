FROM node:current-alpine3.21

ENV CRONTAB="0 0 * * *"

RUN apk update && apk add jq --no-cache
RUN npm install -g @bitwarden/cli

COPY ./entrypoint.sh /entrypoint.sh
COPY ./backup.sh /backup.sh

CMD ["/entrypoint.sh"]