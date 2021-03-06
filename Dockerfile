FROM codercom/code-server:3.4.1

USER root

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nano \
    htop \
    net-tools \
    zip \
    build-essential \
    apt-utils \
    wget \
    curl 
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb \
    && rm ./google-chrome-stable_current_amd64.deb
RUN apt-get install -y apt-transport-https sudo ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli
RUN curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose
RUN L=/usr/local/bin/flynn \
    && curl -sSL -A "$(uname -sp)" https://dl.flynn.io/cli | zcat >$L \
    && chmod +x $L
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl
RUN rm -rf /var/lib/apt/lists/*