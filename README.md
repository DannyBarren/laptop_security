# Laptop Security — Phone-Home Location Tracker

A simple, free, open-source way to get a location notification the moment your laptop connects to any network (or changes networks).

**What it does**
- Sends a message (IP, approximate location, nearby Wi-Fi, hostname, uptime, battery) to Telegram (or any similar bot platform) on:
  - Boot / first network connection
  - Network change (new Wi-Fi, Ethernet, hotspot, etc.)
- Works as a lightweight backup to commercial tools like Prey.
- No ongoing cost if you use Telegram.

**Supported platforms**
- Linux (Ubuntu / NetworkManager)
- macOS
- Windows

## Quick Start

1. Create a Telegram bot with [@BotFather](https://t.me/BotFather) and note the **BOT_TOKEN**.
2. Message your bot once, then visit `https://api.telegram.org/bot<BOT_TOKEN>/getUpdates` to get your **CHAT_ID**.
3. Follow the platform-specific instructions below.

## Platform Guides

- [Linux](linux/README.md)
- [macOS](mac/README.md)
- [Windows](windows/README.md)

## Security Notes

- Keep your BOT_TOKEN private.
- This is a detection tool, not a lock. Pair it with BIOS/UEFI password + Secure Boot + disabled external boot for best results.
- A determined attacker with physical access and time can still remove software. The goal is to make opportunistic theft much harder and give you a recovery signal.

## License

MIT — use, modify, and share freely.
