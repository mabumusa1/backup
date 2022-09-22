#!/bin/bash
# Do not start until you get a response from the server

set -e

ls -lh

cat <<EOT >> .aws/credentials
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOT

cat <<EOT >> .aws/config
[default]
region = $AWS_DEFAULT_REGION
EOT


#eksctl get iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_DEFAULT_REGION


### Run once
# eksctl create iamidentitymapping \
    # --cluster $EKS_CLUSTER_NAME \
    # --region=$AWS_DEFAULT_REGION \
    # --arn arn:aws:iam::$AWS_ACCOUNT_ID:role/$AWS_EKS_ROLE \
    # --group eks-console-dashboard-full-access-group \
    # --no-duplicate-arns
	
# eksctl create iamidentitymapping \
    # --cluster $EKS_CLUSTER_NAME \
    # --region=$AWS_DEFAULT_REGION \
    # --arn arn:aws:iam::$AWS_ACCOUNT_ID:user/$AWS_EKS_USER \
    # --group eks-console-dashboard-restricted-access-group \
    # --no-duplicate-arns

#eksctl get iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_DEFAULT_REGION

aws eks update-kubeconfig --region $AWS_DEFAULT_REGION --name $EKS_CLUSTER_NAME

#kubectl describe configmap -n kube-system aws-auth

while ! mysqladmin ping -h"$DB_HOST" --silent; do
    sleep 1
done

# Get the records
#aws --version

echo "Backup started for requested clients."

mysql -h$DB_HOST -u$DB_USERNAME -p$DB_PASSWORD -D $DB_DATABASE -NBe "select installs.name, backups.id, backups.type from installs left join backups on installs.id = backups.install_id where backups.status = 'initial';" | while read -r name id type;
do
    bash backup.sh -n $name -s $type -i $id
done

echo "Backup completed for All."

#sleep 5

exit 0

