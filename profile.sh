#!/bin/bash

### name:
# .nwtb/profile.sh
### description:
# runs defaults systems, environments and aliases.

# VARIABLES
ALEPH_ICON=$'\u2135' # א
PS1_COLOR='\[\033[38;2;0;135;175m\]'
RESET_COLOR='\[\033[00m\]'

# CONFIGURATION VARIABLES
export NWTB=$HOME/.nwtb
export NWTB_PACKAGES=${NWTB}/packages

# ALIASES
alias editor="emacsclient -t"
alias g=git
alias music=mpsyt
alias reddit=rtv
alias reload-mutt="sh $NWTB/build-org-files.sh --mutt"
alias reload-rtv="sh $NWTB/build-org-files.sh --rtv"
alias reload-termite="sh $NWTB/build-org-files.sh --termite && killall -USR1 termite"
alias reload-tmux="sh $NWTB/build-org-files.sh --tmux && tmux source-file $HOME/.tmux.conf"

# ENV VARIABLES
export EDITOR="emacsclient -t"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PS1="${PS1_COLOR} \W ${ALEPH_ICON}  ${RESET_COLOR}"
export TERMINAL="termite"
export SECRETS="$HOME/.elnawe.secrets/"

# LAUNCH TMUX WHEN START
if [ -z "$TMUX" ]; then tmux new-session -A -s main; fi
