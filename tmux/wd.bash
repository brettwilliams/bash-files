tmux send-keys "wd ${*}; cds" C-m
tmux select-pane -R
tmux send-keys "sleep 60; wd ${*}; cds" C-m
tmux select-pane -L
