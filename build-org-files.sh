# TODO: Add build by options.
# TODO: Add all build types

INPUT__CONFIGS_DIR="$HOME/.nwtb/configs"

runEmacsBabel() {
    FILE=$1
    OUTPUT=$2

    emacs --batch --eval "(require 'org)" --eval "(org-babel-tangle-file (symbol-name '$FILE) (symbol-name '$OUTPUT))"
}

# start   --     i3/config.org
INPUT__I3_CONFIG_FILE="$INPUT__CONFIGS_DIR/i3/config.org"
OUTPUT__I3_CONFIG_DIR="$HOME/.config/i3"
OUTPUT__I3_CONFIG_FILE="$OUTPUT__I3_CONFIG_DIR/config"

mkdir -p $OUTPUT__I3_CONFIG_DIR &&
    runEmacsBabel $INPUT__I3_CONFIG_FILE $OUTPUT__I3_CONFIG_FILE
# end     --     i3/config.org
