#!/bin/bash

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
alias editor="emacsclient -t"
alias reload-mutt="sh $NWTB/build-org-files.sh --mutt"
alias reload-termite="sh $NWTB/build-org-files.sh --termite && killall -USR1 termite"
alias reload-tmux="sh $NWTB/build-org-files.sh --tmux && tmux source-file $HOME/.tmux.conf"
alias g=git

# ENV VARIABLES
export EDITOR="emacsclient -t"
export PS1=" \[\033[0;92m\]\W ${ALEPH_ICON} \[\033[0;m\] "
export TERMINAL="termite"
export SECRETS="$HOME/.elnawe.secrets/"

# LAUNCH TMUX WHEN START
if [ -z "$TMUX" ]; then tmux new-session -A -s main; fi
