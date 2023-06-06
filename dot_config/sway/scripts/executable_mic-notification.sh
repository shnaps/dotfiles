if [[ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '/MUTED/{print $3}')" = "[MUTED]" ]];
then notify-send.sh " Mic" " Mic muted";
else notify-send.sh " Mic" " Mic unmuted";
fi