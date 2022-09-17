#!/bin/bash
while true
do
    redis-cli -h $REDIS_HOST -p $REDIS_PORT -a $REDIS_PASSWORD PING
done
