#!/bin/bash
proj_dir=${HOME}/.tmux
export PATH=${HOME}/programs/bin:$PATH
project="${1}"
# Check if it is already started
matching=$(tmux ls | grep "^$project:")
if [[ -n $matching ]]; then
  echo "INFO: Found a match for $project"
else
  echo "INFO: Making a new tmux session for $project"
  tmux -2 new-session -d -s $project
  proj_file="$HOME/.tmux/$project.tmux"
  if [[ -f $proj_file ]]; then
    echo "INFO: Using custom project file $proj_file"
    tmux source-file $proj_file
  else
    echo "INFO: Using default project file $proj_file"
    tmux split-window -v
    tmux select-pane -t 0
    tmux send-keys "wd $project; cds" "C-m"
    tmux resize-pane -D 10
    tmux select-pane -t 1
    tmux send-keys "wd $project --WD_CODEX_UPDATE_CODEX_CLONE --WD_CODEX_UPDATE_ACT_CLONE; cds" "C-m"
  fi
fi
echo "INFO: attaching to $project"
tmux -2 attach -t $project
exit 0
