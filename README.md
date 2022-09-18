# Backup utility

This a script that backups installs and then store them on S3

## Accessing containers:
There are two containers used in this system: 

1. app: this is the app that runs to do the actual backup it can be accessed via
```docker exec -it app /usr/local/bin/bash```
2. tester:this is the app that sends push requests to redis queues, it can be accessed via 
```docker exec -it tester /usr/local/bin/bash```

## Useful Commands: 

1. Log in to redis via cli 
```redis-cli -h $REDIS_HOST -p $REDIS_PORT -a $REDIS_PASSWORD```

2. Push a message
```redis-cli -h $REDIS_HOST -p $REDIS_PORT -a $REDIS_PASSWORD -r 10 lpush user x```
