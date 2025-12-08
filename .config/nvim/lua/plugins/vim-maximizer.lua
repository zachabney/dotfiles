return {
	"szw/vim-maximizer",
	config = function()
		vim.keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize split" })
	end,
}
