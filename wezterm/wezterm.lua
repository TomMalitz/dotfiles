local wezterm = require 'wezterm'
wezterm.log_info 'Startup'

local function get_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

-- handle custom naming of tabs via PS Set-Title command
local tabTitles = {}
for i=1, 100 do
  tabTitles[i] = 'new'
end
wezterm.GLOBAL.tab_titles = wezterm.GLOBAL.tab_titles or tabTitles
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local tab_titles = wezterm.GLOBAL.tab_titles
    local tabIndex = tab.tab_id + 1 

    -- handle update for inactive tabs 
    if not tab.is_active then return tab_titles[tabIndex] or tab.active_pane.title end

    local ps_prefix = '-tabTitle '
    local is_ps_title = string.find(tab.active_pane.title, ps_prefix) 
    if(tab_titles[tabIndex] ~= nil and not is_ps_title) then return tab_titles[tabIndex] end
    
    if is_ps_title then
      tab_titles[tabIndex] = tab.active_pane.title:gsub(ps_prefix, '')
      wezterm.GLOBAL.tab_titles = tab_titles
      return tab_titles[tabIndex]
    else
      return tab.active_pane.title
    end
  end
)

local os = get_os()
local startup = { '/bin/zsh', '--login', '-c', 'pwsh'}
if os == 'win' then startup = { 'powershell.exe', 'pwsh'} end

local font_size = 12.0
local font_weight = 'Medium'
local line_height = 1.05
if os == 'win' then 
  font_size = 9.0
  font_weight = 'Regular'
  line_height = 1 
end

local background = '#282828'
local dark_background = '#1e1e1e'

return {
  default_prog = startup,
  font = wezterm.font('JetBrains Mono', {weight = font_weight}),
  font_size = font_size,
  line_height = line_height,
  color_scheme = 'Poimandres',
  colors = {
    background = dark_background,
    cursor_bg = '#4eccb2', -- #d1d1d1', -- '#c9c97b',
    cursor_fg = '#1c1c1c'
  },
  window_background_opacity = 0.98,
  -- window_decorations = "RESIZE",
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
    },
    {
      key = '[',
      mods = 'CTRL',
      action = wezterm.action.IncreaseFontSize
    },
    {
      key = ']',
      mods = 'CTRL',
      action = wezterm.action.DecreaseFontSize
    }
  },
}
