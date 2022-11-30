require("tokyonight").setup({
  style="storm", -- storm, moon, night, day
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent"
  },
  on_colors = function(colors)
    colors.fg_gutter = "#4a527c"
  end
})

vim.cmd("colorscheme tokyonight")

-- require("gruvbox").setup({
--   undercurl = false,
--   underline = false,
--   bold = false,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = false, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = true,
--   transparent_mode = false,
-- })
-- vim.cmd("colorscheme gruvbox")
