#!/usr/bin/env bash

CURRENT_SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
NWTB_DIR=$HOME/.nwtb
NWTB_PROFILE=$HOME/.nwtb/profile.sh
NWTB_TEXT="\n## DO NOT REMOVE\n# .nwtb\n# https://github.com/elnawe/.nwtb\nsource ${NWTB_PROFILE}\n"

NWTB_PREFIX="\n\e[1m[.nwtb]\e[m"

# Move everything to ~/.nwtb
printf "${NWTB_PREFIX} Check if current dir is ~/.nwtb"

if [ $NWTB_DIR != "$CURRENT_SCRIPT_DIR" ]; then
    printf "${NWTB_PREFIX} \e[0;31mFailed! Moving files to ~/.nwtb"
    mv $CURRENT_SCRIPT_DIR $NWTB_DIR
    cd $NWTB_DIR
else
    printf "${NWTB_PREFIX} \e[0;32mSuccess! \e[mFolder is ~/.nwtb"
fi

# Add line to bash init file
printf "${NWTB_PREFIX} Check for bash init file."
if [ -f $HOME/.bashrc ]; then
    printf "${NWTB_PREFIX} File is .bashrc. Setting profile.sh..."
    printf "${NWTB_TEXT}" >> $HOME/.bashrc
elif [ -f $HOME/.bash_profile ]; then
    printf "${NWTB_PREFIX} File is .bash_profile. Setting.profile.sh..."
    printf "${NWTB_TEXT}" >> $HOME/.bash_profile;
fi

printf "${NWTB_PREFIX} Done."

# Install Tmux
printf "${NWTB_PREFIX} Creating symlink for Tmux configuration"

TMUX_FILE=~/.tmux.conf

if [ -f $TMUX_FILE ]; then
    printf "${NWTB_PREFIX} \e[0;31mWarning: \e[mA configuration of Tmux exists. Renaming to .tmux.conf.bak"
    rm ~/.tmux.conf.bak
    mv $TMUX_FILE ~/.tmux.conf.bak
fi

ln -s ~/.nwtb/.tmux.conf $TMUX_FILE

# Install Tmux Package Manager
printf "${NWTB_PREFIX} Checking for Tmux Package Manager"

TMUX_TPM_DIR=~/.tmux/plugins/tpm/

if [ -f $TMUX_TPM_DIR/tpm ]; then
    printf "${NWTB_PREFIX} Tmux Package Manager already installed!"
else
    printf "${NWTB_PREFIX} Cloning Tmux Package Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
fi

printf "\n${NWTB_PREFIX} \e[5;92mInstallation complete.\n"
