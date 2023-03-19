local wezterm = require 'wezterm'
wezterm.log_info 'Startup'

local function get_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

-- function to handle custom naming of tabs via PS Set-Title command
wezterm.GLOBAL.tab_titles = wezterm.GLOBAL.tab_titles or {}
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local tab_titles = wezterm.GLOBAL.tab_titles

    -- handle update for inactive tabs 
    if not tab.is_active then return tab_titles[tab.tab_id] or tab.active_pane.title end

    local ps_prefix = '-tabTitle '
    local is_ps_title = string.find(tab.active_pane.title, ps_prefix) 
    if(tab_titles[tab.tab_id] ~= nil and not is_ps_title) then return tab_titles[tab.tab_id] end
    
    if is_ps_title then
      tab_titles[tab.tab_id] = tab.active_pane.title:gsub(ps_prefix, '')
      wezterm.GLOBAL.tab_titles = tab_titles
      return tab_titles[tab.tab_id]
    else
      return tab.active_pane.title
    end

  end
)


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
    cursor_bg = '#AAAAAA', -- '#c9c97b',
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
    },
    {
      key = '`',
      mods = 'CTRL',
      action = wezterm.action.ToggleFullScreen
    }
  },
}
