# Linux (Ubuntu / NetworkManager)

## Script

Copy `phone-home.sh` to `/usr/local/bin/phone-home` and make it executable:

```bash
sudo cp phone-home.sh /usr/local/bin/phone-home
sudo chmod 755 /usr/local/bin/phone-home
```

Edit the script and replace `YOUR_BOT_TOKEN` and `YOUR_CHAT_ID`.

## Automatic trigger (boot + network change)

Create the NetworkManager dispatcher:

```bash
sudo nano /etc/NetworkManager/dispatcher.d/99-phone-home
```

Paste:

```bash
#!/bin/bash
if [ "$2" = "up" ] || [ "$2" = "connectivity-change" ]; then
  /usr/local/bin/phone-home
fi
```

```bash
sudo chmod 755 /etc/NetworkManager/dispatcher.d/99-phone-home
```

The script will now run on every network-up and connectivity change (including after boot).

## Test

```bash
/usr/local/bin/phone-home
```

You should receive a Telegram message. Toggle Wi-Fi to test the automatic trigger.
