local wezterm = require 'wezterm'

return {
  default_prog = { '/bin/zsh', '--login', '-c', 'pwsh'},
  font = wezterm.font 'JetBrains Mono',
  color_scheme = 'Batman',
  colors = {
    cursor_bg = '#c9c97b',
    cursor_fg = '#1c1c1c'
  },
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  keys = {
    -- kill current tab without confirmation
    {
      key = 'k',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentTab { confirm = false }
    },
    -- quit entire wezterm application
    {
      key = 'q',
      mods = 'CMD',
      action = wezterm.action.QuitApplication
    }
  },
}
