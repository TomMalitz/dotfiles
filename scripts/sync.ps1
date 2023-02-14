$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
}

Copy-Item "../nvim/" -Destination "~/AppData/Local/" -Recurse -Force
Copy-Item "../powershell/" -Destination "~/.config/" -Recurse -Force
if($isWindows) {
  Copy-Item "../powershell/Microsoft.PowerShell_profile.ps1" -Destination "~/Documents/PowerShell/" -Force
}
# else {
#   Copy-Item "../powershell/" -Destination "~/.config/" -Recurse -Force
# }

Write-Host "config files synced " -NoNewLine
Write-Host @greenCheck
