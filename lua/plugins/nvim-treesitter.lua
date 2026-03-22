return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.config").setup({
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = {
                "bash",
                "go",
                "json",
                "lua",
                "perl",
                "php",
                "yaml",
            },
        })
    end
}

