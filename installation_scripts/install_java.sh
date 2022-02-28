#!/usr/bin/env bash
# Install all compiler version available on SDKMAN of Java, Kotlin, and Groovy.
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# The following do not exist anymore (2/28/2022)
#sdk install java 18.ea.15-open < /dev/null
#sdk install java 18.ea.13-open < /dev/null
#sdk install java 18.ea.7-open < /dev/null
#sdk install java 18.ea.2-open  < /dev/null
#sdk install java 18.ea.2.lm-open < /dev/null
#sdk install java 18.ea.20-open < /dev/null
#sdk install java 18.ea.21-open < /dev/null
sdk install java 18-open < /dev/null
# The following do not exist anymore (2/28/2022)
#sdk install java 17-open < /dev/null
#sdk install java 17.ea.29-open < /dev/null
#sdk install java 17.ea.28-open < /dev/null
#sdk install java 17.ea.22-open < /dev/null
#sdk install java 17.ea.3.pma-open < /dev/null
#sdk install java 17.0.1-open < /dev/null
sdk install java 17.0.2-open < /dev/null
# The following do not exist anymore (2/28/2022)
#sdk install java 16.0.2-open < /dev/null
#sdk install java 16.0.1-open < /dev/null
sdk install java 11.0.12-open < /dev/null
sdk install java 11.0.11-open < /dev/null
sdk install java 11.0.10-open < /dev/null
sdk install java 11.0.2-open < /dev/null
sdk install java 18.ea.35-open < /dev/null
