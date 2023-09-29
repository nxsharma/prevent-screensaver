# Simulate user activity to keep session active
$sleep  = 2    # sleep time, seconds
$line   = 60   # dots/line
# uses techniques from https://gist.github.com/MatthewSteeples/ce7114b4d3488fc49b6a

$sw = [System.Diagnostics.Stopwatch]::StartNew()
$ws = New-Object -com "Wscript.Shell"

while ( $true ) {

  # # move mouse - DOESN'T WORK
  # $Pos = [System.Windows.Forms.Cursor]::Position
  # $x = ($pos.X % 500) + 2
  # $y = ($pos.Y % 500) + 2
  # [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  
  # toggle scroll lock
  $WShell.sendkeys( "{SCROLLLOCK}" )
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys( "{SCROLLLOCK}" )
  Start-Sleep -Seconds $sleep
  
  # dot 
  write-host '.' -NoNewline
  $Count++
  # newline ?
  if ( -not ( $count % $line ) ) {
    write-host
  } 
  
  Start-Sleep $sleep
  
  # exit on keypress
  if ( [Console]::KeyAvailable ) { 
    $keypress = [Console]::ReadKey($true)  # clear the key press
    Write-Host
    $sw.stop()
    Write-Host "Elapsed $([int]$sw.Elapsed.TotalSeconds) seconds"
    break
  }
}