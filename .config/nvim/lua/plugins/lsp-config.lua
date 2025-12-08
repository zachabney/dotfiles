local on_attach = function(_, bufnr)
	local opts = function(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end

	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts("Signature help"))
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts("Jump to next diagnostic"))
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts("Jump to previous diagnostic"))
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts("Find references"))
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts("Open documentation")) -- uses Treesitter for formatting instead of regex
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts("Code action"))
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts("Peek definition"))
	vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts("Go to declaration"))
	vim.keymap.set("n", "tt", "<cmd>Lspsaga term_toggle<CR>", opts("Toggle terminal"))
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts("Rename symbol"))
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts("Show line diagnostics"))
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts("Show cursor diagnostics"))

	-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- 	severity_sort = true,
	-- })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities() -- autocompletion

return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		opts = {
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"html",
				"cssls",
				"emmet_ls",
				"angularls",
				"terraformls",
				"yamlls",
				"rust_analyzer",
				-- "omnisharp",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.angularls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					yaml = {
						format = {
							enable = true,
							singleQuote = true,
							printWidth = 120,
						},
						hover = true,
						completion = true,
						validate = true,
						schemas = {
							kubernetes = "*.yaml",
							["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.3-standalone-strict/_definitions.json"] = "*.k8s.yaml",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.{yml,yaml}",
							["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						},
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/json",
						},
					},
				},
				lspconfig.rust_analyzer.setup({
					on_attach = on_attach,
					capabilities = capabilities,
				}),
			})
			-- lspconfig.omnisharp.setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- 	cmd = {
			-- 		"/Users/zach/.local/share/nvim/mason/bin/omnisharp",
			-- 	},
			--
			-- 	-- Enables support for reading code style, naming convention and analyzer
			-- 	-- settings from .editorconfig.
			-- 	enable_editorconfig_support = true,
			--
			-- 	-- If true, MSBuild project system will only load projects for files that
			-- 	-- were opened in the editor. This setting is useful for big C# codebases
			-- 	-- and allows for faster initialization of code navigation features only
			-- 	-- for projects that are relevant to code that is being edited. With this
			-- 	-- setting enabled OmniSharp may load fewer projects and may thus display
			-- 	-- incomplete reference lists for symbols.
			-- 	enable_ms_build_load_projects_on_demand = false,
			--
			-- 	-- Enables support for roslyn analyzers, code fixes and rulesets.
			-- 	enable_roslyn_analyzers = true,
			--
			-- 	-- Specifies whether 'using' directives should be grouped and sorted during
			-- 	-- document formatting.
			-- 	organize_imports_on_format = true,
			--
			-- 	-- Enables support for showing unimported types and unimported extension
			-- 	-- methods in completion lists. When committed, the appropriate using
			-- 	-- directive will be added at the top of the current file. This option can
			-- 	-- have a negative impact on initial completion responsiveness,
			-- 	-- particularly for the first few completion sessions after opening a
			-- 	-- solution.
			-- 	enable_import_completion = true,
			--
			-- 	-- Specifies whether to include preview versions of the .NET SDK when
			-- 	-- determining which version to use for project loading.
			-- 	sdk_include_prereleases = false,
			--
			-- 	-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- 	-- true
			-- 	analyze_open_documents_only = true,
			-- })
		end,
	},
	{
		"jmederosalvarado/roslyn.nvim",
		config = true,
		opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	},
}
