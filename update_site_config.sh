#!/bin/bash
# First, everything is in home directory, cd to it
cd $HOME || exit 1

# Update this script!  If no argument given, just update here and exec
# self with an argument
if [[ -z "$1" ]]; then
  echo "INFO:  first time, update the update!"
  cd $HOME/github/bash-files
  # TODO:  if no github/bash-files, clone it, clone the other two to bootstrap
  git pull
  cd $HOME
  echo "INFO: execing self"
  exec $HOME/github/bash-files/update_site_config.sh doit
fi
echo "INFO: actually doing the sync"

git_dirs=(
$HOME/github/bash-files
$HOME/github/fluxbox-files
$HOME/github/vim-files
)

for git_dir in ${git_dirs[*]}; do
  cd $git_dir
  git pull
done
cd $HOME

# Files that just need to be rsynced
rsync_files=".ssh .ag_user_info .pager.ini .gitconfig .wizardrc .wizard_post_hook .vnc .synopsys_icc2.setup bin"
for f in $rsync_files; do
  rsync -a -e ssh brettw@darkshore.ftc:/home/brettw/$f .
done

# Gnome terminal settings.  Be careful
mkdir -p .gconf/apps
rsync -a -e ssh brettw@darkshore.ftc:/home/brettw/.gconf/apps/gnome-terminal .gconf/apps


# Don't let these get out of sync!
link_srcs=(
github/bash-files/hex
github/bash-files/bashrc
github/bash-files/bash_profile
github/bash-files/dir_colors
github/vim-files/vimrc
github/vim-files
github/bash-files/path.pre
github/fluxbox-files
)

link_dsts=(
.hex
.bashrc
.bash_profile
.dir_colors
.vimrc
.vim
.path.pre
.fluxbox
)

idx=0
for src_file in ${link_srcs[*]}; do
  dst_file=${link_dsts[$idx]}
  if [[ ! -e $dst_file || $(readlink $dst_file) != $src_file ]]; then
    rm -f $dst_file
    ln -s $src_file $dst_file
  fi
  idx=$(( $idx + 1 ))
done


dirs_to_create=".hist .vimtmp tmp"
for d in $dirs_to_create; do
  if [[ ! -d $d ]]; then
    mkdir -p $d
  fi
done

# Update vim stuff
if [[ ! -d .vim/bundle ]]; then
  cd .vim
  mkdir -p bundle
  ./update_vim_files.rb
  cd -
fi
