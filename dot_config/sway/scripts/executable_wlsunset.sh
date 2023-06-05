#!/bin/sh
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
else
  echo "IPv4 is down"
fi

if [ -z ${longitude+x} ] || [ -z ${latitude+x} ]; then
    GEO_CONTENT=$(curl -sL http://ip-api.com/json/)
fi
longitude=${longitude:-$(echo "$GEO_CONTENT" | jq '.lon // empty')}
longitude=${longitude:-$fallback_longitude}
latitude=${latitude:-$(echo "$GEO_CONTENT" | jq '.lat // empty')}
latitude=${latitude:-$fallback_latitude}
echo longitude: "$longitude" latitude: "$latitude"
wlsunset -l "$latitude" -L "$longitude" &