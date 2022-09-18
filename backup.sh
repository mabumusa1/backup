#!/bin/bash
set -e

DATE_YYMMDD=`TZ='UTC' date "+%Y-%m-%d_%H:%M:%S_%Z"`

## Below should be parameters:
#CLIENT_NAME='stgiabaustralia'
#BACKUP_SOURCE='automated' #automated, user
#INSTALL_ID= install id on the database 
helpFunction()
{
   echo ""
   echo "Usage: $0 -n CLIENT_NAME -s BACKUP_SOURCE"
   echo -e "\t-n CLIENT_NAME"
   echo -e "\t-s BACKUP_SOURCE; automated or user"
   echo -e "\t-i INSTALL_ID: used for updating database"
   exit 1 # Exit script after printing help
}

while getopts "n:s:i:" opt
do
   case "$opt" in
      n ) CLIENT_NAME="$OPTARG" ;;
      s ) BACKUP_SOURCE="$OPTARG" ;;
      i ) INSTALL_ID="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$CLIENT_NAME" ] || [ -z "$BACKUP_SOURCE" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "Backup started for $CLIENT_NAME as $BACKUP_SOURCE backup."

mkdir -p ${TMP_PATH}/${CLIENT_NAME} #|| exit 239;

mysqldump -h${DB_HOST} -u${DB_USERNAME} -p${DB_PASSWORD} --lock-tables=false -B ${CLIENT_NAME} | gzip -c >  ${TMP_PATH}/${CLIENT_NAME}/db.sql.gz  #|| exit 241;

aws s3 cp ${TMP_PATH}/${CLIENT_NAME}/db.sql.gz s3://${S3_BUCKET}/${CLIENT_NAME}/${BACKUP_SOURCE}/${DATE_YYMMDD}/ --storage-class ${S3_STORAGE_CLASS} #|| exit 244;


#kubectl config view
#kubectl describe -n kube-system configmap/aws-auth
#cat ~/.kube/config

kubectl exec ${CLIENT_NAME}-0 -c ${CLIENT_NAME} -- tar cf - /code | tar xf - -C ${TMP_PATH}/${CLIENT_NAME}

tar -zcf ${TMP_PATH}/${CLIENT_NAME}/code.tar.gz ${TMP_PATH}/${CLIENT_NAME}/code 
aws s3 cp ${TMP_PATH}/${CLIENT_NAME}/code.tar.gz s3://${S3_BUCKET}/${CLIENT_NAME}/${BACKUP_SOURCE}/${DATE_YYMMDD}/ --storage-class ${S3_STORAGE_CLASS} 



## curl http:/laravel.app/backup-done/${CLIENT_NAME}?s3uri=s3://${S3_BUCKET}/${CLIENT_NAME}/${BACKUP_SOURCE}/${DATE_YYMMDD}/

echo "Backup completed for $CLIENT_NAME as $BACKUP_SOURCE backup."

#exit 0;

## ADD COMMAND TO UPDATE THE DATABASE WITH THE BACKUP ID AND STATUS
## ADD LOCK to preven two installs from backup at the same time