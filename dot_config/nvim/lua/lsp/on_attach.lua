local M = {}

function M.on_attach(client, bufnr)
  -- Hover doc
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover Doc" })

  -- Goto
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP Goto Definition" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Implementation" })
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP References" })

  -- Rename & Code Action
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
  -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
  vim.keymap.set({ "n", "v" }, "<leader>ca", function()
    require("actions-preview").code_actions()
  end, { desc = "LSP Code Action (preview)" })



  -- Diagnostics
  vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
  end, { buffer = bufnr, desc = "Line Diagnostics" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Prev Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })

  -- Format
  vim.keymap.set("n", "<leader>=<CR>", function()
    require("conform").format({ lsp_fallback = true })
  end, { desc = "Format file with Conform" })


  -- show diagnostic on CursorHold
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end,
  })

  -- enable inlay hints
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

return M
