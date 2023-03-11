return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style="moon", -- storm, moon, night, day
        -- transparent = true,
        styles = {
          -- sidebars = "transparent",
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
  -- {'posva/vim-vue'},
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = true,
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = "", -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     })
  --     vim.cmd([[colorscheme gruvbox]]) 
  --   end
  -- }
}
