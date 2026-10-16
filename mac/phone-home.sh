#!/bin/bash
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

HOSTNAME=$(hostname)
UPTIME=$(uptime | awk -F',' '{print $1}')
BATTERY=$(pmset -g batt | grep -Eo "\d+%" | head -1 || echo "N/A")
IP=$(curl -s --max-time 5 https://ipinfo.io/ip || echo "no-ip")
GEO=$(curl -s --max-time 5 "https://ipinfo.io/${IP}/json" || echo "{}")
WIFI=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s 2>/dev/null | head -6 | tail -5 | tr '\n' '; ' || echo "no-wifi")

MESSAGE="Laptop phone-home
Host: $HOSTNAME
Uptime: $UPTIME
Battery: $BATTERY
IP: $IP
Geo: $GEO
Nearby Wi-Fi: $WIFI"

curl -s --max-time 10 \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  -d text="${MESSAGE}" \
  >/dev/null
