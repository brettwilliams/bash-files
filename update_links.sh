#!/bin/bash

cd
rsync_files=".ag_user_info .pager.ini .gitconfig"

for f in $rsync_files; do
  if [[ ! -f $f ]]; then
    echo scp brettw@darkshore.ftc.avagotech.net://net/easystreet/vol/homes/brettw/$f .
  fi
done

declare -A links
links[github/bash-files/hex]=.hex
links[github/bash-files/bashrc]=.bashrc
links[github/bash-files/bash_profile]=.bash_profile
links[github/bash-files/dir_colors]=.dir_colors
links[github/vim-files/vimrc]=.vimrc
links[github/vim-files]=.vim
links[github/bash-files/path.pre]=.path.pre

for src_file in "${!links[@]}"; do
  dst_file=${links[$src_file]}
  if [[ ! -e $dst_file ]]; then
    echo "ln -s $src_file "
  fi
done


dirs_to_create=".hist .vimtmp tmp"
for d in $dirs_to_create; do
  if [[ ! -d $d ]]; then
    echo mkdir -p $d
  fi
done
