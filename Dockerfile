FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV CONDA_DIR=/opt/conda
ENV PATH=${CONDA_DIR}/bin:${PATH}

RUN apt update > /dev/null
RUN apt install --no-install-recommends --yes \
        wget curl bzip2 ca-certificates \
        git tini ripgrep bat \
        zsh \
        > /dev/null
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" \
        -- -t half-life -x

ENTRYPOINT ["tini", "--"]
CMD ["/bin/zsh"]
