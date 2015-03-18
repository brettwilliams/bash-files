# BASH_PROFILE
# Print a message
echo "-> bash_profile"

# Settings for things we want set in noninteractive shells

# Set the default umask
umask 002

# Set the shell timeout to infinity
export TMOUT=0



# Create a custom PATH
if [ -f ${HOME}/.path.pre ]
then
   PATH=$(cat ${HOME}/.path.pre):$PATH
fi
if [ -f ${HOME}/.path.post ]
then
   PATH=$PATH:$(cat ${HOME}/.path.post)
fi
eval PATH=${PATH}:.
export PATH

# MANPATH setup
case $(uname) in
  Linux )
  export MANPATH=$(manpath)
  ;;
esac

# Create a custom MANPATH
if [ -f ${HOME}/.manpath.pre ]
then
   MANPATH=$(cat ${HOME}/.manpath.pre):$MANPATH
fi
if [ -f ${HOME}/.manpath.post ]
then
   MANPATH=$MANPATH:$(cat ${HOME}/.manpath.post)
fi
eval MANPATH=${MANPATH}
export MANPATH

# Now source the ENV file
#export BASH_ENV=${HOME}/.bashrc

if [[ -r ${HOME}/.bashrc ]]; then
   . ${HOME}/.bashrc
fi

export PROFILE_RUN=TRUE
env > /tmp/prof.env
set > /tmp/prof.set
echo "${@}" > /tmp/prof.at
echo "<- bash_profile"

