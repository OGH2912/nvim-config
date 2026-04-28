return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "intelephense",
                "jsonls",
                "yamlls",
                "lua_ls",
                "pyright",
            },
            automatic_installation = true,
        })
    end
}

