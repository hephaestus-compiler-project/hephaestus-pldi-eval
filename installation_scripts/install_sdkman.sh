#!/usr/bin/env bash
# Install SDKMAN
curl -s https://get.sdkman.io | /bin/bash && \
    chmod a+x "${HOME}/.sdkman/bin/sdkman-init.sh" && \
    source "${HOME}/.sdkman/bin/sdkman-init.sh" && \
    mkdir -p ${HOME}/.sdkman/etc/ && \
    echo "sdkman_auto_answer=true" >> ${HOME}/.sdkman/etc/config && \
    echo "Installation succeded"
