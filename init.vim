:set relativenumber
:set autoindent
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set mouse=a
:set clipboard=unnamed
:set shell=/usr/local/microsoft/powershell/7/pwsh

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tribela/vim-transparent'
Plug 'akinsho/toggleterm.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP Setup
Plug 'VonHeikemen/lsp-zero.nvim'

call plug#end()

" jk to exit insert move
:inoremap kj <Esc>
:inoremap jk <Esc>

" color scheme
colorscheme gruvbox

" nerd-tree:
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsable="~"
let g:NERDTreeShowHidden=1

" telescope fuzzy finder
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" clear search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>
" keep search buffer and toggle search highlight
nnoremap <silent> <Space> :set hlsearch!<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ale linting and formatting
let g:ale_fixers = ['prettier', 'eslint']
" let g:ale_fix_on_save = 1

lua <<EOF

-- set patterns to ignore for telescope
require('telescope').setup{ defaults = { file_ignore_patterns ={"node_modules", "dist", "target"} } }

-- Toggle Term settings
require('toggleterm').setup{
  direction = 'float',
	open_mapping = [[<C-j>]]
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = false })

function _lazygit_toggle()
  lazygit:toggle()
end

-- open lazygit with "\g"
vim.api.nvim_set_keymap("n", "<leader>g", ":lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- lsp-zero setup
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

EOF
