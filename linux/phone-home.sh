#!/bin/bash
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
BATTERY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "N/A")
IP=$(curl -s --max-time 5 https://ipinfo.io/ip || echo "no-ip")
GEO=$(curl -s --max-time 5 "https://ipinfo.io/${IP}/json" || echo "{}")
WIFI=$(nmcli -t -f SSID,SIGNAL,SECURITY device wifi list 2>/dev/null | head -5 | tr '\n' '; ' || echo "no-wifi")

MESSAGE="Laptop phone-home
Host: $HOSTNAME
Uptime: $UPTIME
Battery: ${BATTERY}%
IP: $IP
Geo: $GEO
Nearby Wi-Fi: $WIFI"

curl -s --max-time 10 \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  -d text="${MESSAGE}" \
  >/dev/null
