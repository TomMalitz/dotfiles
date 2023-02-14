# Alias
Set-Alias vim nvim
Set-Alias ll dir
Set-Alias g git

# Oh My Posh Config
oh-my-posh init pwsh --config '../powershell/posh.json' | Invoke-Expression

# PowerShell Modules
Import-Module Terminal-Icons
Import-Module PSFzf

Write-Host "Here"
