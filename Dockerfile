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
RUN apt install -yq python3.9-distutils


# Create the hephaestus user.
RUN useradd -ms /bin/bash hephaestus && \
    echo hephaestus:hephaestus | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'hephaestus ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
USER hephaestus
ENV HOME /home/hephaestus
WORKDIR ${HOME}

# Install missing python packages
RUN pip3 install --upgrade setuptools

USER hephaestus

RUN touch ${HOME}/.bash_profile
RUN echo "source ${HOME}/.bash_profile" >> ${HOME}/.bashrc

# Create directory for helper installation scripts
RUN mkdir ${HOME}/installation_scripts

# Install sdkman
ADD ./installation_scripts/install_sdkman.sh ${HOME}/installation_scripts/install_sdkman.sh
RUN ${HOME}/installation_scripts/install_sdkman.sh
ENV SDKMAN_DIR="${HOME}/.sdkman"

# Install all compiler versions
ADD ./installation_scripts/install_java.sh ${HOME}/installation_scripts/install_java.sh
SHELL ["/bin/bash", "-c"] 
RUN source .sdkman/bin/sdkman-init.sh && sdk update
RUN ${HOME}/installation_scripts/install_java.sh

ADD ./installation_scripts/install_kotlin.sh ${HOME}/installation_scripts/install_kotlin.sh
RUN ${HOME}/installation_scripts/install_kotlin.sh

ADD ./installation_scripts/install_groovy.sh ${HOME}/installation_scripts/install_groovy.sh
RUN ${HOME}/installation_scripts/install_groovy.sh

# Now cleanup helper scripts
RUN sudo rm -rf ${HOME}/installation_scripts

# Add source code
ADD ./hephaestus ${HOME}/hephaestus

RUN sudo chown -R hephaestus:hephaestus ${HOME}/hephaestus

# Run hephaestus
RUN cd ${HOME}/hephaestus/ && python setup.py test

# Install hephaestus 
RUN cd ${HOME}/hephaestus/ && python setup.py install --prefix /home/hephaestus/.local/
RUN echo "export PATH=$PATH:/home/hephaestus/.local/bin" >> ${HOME}/.bash_profile

# TODO move this in the begining 
RUN sudo apt install sqlite3
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade distlib
RUN pip3 install --upgrade pip
RUN pip3 install seaborn pandas matplotlib

# Coverage dependencies: Install JaCoCo and all compilers
RUN mkdir ${HOME}/coverage
WORKDIR ${HOME}/coverage
# Install Groovy
RUN source ${HOME}/.sdkman/bin/sdkman-init.sh && \
    sdk use java 11.0.2-open && \
    git clone https://github.com/apache/groovy.git && \
    cd groovy && \
    git checkout 538374a1799947912496bf3a9aa8590cf5e38a75 && \
    ./gradlew -p bootstrap && ./gradlew clean dist

# Install Kotlin
RUN source ${HOME}/.sdkman/bin/sdkman-init.sh && \
    sdk install java 8.0.265-open && \
    sdk use java 8.0.265-open && \
    echo "JAVA_HOME=${HOME}/.sdkman/candidates/java/8.0.265-open/" >> ${HOME}/.bash_profile  && \
    echo "JDK_16=$HOME/.sdkman/candidates/java/8.0.265-open/" >> $HOME/.bash_profile && \
    echo "JDK_17=$HOME/.sdkman/candidates/java/8.0.265-open/" >> $HOME/.bash_profile && \
    echo "JDK_18=$HOME/.sdkman/candidates/java/8.0.265-open/" >> $HOME/.bash_profile && \
    source $HOME/.bash_profile && \
    git clone https://github.com/JetBrains/kotlin.git && \
    cd kotlin && \
    git checkout 3ccbd25856ccfc3942a563e4833d87c7d5865c7f && \
    ./gradlew -Dhttp.socketTimeout=60000 -Dhttp.connectionTimeout=60000 dist

# Install Java
RUN source ${HOME}/.sdkman/bin/sdkman-init.sh && \
    sdk use java 18.ea.35-open 
RUN git clone https://github.com/openjdk/jdk.git 
RUN git checkout c79a485f1c3f9c0c3a79b8847fdcd50a141cd529
WORKDIR ${HOME}/coverage/jdk
RUN bash configure
RUN make jdk

WORKDIR ${HOME}
