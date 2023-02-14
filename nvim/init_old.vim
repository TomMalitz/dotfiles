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
:set scrolloff=25
:set noswf
" :set timeoutlen=500
":set shell=/usr/local/microsoft/powershell/7/pwsh
" call plug#begin('~/AppData/Local/nvim-data/site/autoload')

call plug#begin('~/plugged')

" UI
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Color schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'preservim/nerdtree' 
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " requires yarn installed globally
Plug 'folke/todo-comments.nvim'
Plug 'windwp/nvim-autopairs'

" Text Editing
Plug 'alvan/vim-closetag'
Plug 'numToStr/Comment.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'

" LSP Support
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

let mapleader=";"

augroup Markdown
    " autocmd!
    autocmd FileType markdown set wrap
augroup END

" jk to exit insert move
" :inoremap kj <Esc>kjjk
:inoremap jk <Esc>

" show open buffer list
nnoremap <silent> <Leader>l :ls<CR>

" center after vertical jumps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" save with \s enter
noremap <Leader>s :update<CR>
" open horizontal buffer
noremap <Leader>w :sp<CR>

" open todo quickfix list
noremap <Leader>td :TodoQuickFix<CR>

" open markdown preview
noremap <Leader>mp :MarkdownPreview<CR>

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

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ale linting and formatting
" let g:ale_fixers = {'typescript': ['prettier', 'eslint'], 'javascript': ['prettier', 'eslint'], 'markdown' : ['pandoc']}
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

nnoremap <silent> <Leader>f :ALEFix<CR>
