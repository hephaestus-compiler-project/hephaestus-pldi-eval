FROM ubuntu:18.04

ENV TZ=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -yq && apt upgrade -yq
RUN apt install -y vim software-properties-common git curl unzip zip sudo
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt -yqq update && \
    apt -yqq install python3.9 python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Create the hephaestus user.
RUN useradd -ms /bin/bash hephaestus && \
    echo hephaestus:hephaestus | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'hephaestus ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
USER hephaestus
ENV HOME /home/hephaestus
WORKDIR ${HOME}

USER hephaestus

RUN touch ${HOME}/.bash_profile

# Create directory for helper installation scripts
RUN mkdir ${HOME}/installation_scripts

# Install sdkman
ADD ./installation_scripts/install_sdkman.sh ${HOME}/installation_scripts/install_sdkman.sh
RUN ${HOME}/installation_scripts/install_sdkman.sh
ENV SDKMAN_DIR="$HOME/.sdkman"

# Install all compiler versions
ADD ./installation_scripts/install_java.sh ${HOME}/installation_scripts/install_java.sh
SHELL ["/bin/bash", "-c"] 
RUN source .sdkman/bin/sdkman-init.sh && sdk update
RUN ${HOME}/installation_scripts/install_java.sh

ADD ./installation_scripts/install_kotlin.sh ${HOME}/installation_scripts/install_kotlin.sh
RUN ${HOME}/installation_scripts/install_kotlin.sh

ADD ./installation_scripts/install_groovy.sh ${HOME}/installation_scripts/install_groovy.sh
RUN ${HOME}/installation_scripts/install_groovy.sh

RUN echo "source $HOME/.bash_profile >> $HOME/.bashrc"

# Now cleanup helper scripts
RUN sudo rm -rf ${HOME}/installation_scripts

# Add source code
ADD ./hephaestus ${HOME}/hephaestus

# Install hephaestus
RUN cd ${HOME}/hephaestus/ 
