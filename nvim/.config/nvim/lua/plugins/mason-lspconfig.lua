-- This plugin bridges LSPs installed with the Mason LSP package manager with preconfigured LSP configs from nvim-lspconfig
-- It also automatically enabled Mason installed LSPs (vim.lsp.enable())
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "gopls",
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
