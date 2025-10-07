echo "$CRONTAB ash /backup.sh" > /crontab
crontab /crontab
/usr/sbin/crond -f -d 0