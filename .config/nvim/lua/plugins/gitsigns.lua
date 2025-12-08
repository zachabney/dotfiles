return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 0,
		},
		-- on_attach = function(bufnr)
		-- 	local gs = package.loaded.gitsigns
		-- 	local function map(mode, l, r, opts)
		-- 		opts = opts or {}
		-- 		opts.buffer = bufnr
		-- 		vim.keymap.set(mode, l, r, opts)
		-- 	end
		--
		-- 	-- Navigation
		-- 	map("n", "]c", function()
		-- 		if vim.wo.diff then
		-- 			return "]c"
		-- 		end
		-- 		vim.schedule(function()
		-- 			gs.next_hunk()
		-- 		end)
		-- 		return "<Ignore>"
		-- 	end, { expr = true, desc = "Next hunk" })
		--
		-- 	map("n", "[c", function()
		-- 		if vim.wo.diff then
		-- 			return "[c"
		-- 		end
		-- 		vim.schedule(function()
		-- 			gs.prev_hunk()
		-- 		end)
		-- 		return "<Ignore>"
		-- 	end, { expr = true, desc = "Previous hunk" })
		--
		-- 	-- Actions
		-- 	map("n", "<leader>gsh", gs.stage_hunk, { desc = "Git stage hunk" })
		-- 	map("n", "<leader>grh", gs.reset_hunk, { desc = "Git reset hunk" })
		-- 	-- map("v", "<leader>hs", function()
		-- 	-- 	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		-- 	-- end)
		-- 	-- map("v", "<leader>hr", function()
		-- 	-- 	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		-- 	-- end)
		-- 	map("n", "<leader>gsb", gs.stage_buffer, { desc = "Git stage buffer" })
		-- 	map("n", "<leader>gus", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
		-- 	map("n", "<leader>grb", gs.reset_buffer, { desc = "Git reset buffer" })
		-- 	map("n", "<leader>gp", gs.preview_hunk, { desc = "Git preview hunk" })
		-- 	map("n", "<leader>gbl", function()
		-- 		gs.blame_line({ full = true })
		-- 	end, { desc = "Git blame line" })
		-- 	map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Git toggle line blame" })
		-- 	map("n", "<leader>gd", gs.diffthis, { desc = "Git diff this" })
		-- 	map("n", "<leader>gD", function()
		-- 		gs.diffthis("~")
		-- 	end, { desc = "Git diff this against last commit" })
		-- 	map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Git toggle deleted" })
		--
		-- 	-- Text object
		-- 	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git select hunk" })
		-- end,
	},
}
