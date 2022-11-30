# Alias
Set-Alias vim nvim
Set-Alias ll dir
Set-Alias g git

# Oh My Posh Config
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussel.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json' | Invoke-Expression

# PowerShell Modules
Import-Module Terminal-Icons
Import-Module PSFzf
