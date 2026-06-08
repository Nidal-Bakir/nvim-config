vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local cmd = vim.cmd

-- map("n", "<leader>cd", Ex)
map("n", "<C-y>", '"_dd', { desc = "Delete line without cutting" })

-- Splits (Lua-native)
map("n", "<leader>sv", cmd.vsplit, { desc = "Split window vertically" })
map("n", "<leader>sh", cmd.split, { desc = "Split window horizontally" })

-- Move lines (more reliable than :m)
map("n", "<A-j>", function()
	cmd("move .+1")
	cmd("normal! ==")
end, { desc = "Move line down" })

map("n", "<A-k>", function()
	cmd("move .-2")
	cmd("normal! ==")
end, { desc = "Move line up" })

-- Visual indent + keep selection
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")

-- Map Ctrl+J to scroll half page down
vim.keymap.set({'n','v'}, '<C-j>', '<C-d>', { desc = 'Scroll half page down', noremap = true })

-- Map Ctrl+K to scroll half page up
vim.keymap.set({'n','v'}, '<C-k>', '<C-u>', { desc = 'Scroll half page up', noremap = true })
