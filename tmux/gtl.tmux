split-window -v
select-pane -t 0
send-keys "wd gtl; cds;wde agtl.h" C-m
resize-pane -D 10
select-pane -t 1
send-keys "wd gtl --WD_CODEX_UPDATE_CODEX_CLONE --WD_CODEX_UPDATE_ACT_CLONE; cds" C-m
split-window -h
send-keys "ssh darh5-64" C-m
send-keys "wd gtl --WD_CODEX_UPDATE_CODEX_CLONE --WD_CODEX_UPDATE_ACT_CLONE; cddvl11" C-m
select-pane -t 0
