wd=${1}
echo "Setting up ssh sessions to distrib queue $site"
tmux send-keys "qrsh -l distrib=true -l free_cpu=16" C-m
tmux send-keys "wd $wd" C-m
tmux send-keys "t=CB/modules/$wd" C-m
tmux select-pane -R
# close second pane, don't need it, easier than template
tmux send-keys "exit" C-m
