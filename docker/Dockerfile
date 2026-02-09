FROM archlinux:latest

ARG USERNAME=developer
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Su --noconfirm && \
    pacman -S --noconfirm \
    curl \
    go \
    gopls \
    git \
    shadow \
    starship \
    zellij \
    helix

RUN curl -L https://github.com/exercism/cli/releases/download/v3.5.8/exercism-3.5.8-linux-x86_64.tar.gz \
    | tar -xz -C /usr/bin exercism

RUN mkdir -p /usr/share/bash-completion/completions && \
    exercism completion bash > /usr/share/bash-completion/completions/exercism

RUN groupadd -g $GROUP_ID $USERNAME || true && \
    useradd -m -u $USER_ID -g $GROUP_ID -s /bin/bash $USERNAME || \
    useradd -m -u $USER_ID -s /bin/bash $USERNAME

ENV COLORTERM=truecolor
ENV TERM=xterm-256color

ENV SHELL=/bin/bash
ENV HOME=/home/$USERNAME

ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin

USER $USERNAME

RUN mkdir -p $HOME/.cache \
    && mkdir -p $HOME/go \
    && mkdir -p $HOME/.config/helix \
    && mkdir -p $HOME/.config/zellij \
    && mkdir -p $HOME/.config/exercism

WORKDIR $HOME/project

CMD ["/bin/bash"]
