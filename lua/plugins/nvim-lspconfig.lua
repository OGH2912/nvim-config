return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local servers = require("mason-lspconfig").get_installed_servers()

        for _, server in ipairs(servers) do
            vim.lsp.enable(server, {
                capabilities = capabilities,
            })
        end
    end
}

