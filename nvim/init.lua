vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.mouse:append('a')
vim.opt.clipboard:append { "unnamed", "unnamedplus" }
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.swapfile = false

vim.g.mapleader = ";"

-- load lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = {
    lazy = false
  }
})

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

-- save current buffer
nmap("<Leader>s", ":update<CR>")
-- open hortizontal buffer
nmap("<Leader>w", ":sp<CR>")
-- show open buffer list
nmap("<Leader>l", ":ls<CR>")

-- clear search buffer
nmap("<Esc><Esc>", ':let @/ = ""<CR>')

-- center after vertical jumps
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

imap("jk", "<Esc>")
