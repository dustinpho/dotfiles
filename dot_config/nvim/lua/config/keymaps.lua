-- Disable arrow keys in normal, insert, and visual modes
local opts = { noremap = true, silent = true }

-- Normal mode
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)

-- Visual mode
vim.keymap.set("v", "<Up>", "<Nop>", opts)
vim.keymap.set("v", "<Down>", "<Nop>", opts)
vim.keymap.set("v", "<Left>", "<Nop>", opts)
vim.keymap.set("v", "<Right>", "<Nop>", opts)

vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { silent = true })
