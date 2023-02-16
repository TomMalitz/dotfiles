$greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  # NoNewLine = $true
}

Write-Host "installing dependencies..."
if($isWindows) {
  Write-Host "OS detected: Windows"
  # Write-Host "Installing Scoop"
  # Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
  # try {
  #   irm get.scoop.sh | iex
  # } catch {
  #   Write-Host "Here"
  #   Write-Output "Issue: $PSItem"
  # }
  scoop bucket add extras
  scoop install neovim
  scoop install ripgrep
  scoop install lazygit
  scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
}
elseif($isMacOS) {
  Write-Host "OS detected: macOS"
  brew install neovim
  brew install ripgrep
  brew install lazygit
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
}
elseif($isLinux) {
  Write-Host "OS detected: Linux"
}

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSFzf -Repository PSGallery

Write-Host "dependencies installed " -NoNewLine
Write-Host @greenCheck

./sync.ps1

