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
  {'numToStr/Comment.nvim', config = true},
}
