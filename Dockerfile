FROM debian:bullseye-slim

RUN apt-get update -y && apt-get full-upgrade -y \
      && apt-get install -y \
        curl sudo zsh openssl xz-utils \
      && useradd -p $(openssl passwd -crypt password) -ms /usr/bin/zsh thomas \
      && usermod -aG sudo thomas \
      && echo 'thomas ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/010_thomas-nopasswd

USER thomas
WORKDIR /home/thomas

RUN curl -L https://glow-lang.org/install/glow-install | sh

ENTRYPOINT "zsh"

