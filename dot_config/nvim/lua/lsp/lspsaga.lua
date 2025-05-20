local M = {}

local saga = require("lspsaga")

function M.on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
end

return M
