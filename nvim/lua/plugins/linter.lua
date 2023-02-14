return {
  'dense-analysis/ale',
  keys = {
    { "<leader>f", "<cmd>ALEFix<cr>", desc = "ALE Fix" },
  },
  config = function()
    vim.g.ale_fixers = {'prettier', 'eslint'}
    vim.g.ale_fix_on_save = 1
    vim.g.ale_linters_explicit = 1
  end
}
