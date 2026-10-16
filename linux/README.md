# Linux Setup Guide (Beginner Friendly)

This guide walks you through setting up the phone-home script on Ubuntu and most other Linux distributions that use NetworkManager.

## Step 1: Install the script

1. Download or copy the `phone-home.sh` file from this folder.
2. Open a terminal.
3. Run these commands (replace the path if you saved the file somewhere else):

```bash
sudo cp phone-home.sh /usr/local/bin/phone-home
sudo chmod 755 /usr/local/bin/phone-home
```

## Step 2: Add your Telegram details

1. Open the script for editing:

```bash
sudo nano /usr/local/bin/phone-home
```

2. Find these two lines near the top and replace the placeholders with your real values:

```bash
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
```

3. Save and exit (in nano: Ctrl+O, Enter, then Ctrl+X).

**How to get these values** is explained in the main README.

## Step 3: Make it run automatically

Create a small file that tells NetworkManager to run the script whenever a network connects or changes:

```bash
sudo nano /etc/NetworkManager/dispatcher.d/99-phone-home
```

Paste this entire block:

```bash
#!/bin/bash
if [ "$2" = "up" ] || [ "$2" = "connectivity-change" ]; then
  /usr/local/bin/phone-home
fi
```

Save and exit, then make it executable:

```bash
sudo chmod 755 /etc/NetworkManager/dispatcher.d/99-phone-home
```

## Step 4: Test it

Run the script manually:

```bash
/usr/local/bin/phone-home
```

You should receive a Telegram message within a few seconds.  
Then turn Wi-Fi off and back on — you should get another message. That confirms the automatic trigger works.

## Troubleshooting

- **No message?** Double-check the BOT_TOKEN and CHAT_ID. Make sure you messaged the bot at least once.
- **Permission denied?** Make sure you used `sudo` for the copy and chmod steps.
- **Script not running on network change?** Confirm the dispatcher file exists and is executable with `ls -l /etc/NetworkManager/dispatcher.d/99-phone-home`.

That's it! The script will now phone home every time the laptop connects to a network or switches networks.
