return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require('trouble')
        trouble.setup({
            use_diagnostic_signs = true,
        })
    end
}
