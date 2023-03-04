$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  # NoNewLine = $true
}

# install dependencies by default
# pass -update or -u to upgrade dependencies
$isUpdate = ($args[0] -eq "-update") -or ($args[0] -eq "-u")
$scoopAction = "install"
$brewAction = "install"
if($isUpdate) { 
  $scoopAction = "update" 
  $brewAction = "upgrade" 
}

Write-Host "installing dependencies..."
if($isWindows) {
  Write-Host "OS detected: Windows"
  scoop bucket add extras
  scoop $scoopAction wezterm
  scoop $scoopAction neovim
  scoop $scoopAction ripgrep
  scoop $scoopAction lazygit
  scoop $scoopAction starship
  # scoop $scoopAction https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
}
elseif($isMacOS) {
  Write-Host "OS detected: macOS"
  brew tap wez/wezterm
  brew $brewAction --cask wez/wezterm/wezterm
  brew $brewAction neovim
  brew $brewAction ripgrep
  brew $brewAction lazygit
  brew $brewAction starship
  # brew $brewAction jandedobbeleer/oh-my-posh/oh-my-posh
}
elseif($isLinux) {
  Write-Host "OS detected: Linux"
  Write-Host "This is not currently handled!"
}

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSFzf -Repository PSGallery

Write-Host "dependencies installed " -NoNewLine
Write-Host @greenCheck

./sync.ps1

