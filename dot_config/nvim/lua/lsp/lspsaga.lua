local M = {}

function M.on_attach(client, bufnr)
  -- Lspsaga-based LSP keymaps
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = bufnr, desc = "LSP Hover" })
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { buffer = bufnr, desc = "LSP Goto Definition" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Implementation" })
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { buffer = bufnr, desc = "LSP Rename" })
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { buffer = bufnr, desc = "LSP Code Action" })
  vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", { buffer = bufnr, desc = "LSP References" })

  -- Diagnostics with Lspsaga
  vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { buffer = bufnr, desc = "Open Diagnostic" })
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { buffer = bufnr, desc = "Prev Diagnostic" })
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { buffer = bufnr, desc = "Next Diagnostic" })

  -- Format via conform
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ lsp_fallback = true })
  end, { buffer = bufnr, desc = "Format file" })
end

return M
