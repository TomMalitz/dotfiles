return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style="moon", -- storm, moon, night, day
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent"
      -- },
      on_colors = function(colors)
        colors.fg_gutter = "#4a527c"
      end
    })
    vim.cmd([[colorscheme tokyonight]]) 
  end
}
