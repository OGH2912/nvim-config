return {
    "nvim-lualine/lualine.nvim",
    dependancies = { "folke/tokyonight.nvim" },
    config = function()
        require("lualine").setup({
            options = { theme = "tokyonight" }
        })
    end
}

