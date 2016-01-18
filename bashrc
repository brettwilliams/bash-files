umask 002
#. ~/.set_display
test "${-#*i}" != "$-" || return 0
echo "-> .bashrc"

# Load completion function
if [ -r /opt/ictools/bash-completion/bash_completion_loader.sh ]; then
  . /opt/ictools/bash-completion/bash_completion_loader.sh
fi
# System wide bashrc
# if [[ -f /etc/bashrc ]]; then
#   . /etc/bashrc
# fi
# setup hex 
export HEX_DIR=${HOME}/.hex
if [[ -r ${HEX_DIR}/hex ]]; then
    . ${HEX_DIR}/hex
fi

hex_source settings
hex_source aliases
hex_source bash_functions
hex_source bash_completion
#. /etc/bash_completion

hex_source prompt
hex_source wizard
hex_source modules
hex_source projects

# Automatically set display to NX session if not set
#export DISPLAY=${DISPLAY:-$(\ls -1rt ~/.nx | grep -v temp | tail -n 1 | awk 'BEGIN {FS="-"} {print $2":"$3}')}
#xauth add $(hostname)${DISPLAY}.0 $(xauth list ${DISPLAY} | cut -f 2- -d " ")
echo "Hex modules loaded: ${HEX_MODULES_LOADED}"
#if [[ -z "$ALTDISPLAY" && -z "$NXSESSIONID"  && ( $HOSTNAME =~ ^cof ) ]]; then
if [[ -z "$ALTDISPLAY" && ( $HOSTNAME =~ ^cof ) ]]; then
  export PS1=">> "
fi
echo "<- .bashrc"
# USER CODE MUST BE ENTERED ABOVE THIS LINE!
# ICDS-POST-BEGIN - DO NOT EDIT THIS SECTION
# Includes icds builtins - bashrc.poststub
#
#
if [ -n "$ICDS_LAUNCH_MODE" ]
then
    if [ -s $ICDS_SYS/sh/bashrc.cmd ]
    then
        . $ICDS_SYS/sh/bashrc.cmd
    fi
fi
#
# ICDS-POST-END - end ICDS section
#
