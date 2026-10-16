$BOT_TOKEN = "YOUR_BOT_TOKEN"
$CHAT_ID = "YOUR_CHAT_ID"

$hostname = $env:COMPUTERNAME
$uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$battery = (Get-CimInstance Win32_Battery).EstimatedChargeRemaining
if (-not $battery) { $battery = "N/A" }
$ip = (Invoke-RestMethod -Uri "https://ipinfo.io/ip" -TimeoutSec 5) -as [string]
if (-not $ip) { $ip = "no-ip" }
$geo = Invoke-RestMethod -Uri "https://ipinfo.io/$ip/json" -TimeoutSec 5 | ConvertTo-Json -Compress

$message = @"
Laptop phone-home
Host: $hostname
Uptime: $uptime
Battery: $battery%
IP: $ip
Geo: $geo
"@

$body = @{
  chat_id = $CHAT_ID
  text = $message
}

Invoke-RestMethod -Uri "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -Method Post -Body $body -TimeoutSec 10 | Out-Null
