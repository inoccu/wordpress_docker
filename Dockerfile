FROM wordpress:latest
ARG USER_NAME

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp --info

RUN apt update && apt install -y less vim sudo

RUN groupadd -g 1000 ${USER_NAME} && \
    useradd -u 1000 -g ${USER_NAME} ${USER_NAME} && \
    mkdir -p /home/${USER_NAME} && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}

RUN echo '${USER_NAME} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
