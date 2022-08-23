-- Toggle Term settings
require('toggleterm').setup {
  direction = 'float',
	open_mapping = [[<C-j>]]
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = false })

function _lazygit_toggle()
  lazygit:toggle()
end

-- open lazygit with "\g"
vim.api.nvim_set_keymap("n", "<leader>g", ":lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
