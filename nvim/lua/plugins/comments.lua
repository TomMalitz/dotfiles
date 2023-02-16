return {
  {
    'folke/todo-comments.nvim',
    lazy = true,
    keys = {
      {'<leader>td', '<cmd>TodoQuickFix<cr>'}
    },
    otps = {
      keywords = {
        FIX = { icon = " ", color = "error" },
        TODO = { icon = " ", color = "info" }
      },
      merge_keywords = false
    },
  },
  { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },
  {'numToStr/Comment.nvim', config = true},
}
