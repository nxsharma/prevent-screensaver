#sends dot press every minute . You can open up a notepad and place the cursor so that it doesn't fill up the buffer and start beeping
param($minutes = 60)

$myshell = New-Object -com "Wscript.Shell"

for ($i = 0; $i -lt $minutes; $i++) {
  Start-Sleep -Seconds 60
  $myshell.sendkeys(".")
}