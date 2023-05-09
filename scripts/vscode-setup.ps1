$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
}

# common dependencies
$extensions = @(
  "vue.volar",
  "vscodevim.vim"
)

# install vscode extensions
foreach($extension in $extensions) {
  code --install-extension $extension
}

# sync settings and keybindings files
if($isWindows) {
  Write-Host "syncing settings and keybinding files"
  Copy-Item "../vscode/keybindings.json" -Destination "~/AppData/Roaming/Code/User/keybindings.json" -Force
  Copy-Item "../vscode/settings.json" -Destination "~/AppData/Roaming/Code/User/settings.json" -Force
}

Write-Host "Done " -NoNewLine
Write-Host @greenCheck
