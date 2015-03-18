split-window -h
select-pane -t 0
send-keys "wd act-techfiles -c hall -a act-0.9 -p cln16 -d /net/railyard/vol/firstencounter/vah/16nm/; cds" C-m
select-pane -t 1
send-keys "wd act-techfiles -c hall -a act-0.9 -p cln16 -d /net/railyard/vol/firstencounter/vah/16nm ; cds" C-m
