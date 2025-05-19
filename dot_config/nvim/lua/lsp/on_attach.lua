local M = {}

M.on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  bufmap("n", "K", vim.lsp.buf.hover, "Hover Docs")
  bufmap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, "Format buffer")
end

return M.on_attach

