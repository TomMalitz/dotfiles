-- Telescope settings
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
      theme = "dropdown"
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
-- require('telescope').load_extension('fzf')
