return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ path_display = { "truncate" } })
			end, { desc = "Fuzzy find file with name" })

			vim.keymap.set("n", "<leader>fs", function()
				builtin.live_grep()
			end, { desc = "Search for string within project" })

			vim.keymap.set("n", "<leader>fc", function()
				builtin.grep_string()
			end, { desc = "Search for string cursor is on throughout project" })

			vim.keymap.set("n", "<leader>fb", function()
				builtin.buffers()
			end, { desc = "Search open buffers" })

			vim.keymap.set("n", "<leader>fh", function()
				builtin.help_tags()
			end, { desc = "Search help tags" })

			vim.keymap.set("n", "<leader>fm", function()
				builtin.lsp_dynamic_workspace_symbols()
			end, { desc = "Search LSP symbols" })
		end,
		opts = function()
			local actions = require("telescope.actions")
			return {
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-v>"] = actions.file_vsplit,
							["<C-h>"] = actions.file_split,
						},
					},
				},
			}
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
