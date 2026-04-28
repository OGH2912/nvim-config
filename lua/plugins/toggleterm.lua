return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 15,
            direction = "horizontal",
            shade_terminals = true,
            close_on_exit = true,
        })

        vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

        -- Run current Python file using the active conda env's python
        vim.keymap.set("n", "<leader>rp", function()
            local file = vim.fn.expand("%:p")
            require("toggleterm.terminal").Terminal:new({
                cmd = "python " .. file,
                direction = "horizontal",
                close_on_exit = false,
            }):toggle()
        end, { desc = "Run current Python file" })
    end,
}
