return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR><cmd>horizontal resize 15<CR>", { desc = "Open Git window" })
			vim.keymap.set("n", "<leader>ga", "<cmd>Git blame<CR>", { desc = "Git annotate (blame)" })
		end,
	},
	{
		"cedarbaum/fugitive-azure-devops.vim",
	},
}
