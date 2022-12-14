FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

COPY entrypoint.sh /entrypoint.sh
COPY backup.sh /backup.sh

RUN apt update \
    && apt -y upgrade \
    && apt install -y --no-install-recommends gzip unzip mariadb-client curl ca-certificates \ 
#    && apt install -y curl \ 
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && rm -rf awscliv2.zip \
    && ./aws/install \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
    && echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
    && mv /tmp/eksctl /usr/local/bin \
    && apt remove -y unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir .kube \
    && mkdir .aws  \
    && chmod +x /entrypoint.sh \
    && chmod +x /backup.sh

#ENV TIMEZONE UTC

#RUN apt install -y bash

#RUN mkdir .kube
#RUN mkdir .aws
#COPY kubconfig ~/.kube/config


#RUN chmod +x /entrypoint.sh
#RUN chmod +x /backup.sh

CMD ["/entrypoint.sh"]
