local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style="night", -- storm, moon, night, day
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent"
      },
      on_colors = function(colors)
        -- colors.bg_float = "#1b1d1e"
        colors.bg_sidebar = "#1b1d1e"
        colors.bg = "#2c2f30"
        colors.fg_gutter = "#4a527c"
      end
    })
    vim.cmd([[colorscheme tokyonight]]) 
  end
}

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd([[colorscheme gruvbox]]) 
  end
}

local catppuccin = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = true
    })
    vim.cmd([[colorscheme catppuccin]]) 
  end
}

local monokai = {
  "patstockwell/vim-monokai-tasty",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme vim-monokai-tasty]]) 
  end
} 

local vscode = {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local vscode_theme = require('vscode')
    vscode_theme.setup({
      transparent = true,
      -- disable_nvimtree_bg = true
    })
    vscode_theme.load()
  end
} 

local active_theme = vscode

return active_theme
