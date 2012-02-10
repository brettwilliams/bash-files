#!/bin/bash

rsync_cmd="rsync"
#rsync_cmd="echo rsync"
rsync_opts="-rtLgpva --delete"
dstdir_base="/cygdrive/e/BlackLaptopBackup"

# backup_dirs uses --delete, so this is something that the
# main copy is on the host, not the external drive
declare -A backup_dirs

backup_dirs["/cygdrive/c/Users/Becky/Documents"]="${dstdir_base}/Becky/Documents"

for bdir in "${!backup_dirs[@]}"; do
  mkdir -p ${backup_dirs["$bdir"]}
  $rsync_cmd $rsync_opts "$bdir/" "${backup_dirs["$bdir"]}"
done
