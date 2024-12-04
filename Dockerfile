FROM mcr.microsoft.com/devcontainers/base:debian

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# Username and password for the non-root user in the container.
# If these are changed then it is also necessary to change directory
# names in the panel.bash, panel.desktop and devcontainer.json files.
ARG USERNAME=student
ARG PASSWD=student

# Install some base applications.
RUN apt-get install --no-install-recommends -y \
        sudo \
        vim-tiny \
        nano \
        wget \
        curl \
        man \
        git

# Create the non-root user inside the container and give them sudo privlidges.
RUN useradd \
    -m $USERNAME -p "$(openssl passwd -1 $PASSWD)" \
    -s /bin/bash \
    -G sudo

USER $USERNAME
WORKDIR /home/$USERNAME

# Do some basic git configuration.
RUN git config --global credential.helper store \
 && git config --global merge.conflictstyle diff3 \
 && git config --global merge.tool vscode \
 && git config --global mergetool.keepBackup false \
 && git config --global core.editor "nano" \
 && git config --global pull.ff only \
 && git config --global init.defaultBranch main \
 && git config --global safe.directory '*' \
 && echo "" >> .bashrc \
 && echo "source /usr/share/bash-completion/completions/git" >> .bashrc

# Stuff to reduce image size.
USER root
RUN apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

USER $USERNAME
WORKDIR /home/$USERNAME
