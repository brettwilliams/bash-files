send-keys "wd ddsk; cds;wde CellView.h" C-m
split-window -v -l 25
send-keys "wd ddsk --WD_CODEX_UPDATE_CODEX_CLONE --WD_CODEX_UPDATE_ACT_CLONE; cds" C-m
select-pane -t 0
split-window -h -l 108
send-keys "ssh darh5-64" C-m
send-keys "wd ddsk --WD_CODEX_UPDATE_CODEX_CLONE --WD_CODEX_UPDATE_ACT_CLONE; cds" C-m
