-- Package manager for LSP servers, linters, and formatters
return {
    "mason-org/mason.nvim",
    opts = {
        -- Roslyn (C#) is not in the official Mason registry, so we need to add Crashdummy/mason-registry
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        }
    }
}
