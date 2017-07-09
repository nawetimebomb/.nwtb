#!/usr/bin/env bash

CURRENT_SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
NWTB_DIR=$HOME/.nwtb
NWTB_PROFILE=$HOME/.nwtb/profile.sh
NWTB_TEXT="\n## DO NOT REMOVE\n# .nwtb\n# https://github.com/elnawe/.nwtb\nsource ${NWTB_PROFILE}\n"

NWTB_PREFIX="\e[1m[.nwtb]\e[m"

# Move everything to ~/.nwtb
echo -e "${NWTB_PREFIX} Check if current dir is ~/.nwtb"

if [ $NWTB_DIR != "$CURRENT_SCRIPT_DIR" ]; then
    echo -e "${NWTB_PREFIX} \e[0;31mFailed! Moving files to ~/.nwtb"
    mv $CURRENT_SCRIPT_DIR $NWTB_DIR
    cd $NWTB_DIR
else
    echo -e "${NWTB_PREFIX} \e[0;32mSuccess! \e[mFolder is ~/.nwtb"
fi

# Add line to bash init file
echo -e "${NWTB_PREFIX} Check for bash init file."
if [ -f $HOME/.bashrc ]; then
    echo -e "${NWTB_PREFIX} File is .bashrc. Installing..."
    printf "${NWTB_TEXT}" >> $HOME/.bashrc
elif [ -f $HOME/.bash_profile ]; then
    echo -e "${NWTB_PREFIX} File is .bash_profile. Installing..."
    printf "${NWTB_TEXT}" >> $HOME/.bash_profile;
fi

echo -e "${NWTB_PREFIX} \e[0;92mInstallation complete."
