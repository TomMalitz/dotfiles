return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'}
    },
    config = function()

      -- completion setup
      local cmp = require('cmp')
      cmp.setup ({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' }
        },
        mapping = {
          ['<CR>'] = function(fallback)
            if cmp.visible() then
              cmp.confirm({select = true})
            else
              fallback()
            end
          end,
          ['<Up>'] = cmp.mapping.select_prev_item(),
          ['<Down>'] = cmp.mapping.select_next_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        }
      })

      -- mason lsp installer
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {'tsserver'}
      })

      -- lsp keymappings
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'U', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, bufopts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end


      -- server configuration
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
          })
        end
      })

      -- vue 3 volar take-over
      require'lspconfig'.volar.setup{
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
      }

      -- lsp float settings
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      -- diagnostics settings
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        }
      })

    end
  },
  {'mfussenegger/nvim-jdtls'}
}
