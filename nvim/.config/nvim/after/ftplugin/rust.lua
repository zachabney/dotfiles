vim.treesitter.start()

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                target = "riscv32imac-unknown-none-elf",
                allTargets = false,
            },
        },
    },
})
