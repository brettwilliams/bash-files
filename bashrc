umask 002
test "${-#*i}" != "$-" || return 0
echo "-> .bashrc"

# System wide bashrc
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi
# setup hex 
export HEX_DIR=${HOME}/.hex
if [[ -r ${HEX_DIR}/hex ]]; then
    . ${HEX_DIR}/hex
fi

hex_source settings
hex_source aliases
hex_source bash_functions
#hex_source bash_completion
#. /etc/bash_completion
hex_source prompt
hex_source wizard
hex_source modules
hex_source projects

# Automatically set display to NX session if not set
export DISPLAY=${DISPLAY:-$(\ls -1rt ~/.nx | grep -v temp | tail -n 1 | awk 'BEGIN {FS="-"} {print $2":"$3}')}
echo "Hex modules loaded: ${HEX_MODULES_LOADED}"
echo "<- .bashrc"
