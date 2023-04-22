vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

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

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    -- {'<C-f>', '<cmd>NvimTreeFocus<cr>'},
    {'<C-f>', '<cmd>NvimTreeToggle<cr>'},
  },
  config = function()
    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<o>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))

      vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
      vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
      vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))

      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'X', api.tree.collapse_all, opts('Collapse All'))

      vim.keymap.set('n', 'F', api.live_filter.start, opts('Filter'))
      vim.keymap.set('n', 'C', api.live_filter.clear, opts('Clear Filter'))

      vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Mark'))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      sort_by = "case_sensitive",
      actions = {
        open_file = {
          resize_window = false
        }
      },
    })


  end
}
