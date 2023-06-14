$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
}

# common dependencies
$extensions = @(
  "vue.volar",
  "vscodevim.vim"
  "donjayamanne.githistory"
  "edwinsulaiman.jetbrains-rider-dark-theme"
)

# install vscode extensions
foreach($extension in $extensions) {
  code --install-extension $extension
}

# sync settings and keybindings files
Write-Host "syncing settings and keybinding files"
if($isWindows) {
  Write-Host "Windows OS detected"
  Copy-Item "../vscode/keybindings.json" -Destination "~/AppData/Roaming/Code/User/keybindings.json" -Force
  Copy-Item "../vscode/settings.json" -Destination "~/AppData/Roaming/Code/User/settings.json" -Force
  Copy-Item "../vscode/.vsvimrc" -Destination "~/.vsvimrc" -Force
}

if($isMacOS) {
  Write-Host "Mac OS detected"
  Copy-Item "../vscode/keybindings.json" -Destination "~/Library/Application Support/Code/User/keybindings.json" -Force
  Copy-Item "../vscode/settings.json" -Destination "~/Library/Application Support/Code/User/settings.json" -Force
  Copy-Item "../vscode/.vsvimrc" -Destination "~/.vsvimrc" -Force
}

Write-Host "Done " -NoNewLine
Write-Host @greenCheck

