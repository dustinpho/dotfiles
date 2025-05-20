-- Telescope: Normal mode
local tsbuiltin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", tsbuiltin.find_files, opts)
vim.keymap.set("n", "<leader>fg", tsbuiltin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", tsbuiltin.buffers, opts)
vim.keymap.set("n", "<leader>fh", tsbuiltin.help_tags, opts)
vim.keymap.set("n", "<leader>fr", tsbuiltin.oldfiles, opts)

vim.keymap.set("n", "<leader>lr", tsbuiltin.lsp_references, opts)
vim.keymap.set("n", "<leader>ld", tsbuiltin.lsp_definitions, opts)
vim.keymap.set("n", "<leader>li", tsbuiltin.lsp_implementations, opts)
vim.keymap.set("n", "<leader>ls", tsbuiltin.lsp_document_symbols, opts)

-- nvim-tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus File Tree" })

-- Nvim tmux navigation
local nvim_tmux_nav = require('nvim-tmux-navigation')
vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
