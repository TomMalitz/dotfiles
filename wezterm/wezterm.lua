local wezterm = require 'wezterm'

local function get_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

local os = get_os()
local startup = { '/bin/zsh', '--login', '-c', 'pwsh'}
if os == 'win' then startup = { 'powershell.exe', 'pwsh'} end

local font_size = 12.0
if os == 'win' then font_size = 10.0 end

return {
  default_prog = startup,
  font = wezterm.font 'JetBrains Mono',
  font_size = font_size,
  color_scheme = 'Batman',
  colors = {
    cursor_bg = '#c9c97b',
    cursor_fg = '#1c1c1c'
  },
  window_background_opacity = 1.0,
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
