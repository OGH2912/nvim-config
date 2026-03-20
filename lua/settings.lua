vim.g.mapleader = " "

-- editor options
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

-- keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>")

vim.keymap.set("n", "<leader>q", ":bdelete<CR>")     -- close current buffer
vim.keymap.set("n", "=", ":BufferLineCycleNext<CR>") -- next buffer
vim.keymap.set("n", "-", ":BufferLineCyclePrev<CR>") -- previous buffer
vim.keymap.set("n", "+", ":BufferLineMoveNext<CR>")  -- move buffer right
vim.keymap.set("n", "_", ":BufferLineMovePrev<CR>")  -- move buffer left
