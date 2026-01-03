-- Quick and temporary file shortcuts
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

        local extensions = require('harpoon.extensions')
        harpoon:extend(extensions.builtins.navigate_with_number())
	end,
}

