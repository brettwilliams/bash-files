#!/bin/bash
# First, everything is in home directory, cd to it
cd

# SSH keys must be correct.  Sync up if it doesn't look right
# if [[ ! -d .ssh || $(md5sum .ssh/id_rsa.pub | awk '{print $1}') != "ac9a00ee80b3a473f5db8d62ee00ea61" ]]; then
#   echo "INFO: Redoing your .ssh directory, it does not look correct"
#   rm -rf .ssh
#   rsync -az -e ssh darkshore.ftc.avagotech.net:/net/easystreet/vol/homes/brettw/.ssh .
# fi

# Files that just need to be rsynced
rsync_files=".ag_user_info .pager.ini .gitconfig"
for f in $rsync_files; do
  if [[ ! -f $f ]]; then
    echo scp brettw@darkshore.ftc.avagotech.net://net/easystreet/vol/homes/brettw/$f .
  fi
done

# Don't let these get out of sync!
link_srcs=(
github/bash-files/hex
github/bash-files/bashrc
github/bash-files/bash_profile
github/bash-files/dir_colors
github/vim-files/vimrc
github/vim-files
github/bash-files/path.pre
)

link_dsts=(
.hex
.bashrc
.bash_profile
.dir_colors
.vimrc
.vim
.path.pre
)

idx=0
for src_file in ${link_srcs[*]}; do
  dst_file=${link_dsts[$idx]}
  if [[ ! -e $dst_file || $(readlink $dst_file) != $src_file ]]; then
    echo ln -sf $src_file $dst_file
  fi
  idx=$(( $idx + 1 ))
done


dirs_to_create=".hist .vimtmp tmp"
for d in $dirs_to_create; do
  if [[ ! -d $d ]]; then
    echo mkdir -p $d
  fi
done