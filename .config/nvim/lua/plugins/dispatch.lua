return {
	enabled = false,
	"tpope/vim-dispatch",
	config = function()
		local augroup = vim.api.nvim_create_augroup("ZachDispatch", {})
		vim.api.nvim_clear_autocmds({ group = augroup })
		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			pattern = "qf",
			callback = function()
				vim.schedule(function()
					vim.cmd("TroubleToggle quickfix")
					vim.cmd("cclose")
				end)
			end,
		})
	end,
}
