-- Telescope settings
require('telescope').load_extension('fzf')
require('telescope').setup {
  defaults = { 
    file_ignore_patterns = {
      "node_modules", "dist", "target"
    } 
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    buffers = {
      sort_mru = true,
      sort_lastused = true,
--      ignore_current_buffer = true,
      theme = "dropdown",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fr', builtin.resume, {})
vim.keymap.set('n', 'fn', builtin.help_tags, {})
