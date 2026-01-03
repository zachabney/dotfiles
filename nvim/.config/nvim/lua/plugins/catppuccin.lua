-- Color scheme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
            background = {
                light = "latte",
                dark = "mocha"
            },
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				lsp_saga = true,
				mason = true,
				neotree = true,
				telescope = true,
				lsp_trouble = true,
				rainbow_delimiters = true,
				indent_blankline = {
					enabled = true,
				},
				harpoon = true,
				which_key = true,
			},
			custom_highlights = function(colors)
				return {
					HighlightedyankRegion = {
						bg = colors.surface2,
					},
				}
			end,
		})
		vim.cmd([[colorscheme catppuccin]])
	end,
}

