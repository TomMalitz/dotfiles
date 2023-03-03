# Alias
Set-Alias vim nvim
Set-Alias ll dir
Set-Alias g git

Invoke-Expression (&starship init powershell)

# Oh My Posh Config
# if($isWindows) {
#   oh-my-posh init pwsh --config '~/Documents/PowerShell/posh.json' | Invoke-Expression
# } else {
#   oh-my-posh init pwsh --config '~/.config/powershell/posh.json' | Invoke-Expression
# }

# PowerShell Modules
Import-Module Terminal-Icons
Import-Module PSFzf

