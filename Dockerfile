FROM debian:bullseye-slim

RUN apt-get update -y && apt-get full-upgrade -y \
      && apt-get install -y \
        curl sudo zsh openssl xz-utils \
      && useradd -p $(openssl passwd -crypt password) -ms /usr/bin/zsh thomas \
      && usermod -aG sudo thomas \
      && su - thomas && cd /home/thomas \
      && curl -L https://glow-lang.org/install/glow-install | sh

USER thomas
WORKDIR /home/thomas
ENTRYPOINT "zsh"

