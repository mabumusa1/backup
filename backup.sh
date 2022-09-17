#!/bin/bash
while true
do
    redis-cli -h $REDIS_HOST -p $REDIS_PORT -a $REDIS_PASSWORD SUBSCRIBE user_queue
    redis-cli -h $REDIS_HOST -p $REDIS_PORT -a $REDIS_PASSWORD SUBSCRIBE system_queue
done
