vim.g.mapleader = " "

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "120"

-- saving
vim.opt.updatetime = 50

-- backspace
vim.opt.backspace = "indent,eol,start"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- persistent undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")
