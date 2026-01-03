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

-- Buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- Plugins
-- Neotree
vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle explorer" })
vim.keymap.set("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Find file in explorer" })
vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers<CR>", { desc = "Explore buffers" })
vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<CR>", { desc = "Explore git status" })
vim.keymap.set("n", "<leader>es", "<cmd>Neotree document_symbols<CR>", { desc = "Explore document symbols" })

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function() telescope_builtin.find_files({ path_display = { "truncate" } }) end, { desc = "Fuzzy find file with name" })
vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, { desc = "Search for string within project" })
vim.keymap.set("n", "<leader>fc", telescope_builtin.grep_string, { desc = "Search for string cursor is on throughout project" })
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Search open buffers" })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Telescope help tags"})
vim.keymap.set("n", "<leader>fm", telescope_builtin.lsp_dynamic_workspace_symbols, { desc = "Search LSP symbols" })

-- LSPs
local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
end
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts("Signature help"))
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts("Jump to next diagnostic"))
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts("Jump to previous diagnostic"))
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
vim.keymap.set("n", "<leader>fr", "<cmd>Lspsaga finder<CR>", opts("Find references"))
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts("Open documentation")) -- uses Treesitter for formatting instead of regex
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts("Code action"))
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts("Peek definition"))
vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts("Go to declaration"))
vim.keymap.set("n", "tt", "<cmd>Lspsaga term_toggle<CR>", opts("Toggle terminal"))
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts("Rename symbol"))
vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts("Show line diagnostics"))
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts("Show cursor diagnostics"))

-- Harpoon
local harpoon = require('harpoon')
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon" })

-- Which-key
local which_key = require('which-key')
vim.keymap.set("n", "<leader>?", function() which_key.show({ global = false }) end, { desc = "Buffer local keymaps (which-key)" })

-- tmux navigator
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left" })
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down" })
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up" })
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right" })
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate to previous" })

-- Undo tree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo tree" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggle Trouble workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Toggle Trouble document diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Toggle Trouble quickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Toggle Trouble loclist" })
