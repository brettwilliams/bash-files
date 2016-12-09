tmux select-pane -L
tmux send-keys "wd ${*}; cds" C-m
tmux rename-window "${1}->$(hostname)"
tmux select-pane -R
if [[ $HEX_ARCH == "osx" ]]; then
  tmux send-keys "wd ${*}; cds" C-m
  tmux new-window 
  tmux rename-window "BUILD->ftc"
  tmux send-keys "ssh -X ftc" C-m
  tmux send-keys "wd ${*}; cds" C-m
  tmux previous-window
else
  tmux send-keys "sleep 60; wd ${*}; cds" C-m
fi
tmux select-pane -L
