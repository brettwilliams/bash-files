tmux send-keys "wd ${*}; cds" C-m
tmux select-pane -R
tmux send-keys "sleep 15; wd ${*}; cds" C-m
tmux select-pane -L
