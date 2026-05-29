FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Install some base applications.
RUN apt-get install --no-install-recommends -y \
        sudo \
        vim-tiny \
        nano \
        wget \
        curl \
        man \
        git

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
RUN apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*