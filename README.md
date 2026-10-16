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

## BIOS / UEFI Hardening (Stop Easy OS Wipes)

These steps make it much harder for a thief to boot a live USB and wipe your OS or data. Do them before or alongside the phone-home setup.

### Linux (and most PCs)
1. Reboot and enter BIOS/UEFI setup (usually **Esc**, **F2**, **F10**, or **Del** at the manufacturer logo).
2. Set a strong **Administrator / Supervisor password** under Security.
3. Disable external boot devices: USB, USB network boot, Wi-Fi network boot, PXE/network boot.
4. Enable **Secure Boot**.
5. On HP machines: also enable **Sure Start Secure Boot Keys Protection** and the **Microsoft UEFI CA key** so Linux can still boot.
6. Save and exit. Store the BIOS password offline.

### macOS
1. Restart and hold the power button to enter Recovery / Startup Options.
2. Go to Utilities → Startup Security Utility (or equivalent on your model).
3. Set a firmware password (on older Intel Macs) or enable the strongest available startup security.
4. Disable external boot media where the option exists.
5. On Apple Silicon, the system is already heavily locked down; the phone-home script still helps if someone gets past the lock screen.

### Windows
1. Enter BIOS/UEFI (usually **F2**, **F10**, **Del**, or **Esc**).
2. Set a strong Administrator / Supervisor password.
3. Disable USB and network boot options.
4. Enable Secure Boot.
5. Optionally enable TPM and BitLocker (for data encryption) in addition to the phone-home script.
6. Save and exit.

These BIOS locks stop most casual thieves from wiping the OS. The phone-home script then gives you a location signal the moment the machine connects to any network.

## Security Notes

- Keep your BOT_TOKEN private.
- This is a detection tool, not a lock. Pair it with the BIOS steps above for best results.
- A determined attacker with physical access and time can still remove software. The goal is to make opportunistic theft much harder and give you a recovery signal.

## License

MIT — use, modify, and share freely.
