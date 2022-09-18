FROM bash
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --upgrade redis 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY backup.sh /backup.sh
RUN chmod +x /backup.sh
CMD ["/entrypoint.sh"]