vim.g.mapleader = "\\"

local keymap = vim.keymap.set
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true  })
end, { desc = "Format buffer"  })

-- CamelCaseMotion mappings
-- vim.cmd [[
--   nmap <silent> w <Plug>CamelCaseMotion_w
--   nmap <silent> b <Plug>CamelCaseMotion_b
--   nmap <silent> e <Plug>CamelCaseMotion_e
-- ]]

