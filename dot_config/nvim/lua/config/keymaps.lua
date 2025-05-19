-- Telescope keymaps
local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

-- Telescope: Normal mode
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, opts)

vim.keymap.set("n", "<leader>lr", builtin.lsp_references, opts)
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, opts)
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, opts)
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, opts)
