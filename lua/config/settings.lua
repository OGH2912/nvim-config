-- editor options
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = "*",
    command = "silent! write",
})
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("i", "<Down>", "<C-o>gj")
vim.keymap.set("i", "<Up>", "<C-o>gk")
vim.keymap.set("i", "<M-BS>", "<C-w>")
vim.keymap.set("i", "<M-Left>", "<C-Left>")
vim.keymap.set("i", "<M-Right>", "<C-Right>")
vim.keymap.set("i", "<M-Up>", "<C-Home>")
vim.keymap.set("i", "<M-Down>", "<C-End>")
vim.keymap.set("i", "<D-Left>", "<Home>")
vim.keymap.set("i", "<D-Right>", "<End>")
vim.keymap.set("i", "<D-Up>", "<C-Home>")
vim.keymap.set("i", "<D-Down>", "<C-End>")
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.spell = true
vim.opt.spelllang = {"en_gb"}

-- set indentation options
vim.opt.tabstop = 4        -- Number of spaces in a <Tab>
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smarter autoindent
vim.opt.softtabstop = 4    -- Number of spaces for <Tab> in insert mode (including backspace)

