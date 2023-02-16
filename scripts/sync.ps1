$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
}

Write-Host "removing old config files..."
Remove-Item "~/.config/nvim/" -Recurse -Force
Remove-Item "~/.config/powershell/" -Recurse -Force
if($isWindows) {
  Remove-Item "~/AppData/Local/nvim/" -Recurse -Force
}

Write-Host "writing new config files..."
Copy-Item "../nvim/" -Destination "~/.config/" -Recurse -Force
Copy-Item "../powershell/" -Destination "~/.config/" -Recurse -Force
if($isWindows) {
  Copy-Item "../nvim/" -Destination "~/AppData/Local/" -Recurse -Force
  Copy-Item "../powershell/profile.ps1" -Destination "~/Documents/PowerShell/Profile.ps1" -Force
  Copy-Item "../powershell/posh.json" -Destination "~/Documents/PowerShell/" -Force
}

Write-Host "config files synced " -NoNewLine
Write-Host @greenCheck
