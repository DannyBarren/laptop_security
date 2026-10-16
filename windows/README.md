# Windows

## Script

Copy `phone-home.ps1` to a permanent location, e.g. `C:\phone-home.ps1`.

Edit the script and set `$BOT_TOKEN` and `$CHAT_ID`.

## Automatic trigger (startup + network change)

### 1. Task Scheduler — at startup

1. Open Task Scheduler.
2. Create Basic Task → name it "Laptop Phone-Home".
3. Trigger: At startup.
4. Action: Start a program.
   - Program: `powershell.exe`
   - Arguments: `-ExecutionPolicy Bypass -File C:\phone-home.ps1`
5. Finish.

### 2. Network change (recommended extra)

Create a second task or use Event Viewer / PowerShell to watch for network events. A simple approach is a scheduled task that runs every few minutes while the machine is on, or use a tool like Task Scheduler with an event trigger for "Network Profile Changed".

For most users the startup task + manual testing is enough to start. You can expand later with a PowerShell network-change listener.

## Test

```powershell
powershell -ExecutionPolicy Bypass -File C:\phone-home.ps1
```
