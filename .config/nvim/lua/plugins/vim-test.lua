return {
	"vim-test/vim-test",
	config = function()
		vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", { desc = "Test nearest" })
		vim.keymap.set("n", "<leader>tc", "<cmd>TestClass<CR>", { desc = "Test class" })
		vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>", { desc = "Test suite" })
		vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "Test file" })
	end,
	init = function()
		vim.g["test#csharp#runner"] = "dotnettest"
		vim.g["test#strategy"] = "make"
	end,
}
