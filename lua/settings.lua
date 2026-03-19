vim.g.mapleader = " "

-- editor options
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

-- set indentation options
vim.opt.tabstop = 4        -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent (>>, <<, etc.)
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smart autoindent (improves on autoindent for code)
vim.opt.softtabstop = 4    -- Number of spaces for <Tab> in insert mode (backspace deletes 4 spaces)

-- keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>")

vim.keymap.set("n", "<leader>ss", ":AutoSession save<CR>")
vim.keymap.set("n", "<leader>sr", ":AutoSession restore<CR>")
vim.keymap.set("n", "<leader>sd", ":AutoSession delete<CR>")

vim.keymap.set("n", "<leader>q", ":bdelete<CR>")     -- close current buffer
vim.keymap.set("n", "=", ":BufferLineCycleNext<CR>") -- next buffer
vim.keymap.set("n", "-", ":BufferLineCyclePrev<CR>") -- previous buffer
vim.keymap.set("n", "+", ":BufferLineMoveNext<CR>")  -- move buffer right
vim.keymap.set("n", "_", ":BufferLineMovePrev<CR>")  -- move buffer left
