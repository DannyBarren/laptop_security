# Laptop Security Phone-Home

Open-source, zero-cost location tracking that phones home whenever your laptop connects to a network (boot, wake, or network change).

This is a lightweight backup to services like Prey. It works on Linux, macOS, and Windows.

## What it does

When the laptop gains any network connection, a small script sends a Telegram message containing:
- Hostname
- Uptime
- Battery percentage
- Public IP and geolocation (city, region, coordinates)
- Nearby Wi-Fi networks (where available)

It runs automatically on network-up events and on boot. No always-on agent required.

## Prerequisites (all platforms)

1. Create a Telegram bot:
   - Message [@BotFather](https://t.me/BotFather) on Telegram
   - Send `/newbot` and follow the prompts
   - Copy the bot token
2. Get your chat ID:
   - Open a chat with your new bot and send any message (e.g. "hello")
   - Visit `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates`
   - Look for `"chat":{"id":` — that number is your chat ID
3. Replace the placeholders in the script for your OS.

## Linux

See the [`Linux/`](Linux/) folder.

1. Copy `phone-home.sh` to `/usr/local/bin/franklin-ping` (or any path) and make it executable.
2. Edit the bot token and chat ID inside the script.
3. Create the NetworkManager dispatcher so it runs on network-up and connectivity changes:

```bash
sudo nano /etc/NetworkManager/dispatcher.d/99-phone-home
```

```bash
#!/bin/bash
if [ "$2" = "up" ] || [ "$2" = "connectivity-change" ]; then
  /usr/local/bin/franklin-ping
fi
```

```bash
sudo chmod 755 /etc/NetworkManager/dispatcher.d/99-phone-home
```

Test with: `/usr/local/bin/franklin-ping`

## macOS

See the [`Mac/`](Mac/) folder.

1. Copy the script and make it executable.
2. Use a LaunchAgent or a Network configuration profile / `launchctl` to run it on network changes.
3. A simple approach is a LaunchAgent that runs on network changes via `networksetup` monitoring or a periodic check combined with a connectivity trigger.

Detailed steps are in the Mac folder README (or expand as needed).

## Windows

See the [`Windows/`](Windows/) folder.

1. Use the PowerShell script.
2. Create a Scheduled Task that triggers on network connection events or at logon + network available.
3. Or use the Task Scheduler "On an event" trigger for network changes.

## Security notes

- Keep your bot token private. Anyone with the token can control the bot.
- This does not encrypt your drive or prevent BIOS/OS changes. Pair it with BIOS password + disabled external boot + Secure Boot for stronger protection against casual thieves.
- A determined attacker who never connects the device to a network (or uses a VPN/router that blocks outbound) will not trigger a ping.

## License

MIT — use freely, improve, and share.
