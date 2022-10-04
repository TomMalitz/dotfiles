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
