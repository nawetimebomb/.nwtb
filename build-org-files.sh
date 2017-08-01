#!/bin/bash
# TODO: Add build by options.
# TODO: Add all build types

# SETTINGS

INPUT__CONFIGURATIONS_DIR="$HOME/.nwtb/configurations"

printFormattedMessage() {
    TEXT__PREFIX="\e[1;32m[.nwtb]\e[m"
    PRINT_TEXT=$1
    TEXT__ERROR="\e[1;31mERROR:\e[0;31m"

    if [ $# -eq 2 ] && [ $2 = "t" ]; then
        TEXT__PREFIX="$TEXT__PREFIX $TEXT__ERROR"
    fi

    printf "$TEXT__PREFIX $PRINT_TEXT\n"
}

runEmacsBabel() {
    FILE=$1
    OUTPUT=$2

    emacs --batch --eval "(require 'org)" --eval "(org-babel-tangle-file (symbol-name '$FILE) (symbol-name '$OUTPUT))"
}

buildFor() {
    TYPE=$1

    if [ $TYPE = "--tmux" ]; then
        build_Tmux
    elif [ $TYPE = "--mutt" ]; then
        build_Neomutt
    elif [ $TYPE = "--x" ]; then
        build_X
    elif [ $TYPE = "--i3" ]; then
        build_i3
    elif [ $TYPE = "--rtv" ]; then
        build_Rtv
    elif [ $TYPE = "--termite" ]; then
        build_Termite
    else
        printFormattedMessage "Parameter $TYPE doesn't exist!" "t"
        exit 1
    fi
}

# start   --     rtv/configuration.org
build_Rtv() {
    INPUT__RTV_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/rtv/configuration.org"
    OUTPUT__RTV_CONFIG_DIR="$HOME/.config/rtv"
    OUTPUT__RTV_CONFIG_FILE="$OUTPUT__RTV_CONFIG_DIR/rtv.cfg"

    mkdir -p $OUTPUT__RTV_CONFIG_DIR &&
        runEmacsBabel $INPUT__RTV_CONFIG_FILE $OUTPUT__RTV_CONFIG_FILE
}
# end     --     ~/.config/rtv/rtv.cfg

# start   --     termite/configuration.org
build_Termite() {
    INPUT__TERMITE_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/termite/configuration.org"
    OUTPUT__TERMITE_CONFIG_DIR="$HOME/.config/termite"
    OUTPUT__TERMITE_CONFIG_FILE="$OUTPUT__TERMITE_CONFIG_DIR/config"

    mkdir -p $OUTPUT__TERMITE_CONFIG_DIR &&
        runEmacsBabel $INPUT__TERMITE_CONFIG_FILE $OUTPUT__TERMITE_CONFIG_FILE
}
# end     --     ~/.config/termite/config

# start   --     X/configuration.org
build_X() {
    INPUT__X_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/X/configuration.org"
    OUTPUT__X_CONFIG_FILE="$HOME/.xinitrc"

    runEmacsBabel $INPUT__X_CONFIG_FILE $OUTPUT__X_CONFIG_FILE
}
# end     --     ~/.xinitrc

# start   --     mutt/configuration.org
build_Neomutt() {
    INPUT__MUTT_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/mutt/configuration.org"
    OUTPUT__MUTT_CONFIG_FILE="$HOME/.muttrc"

    runEmacsBabel $INPUT__MUTT_CONFIG_FILE $OUTPUT__MUTT_CONFIG_FILE
}
# end     --     ~/.muttrc

# start   --     tmux/configuration.org
build_Tmux() {
    INPUT__TMUX_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/tmux/configuration.org"
    OUTPUT__TMUX_CONFIG_FILE="$HOME/.tmux.conf"

    runEmacsBabel $INPUT__TMUX_CONFIG_FILE $OUTPUT__TMUX_CONFIG_FILE
}
# end     --     ~/.tmux.conf.org

# start   --     i3/configuration.org
build_i3() {
    INPUT__I3_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/i3/configuration.org"
    OUTPUT__I3_CONFIG_DIR="$HOME/.config/i3"
    OUTPUT__I3_CONFIG_FILE="$OUTPUT__I3_CONFIG_DIR/config"

    mkdir -p $OUTPUT__I3_CONFIG_DIR &&
        runEmacsBabel $INPUT__I3_CONFIG_FILE $OUTPUT__I3_CONFIG_FILE
}
# end     --     ~/.config/i3/config

# RUN

if [ $# -eq 0 ]; then
    printFormattedMessage "Building all configuration files"

    build_Termite
    build_X
    build_Tmux
    build_Neomutt
    build_i3
    build_Rtv

    printFormattedMessage "Done!"

    exit 0
fi

for arg in $@; do
    buildFor $arg
done
