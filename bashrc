umask 002
#. ~/.set_display
test "${-#*i}" != "$-" || return 0
echo "-> .bashrc"

# System wide bashrc
# if [[ -f /etc/bashrc ]]; then
#   . /etc/bashrc
# fi
# setup hex 
export HEX_DIR=${HOME}/.hex
if [[ -r ${HEX_DIR}/hex ]]; then
  . ${HEX_DIR}/hex
  hex_source settings
  hex_source aliases
  hex_source bash_functions
  hex_source bash_completion
  
  hex_source prompt
  hex_source wizard
  hex_source modules
  hex_source projects
  echo "Hex site is $HEX_SITE, Hex arch is $HEX_ARCH"
  echo "Hex modules loaded: ${HEX_MODULES_LOADED}"
fi

# Set display based on the domain, using just default IT supported VDI servers
if [[ -n "$(type dnsdomainname)" ]]; then
    vdi=$(curl --silent "http://unixrnd.sjs.avagotech.net/tools/vdi/util.php?action=getuser_client&userid=$LOGNAME" | grep host= | cut -f 2 -d = | cut -f 1 -d '|' | sort -u | grep $(dnsdomainname) | tail -n 1)
    export DISPLAY=$vdi:1
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
#export DISPLAY=${HOSTNAME}:2
#
# ICDS-POST-END - end ICDS section
#
