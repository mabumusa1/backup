#!/bin/bash
# Do not start until you get a response from the server
while ! mysqladmin ping -h"$DB_HOST" --silent; do
    sleep 1
done

# Get the records
aws --version
mysql -h$DB_HOST -u$DB_USERNAME -p$DB_PASSWORD -D "db" -NBe "select installs.name, backups.id, backups.type from installs left join backups on installs.id = backups.install_id where backups.status = 'creating';" | while read -r name id type;
do
    bash backup.sh -n $name -s $type -i $id
done    
sleep 5