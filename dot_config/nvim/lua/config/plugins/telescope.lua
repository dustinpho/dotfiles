local M = {}

function M.setup()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      -- your telescope config here
    },
  })

  -- optionally load extensions here

  -- example keymaps
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Telescope: Find Files" })
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Telescope: Live Grep" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Telescope: List Buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Telescope: Help Tags" })

  vim.keymap.set("n", "<leader>lr", builtin.lsp_references,
    { noremap = true, silent = true, desc = "Telescope: LSP References" })
  vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions,
    { noremap = true, silent = true, desc = "Telescope: LSP Definitions" })
  vim.keymap.set("n", "<leader>li", builtin.lsp_implementations,
    { noremap = true, silent = true, desc = "Telescope: LSP Implementations" })
end

return M
