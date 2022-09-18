FROM ubuntu:latest
RUN apt update \
    && apt -y upgrade \
    && apt install -y curl unzip gzip mariadb-client \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
    && echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN mkdir .kube
COPY kubconfig .kube/config
COPY entrypoint.sh /entrypoint.sh
COPY backup.sh /backup.sh

RUN chmod +x /entrypoint.sh
RUN chmod +x /backup.sh

CMD ["/entrypoint.sh"]
