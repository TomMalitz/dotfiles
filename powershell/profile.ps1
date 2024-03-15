# Alias
Set-Alias vim nvim
Set-Alias ll dir
Set-Alias g git

# Zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --cmd cd --hook $hook powershell | Out-String)
})

# PowerShell Modules
Import-Module Terminal-Icons
Import-Module PSFzf

# Ability to rename the title of the powershell window
function Set-Title {
  Param($Title)
  $Prefix = "-tabTitle "
  $host.ui.RawUI.WindowTitle = $Prefix+$Title
}

