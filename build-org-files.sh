# TODO: Add build by options.
# TODO: Add all build types

INPUT__CONFIGURATIONS_DIR="$HOME/.nwtb/configurations"

runEmacsBabel() {
    FILE=$1
    OUTPUT=$2

    emacs --batch --eval "(require 'org)" --eval "(org-babel-tangle-file (symbol-name '$FILE) (symbol-name '$OUTPUT))"
}

# start   --     mutt/configuration.org
INPUT__MUTT_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/mutt/configuration.org"
OUTPUT__MUTT_CONFIG_FILE="$HOME/.muttrc"

runEmacsBabel $INPUT__MUTT_CONFIG_FILE $OUTPUT__MUTT_CONFIG_FILE
# end     --     ~/.muttrc


# start   --     tmux/configuration.org
INPUT__TMUX_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/tmux/configuration.org"
OUTPUT__TMUX_CONFIG_FILE="$HOME/.tmux.conf"

runEmacsBabel $INPUT__TMUX_CONFIG_FILE $OUTPUT__TMUX_CONFIG_FILE
# end     --     ~/.tmux.conf.org

# start   --     i3/configuration.org
INPUT__I3_CONFIG_FILE="$INPUT__CONFIGURATIONS_DIR/i3/configuration.org"
OUTPUT__I3_CONFIG_DIR="$HOME/.config/i3"
OUTPUT__I3_CONFIG_FILE="$OUTPUT__I3_CONFIG_DIR/config"

mkdir -p $OUTPUT__I3_CONFIG_DIR &&
    runEmacsBabel $INPUT__I3_CONFIG_FILE $OUTPUT__I3_CONFIG_FILE
# end     --     ~/.config/i3/config
