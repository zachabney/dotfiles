-- Neovim launch window with options to reopen recently open files
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}

