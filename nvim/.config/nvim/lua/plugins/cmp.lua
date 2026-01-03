-- Autocompletion
return {
    { 'hrsh7th/cmp-nvim-lsp' }, -- Autocompletion source from LSP
    { 'hrsh7th/cmp-buffer' }, -- Autocompletion source from current buffer
    { 'hrsh7th/cmp-path' }, -- Autocompletion source from file paths
    { 'L3MON4D3/LuaSnip' }, -- Snippet engine
    { -- Base plugin
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
						if cmp.visible() then
							local entry = cmp.get_selected_entry()
							if not entry then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								cmp.confirm()
							end
						else
							fallback()
						end
					end, { "i", "s", "c" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
            })
        end
    },
}
