return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
        -- Disable default inline diagnostics
        vim.diagnostic.config({
            virtual_text = false,
        })

        require("tiny-inline-diagnostic").setup({
            preset = "modern",

            options = {
                show_source = {
                    enabled = true,
                },
            },

            multilines = {
                enabled = true,
            },
        })
    end
}

