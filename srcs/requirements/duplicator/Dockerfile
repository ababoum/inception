FROM	alpine:3.14

# Update System
RUN apk update && apk upgrade

# Create a backup Folder
RUN mkdir /backup

# load & run backup script to container
COPY	tools/backup_creator.sh /usr/bin/backup_creator.sh
RUN		chmod +x /usr/bin/backup_creator.sh

ENTRYPOINT /usr/bin/backup_creator.sh