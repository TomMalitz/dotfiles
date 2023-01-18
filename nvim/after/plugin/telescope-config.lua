-- Telescope settings

local actions = require("telescope.actions")

require('telescope').setup {
  defaults = { 
    file_ignore_patterns = {
      "node_modules", "node", "dist", "target"
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
    -- wrap_results = true
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      -- previewer = true,
      layout_config = {
        width = 0.6
      }
    },
    buffers = {
      sort_mru = true,
      sort_lastused = true,
      ignore_current_buffer = true,
      theme = "dropdown",
      -- previewer = true,
      layout_config = {
        width = 0.6
      }
    },
    live_grep = {
      theme = "dropdown",
      layout_config = {
        width = 0.6
      }
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
require('telescope').load_extension('fzf')


local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fr', builtin.resume, {})
vim.keymap.set('n', 'fn', builtin.help_tags, {})
