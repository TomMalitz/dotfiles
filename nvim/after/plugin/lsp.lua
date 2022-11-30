-- setup mason
require('mason').setup()
require('mason-lspconfig').setup()

-- lsp-zero setup
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
