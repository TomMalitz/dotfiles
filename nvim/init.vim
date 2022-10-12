:set relativenumber
:set autoindent
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set mouse=a
:set clipboard=unnamed
:set wrap!
:set scrolloff=5
":set shell=/usr/local/microsoft/powershell/7/pwsh

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
Plug 'alvan/vim-closetag'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tpope/vim-commentary'

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
Plug 'mfussenegger/nvim-jdtls'

call plug#end()

let mapleader=";"

" jk to exit insert move
:inoremap kj <Esc>
:inoremap jk <Esc>

" show open buffer list
nnoremap <silent> <Leader>l :ls<CR>

" save with \s enter
noremap <Leader>s :update<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <Space> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsable="~"
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.DS_Store$', '\.git$']

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.vue'

" clear search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>
" keep search buffer and toggle search highlight
" nnoremap <silent> <Space> :set hlsearch!<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ale linting and formatting
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

nnoremap <silent> <Leader>f :ALEFix<CR>
