#! /bin/bash
export NWTB_CONFIG_DIR="~/.nwtb"

set +m
setxkbmap us
setxkbmap -variant altgr-intl
setxkbmap -option ctrl:nocaps

unclutter -root -visible &

compton --config $NWTB_CONFIG_DIR/compton.conf &

i3
