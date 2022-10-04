-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "vim", "vue", "typescript", "tsx", "javascript", "java", "css"},
  highlight = { enable = true },
  indent = { enable = true }
}
