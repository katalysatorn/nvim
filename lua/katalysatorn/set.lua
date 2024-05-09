-- Add Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

-- Auto indenting
vim.opt.smartindent = true

-- Allow mouse usage
vim.opt.mouse = 'a'

-- add unlimited undooo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

vim.opt.virtualedit = "onemore"

