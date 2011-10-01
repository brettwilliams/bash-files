#!/bin/bash

rsync_cmd="rsync"
#rsync_cmd="echo rsync"
rsync_opts="-rtLgpva --delete" 
dstdir_base="/media/HITACHI/StrongbadBackup"

# backup_dirs uses --delete, so this is something that the main
# copy is on the host, not the external drive
declare -A backup_dirs
backup_dirs["/mnt/vol/mp3"]="${dstdir_base}/mp3"
backup_dirs["/mnt/vol/video"]="${dstdir_base}/video"
backup_dirs["/mnt/data/pictures"]="${dstdir_base}/pictures"
backup_dirs["/mnt/data/sound_effects"]="${dstdir_base}/sound_effects"
backup_dirs["/mnt/data/video_game_music"]="${dstdir_base}/video_game_music"
backup_dirs["/mnt/data/Games/Emulation"]="${dstdir_base}/Emulation"

for bdir in "${!backup_dirs[@]}"; do 
  $rsync_cmd $rsync_opts $bdir/ ${backup_dirs["$bdir"]}
done
