local M = {}

function M.on_attach(client, bufnr)
  -- Lspsaga-based LSP keymaps
  vim.keymap.set("n", "K", function()
    vim.cmd("Lspsaga hover_doc")
  end, { buffer = bufnr, desc = "LSP Hover Doc" })

  vim.keymap.set("n", "gd", function()
    vim.cmd("Lspsaga goto_definition")
  end, { buffer = bufnr, desc = "LSP Goto Definition" })

  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Implementation" })

  vim.keymap.set("n", "<leader>rn", function()
    vim.cmd("Lspsaga rename")
  end, { buffer = bufnr, desc = "LSP Rename" })

  vim.keymap.set("n", "<leader>ca", function()
    vim.cmd("Lspsaga code_action")
  end, { buffer = bufnr, desc = "LSP Code Action" })

  vim.keymap.set("n", "<leader>o", function()
    vim.cmd("Lspsaga outline")
  end, { buffer = bufnr, desc = "Show document symbols in an outline sidebar." })

  vim.keymap.set("n", "gr", function()
    vim.cmd("Lspsaga finder")
  end, { buffer = bufnr, desc = "LSP Finder (refs and defs)" })

  -- Diagnostics with Lspsaga
  vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Lspsaga show_line_diagnostics")
  end, { buffer = bufnr, desc = "Open Diagnostic" })

  vim.keymap.set("n", "[d", function()
    vim.cmd("Lspsaga diagnostic_jump_prev")
  end, { buffer = bufnr, desc = "Prev Diagnostic" })

  vim.keymap.set("n", "]d", function()
    vim.cmd("Lspsaga diagnostic_jump_next")
  end, { buffer = bufnr, desc = "Next Diagnostic" })

  -- Format via conform
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ lsp_fallback = true })
  end, { buffer = bufnr, desc = "Format file" })
end

return M
