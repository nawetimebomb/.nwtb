#!/usr/bin/env bash

### name:
# .nwtb/profile.sh
### description:
# runs defaults systems, environments and aliases.

# VARIABLES
ALEPH_ICON=$'\u2135' # א

# CONFIGURATION VARIABLES
export NWTB=$HOME/.nwtb
export NWTB_PACKAGES=${NWTB}/packages

# ALIASES
alias emacs="emacs -nw"
alias g=git

# ENV VARIABLES
export EDITOR="/usr/bin/emacs -Q -nw"
export PS1=" \[\033[0;92m\]\W ${ALEPH_ICON} \[\033[0;m\] "
export TERM="rxvt-unicode-256color"
export SECRETS="$HOME/.elnawe.secrets/"
export WWW_HOME="https://www.google.com"

# SET VALUES
set +m

# LAUNCH PACKAGES
BASE16_SHELL=$NWTB_PACKAGES/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# LAUNCH TMUX WHEN START
if [ -z "$TMUX" ]; then tmux new-session -A -s main; fi
