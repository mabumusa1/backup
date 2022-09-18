FROM bash
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --upgrade redis 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY test.sh /test.sh
RUN chmod +x /test.sh
CMD ["/entrypoint.sh"]