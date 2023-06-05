#!/bin/sh
swaybg -i $(find img/. -type f | shuf -n1) -m fill &
OLD_PID=$!
while true; do
    sleep 600
    swaybg -i $(find img/. -type f | shuf -n1) -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done

00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[0] = swaybg
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[1] = -o
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[2] = *
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[3] = -i
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[4] = /home/shnaps/Pictures/wallpaper.jpg
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[5] = -m
00:00:00.730 [DEBUG] [sway/config/output.c:889] spawn_swaybg cmd[6] = fill