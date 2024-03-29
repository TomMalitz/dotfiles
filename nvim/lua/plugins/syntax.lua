return {
  {'jlcrochet/vim-razor'},
  {'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "vim", "vue", "typescript", "tsx", "javascript", "java", "css", "cpp", "c_sharp"},
        highlight = { enable = true },
        indent = { enable = true }
      }
    end
  }
}
