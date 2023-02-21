# dotfiles
Config files for PowerShell and Neovim. 

## System dependencies

### Windows
- [scoop](https://scoop.sh/)

### macOS
- [brew](https://brew.sh/)

### General
- [powershell](https://docs.microsoft.com/en-us/powershell/)
  - Windows: `winget install --id Microsoft.Powershell --source winget`
  - macOS: `brew install --cask powershell`

# Installation

Run the `.\install.ps1` script from a powershell instance to install the dependencies and sync the config files to their correct place.

Run the `.\sync.ps1` to sync the config files ONLY.
