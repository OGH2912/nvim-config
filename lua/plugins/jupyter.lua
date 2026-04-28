return {
    -- Image rendering (iTerm2 supports kitty protocol)
    {
        "3rd/image.nvim",
        lazy = true,
        opts = {
            backend = "kitty",
            integrations = {},
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },

    -- Jupyter kernel interaction
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        dependencies = { "3rd/image.nvim" },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_auto_open_output = false
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
        end,
        keys = {
            { "<localleader>mi", ":MoltenInit<CR>",                              desc = "Molten: init kernel",          silent = true },
            { "<localleader>rr", ":MoltenReevaluateCell<CR>",                    desc = "Molten: re-evaluate cell",     silent = true },
            { "<localleader>rl", ":MoltenEvaluateLine<CR>",                      desc = "Molten: evaluate line",        silent = true },
            { "<localleader>rd", ":MoltenDelete<CR>",                            desc = "Molten: delete cell",          silent = true },
            { "<localleader>oh", ":MoltenHideOutput<CR>",                        desc = "Molten: hide output",          silent = true },
            { "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",             desc = "Molten: enter output window",  silent = true },
            { "<localleader>rv", ":<C-u>MoltenEvaluateVisual<CR><ESC>",          desc = "Molten: evaluate visual",      mode = "v", silent = true },
            { "<localleader>e",  ":MoltenEvaluateOperator<CR>",                  desc = "Molten: evaluate operator",    silent = true },
        },
    },

    -- Convert .ipynb <-> .py with # %% cell markers
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        opts = {
            style = "hydrogen",       -- # %% cell markers
            output_extension = "auto",
            force_ft = "python",
        },
    },
}
