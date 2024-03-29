return {
  'akinsho/toggleterm.nvim',
  config = function()
    -- Toggle Term settings
    require('toggleterm').setup {
      -- direction = 'float',
      open_mapping = [[<C-j>]],
      persist_mode = true,
      size = 30
      --float_opts = {
      --  border = 'curved'
    -- }
    }

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      count = 3,
      direction = 'float',
      float_opts = {
        border = 'none'
      }
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- open lazygit with "\g"
    vim.api.nvim_set_keymap("n", "<leader>g", ":lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end
}
