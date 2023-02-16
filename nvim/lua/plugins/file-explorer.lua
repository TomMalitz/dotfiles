local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    {'<C-f>', '<cmd>NvimTreeFocus<cr>'},
    {'<space>', '<cmd>NvimTreeToggle<cr>'},
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        mappings = {
          custom_only = true,
          list = {
            { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
            { key = "<Tab>", action = "preview" },
            { key = "D", action = "trash" },
            { key = "R", action = "refresh" },
            { key = "X", action = "collapse_all" },
            { key = "F", action = "live_filter" },
            { key = "C", action = "clear_live_filter" },
            { key = "a", action = "create" },
            { key = "d", action = "remove" },
            { key = "r", action = "rename" },
            { key = "x", action = "cut" },
            { key = "c", action = "copy" },
            { key = "p", action = "paste" },
            { key = "s", action = "system_open" },
            { key = "m", action = "toggle_mark" },
          },
        },
      }
    })
  end
}
