# dotfiles
- Shell: [PowerShell](https://learn.microsoft.com/en-us/powershell/)
- Editor: [Neovim](https://neovim.io/)
- Terminal: [Wezterm](https://wezfurlong.org/wezterm/)

## System dependencies

### Windows
- [scoop](https://scoop.sh/)

### macOS
- [brew](https://brew.sh/)

### General
- [powershell](https://docs.microsoft.com/en-us/powershell/)
  - Windows `winget install --id Microsoft.Powershell --source winget`
  - macOS `brew install --cask powershell`

# Scripts

- `install.ps1` Installs the dependencies and syncs the config files. Run with `-u` to update the dependencies instead of install.

- `sync.ps1` Sync the config files to their correct place.


# Machine Setups

### macOS

#### Apps

HotKey
Raycast
BetterDisplay

#### Commands

- key-repeat for vscode vim: `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
