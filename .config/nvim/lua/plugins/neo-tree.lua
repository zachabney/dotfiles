return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["v"] = "open_vsplit",
					["h"] = "open_split",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle explorer" })
		vim.keymap.set("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Find file in explorer" })
		vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers<CR>", { desc = "Explore buffers" })
		vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<CR>", { desc = "Explore git status" })
		vim.keymap.set("n", "<leader>es", "<cmd>Neotree document_symbols<CR>", { desc = "Explore document symbols" })
	end,
}
