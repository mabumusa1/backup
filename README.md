# SteerCampaign Backup Utility

Backup SteerCampaign Client files and Database and upload to S3.

## How to run
```cp .env.example .env`

## Error Code:

- 283: invalid paramters submitted to the backup function
- 239: can't mk directory for tmp backup
- 240: can't copy file system from pod to tmp directory
- 241: can't dump mysql database
- 242: can't compress db file
- 243: can't tar code
- 244: can't copy db file to S3
- 245: can't copy code file to S3

## How to Use

```bash backup.sh -n tadamon -s user```

# Development

## Accessing containers:
There are two containers used in this system: 

1. app: this is the app that runs to do the actual backup it can be accessed via
```docker exec -it app /usr/local/bin/bash```
2. access the database that contains a dump of mySQL database
```mysql -h $DB_HOST -u root -p$DB_PASSWORD```



# To Build and run locally
docker compose build
docker compose up


# Build and Push to AWS ECR:
docker build -t backup_sc .
docker tag backup_sc:latest 111222333444.dkr.ecr.ap-south-1.amazonaws.com/backup_sc:latest
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 111222333444.dkr.ecr.ap-south-1.amazonaws.com
docker push 111222333444.dkr.ecr.ap-south-1.amazonaws.com/backup_sc:latest
