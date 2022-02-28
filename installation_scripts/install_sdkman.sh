#!/usr/bin/env bash
# Install SDKMAN
curl -s https://get.sdkman.io | /bin/bash && \
    chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh" && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    mkdir -p $HOME/.sdkman/etc/ && \
    echo "sdkman_auto_answer=true" >> $HOME/.sdkman/etc/config && \
    echo "SDKMAN_DIR=\"/root/.sdkman\"" >> $HOME/.bash_profile && \
    echo "source \"/root/.sdkman/bin/sdkman-init.sh\"" >> $HOME/.bash_profile && \
    echo "Installation succeded"
