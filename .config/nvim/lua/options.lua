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

-- General
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")

-- Quickly disable search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>:nohl<CR>", { desc = "Disable search highlighting" })

-- Don't copy deleted character into register
vim.keymap.set("n", "x", '"_x')

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split panes equally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Move code block around with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block down" })

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Keep cursor in middle of screen when jumping half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up half page" })

-- Keep cursor in middle of screen and unfold block when jumping between search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Paste without modifying register
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without modifying register" })

-- Delete without modifying register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without modifying register" })

-- Quick replace all instances of word under cursor
vim.keymap.set(
	"n",
	"<leader>rs",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Replace all instances of word under cursor" }
)
-- Quick replace all instances of visual selection
vim.keymap.set(
	"v",
	"<leader>rs",
	'"hy:%s/<C-r>h/<C-r>h/g<Left><Left>',
	{ desc = "Replace all instances of visual selection" }
)

-- Diagnostic gutter symbols
vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = "", numhl = "DiagnosticDefaultError", texthl = "DiagnosticSignError" }
)
vim.fn.sign_define(
	"DiagnosticSignWarn",
	{ text = "", numhl = "DiagnosticDefaultWarn", texthl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
	"DiagnosticSignHint",
	{ text = "", numhl = "DiagnosticDefaultHint", texthl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
	"DiagnosticSignInformation",
	{ text = "", numhl = "DiagnosticDefaultInformation", texthl = "DiagnosticSignInformation" }
)
vim.diagnostic.config({
	severity_sort = true,
})

-- Buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- vim.opt.cmdheight = 0

-- Autocommands
local augroup = vim.api.nvim_create_augroup("Options autocommands", {})
vim.api.nvim_clear_autocmds({ group = augroup })

-- Compiler
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "cs",
	callback = function()
		vim.cmd("compiler dotnet")
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "typescript", "typescriptreact" },
	callback = function()
		vim.cmd("compiler tsc")
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup,
	callback = function()
		-- Disable continuation of comments on new lines
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
