FROM welaika/wordmove:latest
ARG USER_NAME

RUN apt update && apt install -y less vim sudo

RUN groupadd -g 1000 ${USER_NAME} && \
    useradd -u 1000 -g ${USER_NAME} -G sudo ${USER_NAME} && \
    mkdir -p /home/${USER_NAME} && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}
RUN echo '${USER_NAME} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN sed -i 's/@sql_content ||= File.open(sql_path).read/@sql_content ||= File.open(sql_path).read.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode("UTF-8")/' /usr/local/bundle/gems/wordmove-5.2.2/lib/wordmove/sql_adapter/default.rb

USER ${USER_NAME}
