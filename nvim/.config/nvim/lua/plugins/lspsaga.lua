return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            finder = {
				default = "ref+imp+def",
				keys = {
					vsplit = "v",
					split = "h",
					toggle_or_open = "<CR>",
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = true,
				-- extend_gitsigns = true,
			},
			definition = {
				keys = {
					edit = "o",
					vsplit = "v",
					split = "h",
					tabe = "t",
				},
			},
			lightbulb = {
				virtual_text = false, -- hide light bulb at end of line
			},
            ui = {
                code_action = ''
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
