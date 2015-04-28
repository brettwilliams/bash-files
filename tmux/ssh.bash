site=${1}
echo "Setting up ssh sessions to site $site"
tmux send-keys "ssh $site" C-m
tmux select-pane -R
tmux send-keys "ssh $site" C-m
