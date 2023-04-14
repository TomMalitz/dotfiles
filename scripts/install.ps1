$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  # NoNewLine = $true
}

# install dependencies by default
# pass -update or -u to upgrade dependencies
$isUpdate = ($args[0] -eq "-update") -or ($args[0] -eq "-u")
$scoopAction = "scoop install"
$brewAction = "brew install"
if($isUpdate) { 
  $scoopAction = "scoop update" 
  $brewAction = "brew upgrade" 
}

Write-Host "installing dependencies..."
if($isWindows) {
  Write-Host "OS detected: Windows"
  scoop bucket add extras
  $scoopAction wezterm
  $scoopAction neovim
  $scoopAction fd
  $scoopAction ripgrep
  $scoopAction lazygit
  $scoopAction starship
  # scoop $scoopAction https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
}
elseif($isMacOS) {
  Write-Host "OS detected: macOS"
  brew tap wez/wezterm
  $brewAction --cask wez/wezterm/wezterm
  $brewAction --cask raycast
  $brewAction neovim
  $brewAction fd
  $brewAction ripgrep
  $brewAction lazygit
  $brewAction starship
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

