if [[ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '/MUTED/{print $3}')" = "[MUTED]" ]];
then notify-send.sh " Volume" "Speakers switched OFF";
else notify-send.sh " Volume" "Speakers switched ON";
fi