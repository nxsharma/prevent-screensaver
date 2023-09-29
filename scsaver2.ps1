# Simulate user activity to keep session active
$sleep  = 2    # sleep time, seconds
$line   = 60   # dots/line
# uses techniques from https://gist.github.com/MatthewSteeples/ce7114b4d3488fc49b6a

$sw = [System.Diagnostics.Stopwatch]::StartNew()
$WShell = New-Object -ComObject WScript.Shell

while ( $true ) {

  # # move mouse - DOESN'T WORK
  # $Pos = [System.Windows.Forms.Cursor]::Position
  # $x = ($pos.X % 500) + 2
  # $y = ($pos.Y % 500) + 2
  # [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  
  # toggle scroll lock
  $WShell.sendkeys( "{SCROLLLOCK 2}" )
  #Start-Sleep -Milliseconds 100
  #$WShell.sendkeys( "{SCROLLLOCK}" )
  Start-Sleep -Seconds $sleep
  
  # dot 
  #write-host '.' -NoNewline
  [Console]::Write('.')
  
  $Count++
  # newline ?
  if ($Count % $line -eq 0) {
     Write-Output ''
  }
  
  #Start-Sleep $sleep
  
  # exit on keypress
    if ($host.UI.RawUI.KeyAvailable) {
        $keypress = [Console]::ReadKey($true)  # Clear the key press
        Write-Host
        $sw.Stop()
        Write-Host "Elapsed $([int]$sw.Elapsed.TotalSeconds) seconds"
        break
    }
}