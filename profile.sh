#!/usr/bin/env bash

### name:
# .nwtb/profile.sh
### description:
# runs defaults systems, environments and aliases.

# CONFIGURATION VARIABLES
export NWTB=$HOME/.nwtb
export NWTB_PACKAGES=${NWTB}/packages

# PACKAGES VARIABLES
export BASE16_SHELL=${NWTB_PACKAGES}/base16-shell

# ENV VARIABLES
export EDITOR="/usr/bin/emacs -Q"
export PS1="\[\e[0;32m\]\w \$ \[\e[m\] "
export SECRETS="$HOME/.elnawe.secrets/"
export WWW_HOME="https://www.google.com"

# ALIASES
alias g=git

# LAUNCH PACKAGES
[ -n "$PS1" ] && [ -s $BASH16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# LAUNCH TMUX WHEN START
if [ -z "$TMUX" ]; then tmux new-session -A -s nawetimebomb; fi
