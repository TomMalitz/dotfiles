return {
  'iamcco/markdown-preview.nvim',
  lazy = false,
  build = "cd app && yarn install",
  keys = {
    {"<leader>mp", "<cmd>MarkdownPreview<cr>"}
  }
}
