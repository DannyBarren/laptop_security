# macOS

## Script

Copy `phone-home.sh` to `/usr/local/bin/phone-home` and make it executable:

```bash
sudo cp phone-home.sh /usr/local/bin/phone-home
sudo chmod 755 /usr/local/bin/phone-home
```

Edit and set your BOT_TOKEN and CHAT_ID.

## Automatic trigger (login + network change)

Create a LaunchAgent that runs on network changes. Save as `~/Library/LaunchAgents/com.laptop.phonehome.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.laptop.phonehome</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/bin/phone-home</string>
  </array>
  <key>WatchPaths</key>
  <array>
    <string>/Library/Preferences/SystemConfiguration</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

Load it:

```bash
launchctl load ~/Library/LaunchAgents/com.laptop.phonehome.plist
```

`WatchPaths` on SystemConfiguration causes the script to run when network configuration changes. `RunAtLoad` covers login.

## Test

```bash
/usr/local/bin/phone-home
```
