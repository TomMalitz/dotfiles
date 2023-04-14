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

# common dependencies
$dependencies = @(
  "neovim",
  "fd",
  "ripgrep",
  "zoxide",
  "lazygit",
  "starship"
)

Write-Host "installing dependencies..."
if($isWindows) {
  Write-Host "OS detected: Windows"
  scoop bucket add extras
  scoop $scoopAction wezterm
  foreach($dependency in $dependencies) {
    scoop $scoopAction $dependency
  }
}
elseif($isMacOS) {
  Write-Host "OS detected: macOS"
  brew tap wez/wezterm
  brew $brewAction --cask wez/wezterm/wezterm
  brew $brewAction --cask raycast
  foreach($dependency in $dependencies) {
    brew $brewAction $dependency
  }
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

