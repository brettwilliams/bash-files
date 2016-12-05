tmux select-pane -L
tmux send-keys "wd ${*}; cds" C-m
tmux select-pane -R
#if [[ $ITERM2 -eq 1 ]]; then
  echo "XXXXXX"
  tmux send-keys "ssh ftc" C-m
  tmux send-keys "wd ${*}; cds" C-m
#else
#  tmux send-keys "sleep 60; wd ${*}; cds" C-m
#fi
tmux select-pane -L
