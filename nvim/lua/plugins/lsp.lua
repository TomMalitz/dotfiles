return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function()
      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

      -- (Optional) Configure lua language server for neovim
      lsp.nvim_workspace()

      lsp.setup()

      -- volar setup
      require'lspconfig'.volar.setup{
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
      }
    end
  },
  {'mfussenegger/nvim-jdtls'}
}
-- return {
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       -- LSP Support
--       {'williamboman/mason.nvim'},
--       {'williamboman/mason-lspconfig.nvim'},
--
--       -- Autocompletion
--       {'hrsh7th/nvim-cmp'},
--       {'hrsh7th/cmp-nvim-lsp'},
--       {'hrsh7th/cmp-buffer'},
--       {'hrsh7th/cmp-path'}
--     },
--     config = function()
--
--       require('cmp').setup {
--         sources = {
--           { name = 'nvim_lsp' },
--           { name = 'buffer' },
--           { name = 'path' }
--         }
--       }
--
--       require('mason').setup()
--
--       require('mason-lspconfig').setup({
--         ensure_installed = {'tsserver'}
--       })
--
--       local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--       local lsp_attach = function(client, bufnr)
--         -- Enable completion triggered by <c-x><c-o>
--         vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--         -- Mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local bufopts = { noremap=true, silent=true, buffer=bufnr }
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--         vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--         vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--         vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--         vim.keymap.set('n', '<space>wl', function()
--           print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         end, bufopts)
--         vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--         vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--         vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--         vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--         vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
--         vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
--       end
--
--       -- server configuration
--       local lspconfig = require('lspconfig')
--       require('mason-lspconfig').setup_handlers({
--         function(server_name)
--           lspconfig[server_name].setup({
--             on_attach = lsp_attach,
--             capabilities = lsp_capabilities
--           })
--         end
--       })
--
--       -- vue 3 volar take-over
--       require'lspconfig'.volar.setup{
--         filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
--       }
--
--       -- diagnostics settings
--       vim.diagnostic.config({
--         virtual_text = false,
--         signs = true,
--         update_in_insert = false,
--         underline = true,
--         severity_sort = true,
--         float = {
--           focusable = false,
--           style = 'minimal',
--           border = 'rounded',
--           source = 'always',
--           header = '',
--           prefix = '',
--         }
--       })
--
--     end
--   },
--   {'mfussenegger/nvim-jdtls'}
-- }
