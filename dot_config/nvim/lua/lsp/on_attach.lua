local M = {}

function M.setup(client, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- LSP basics
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Doc")
	map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Goto Definition")
	map("n", "gr", "<cmd>Lspsaga finder<CR>", "LSP Finder")
	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename Symbol")
	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Action")
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")

	-- LSP keymaps
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Goto Definition" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Implementation" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "LSP References" })

	-- Diagnostics
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open Diagnostic" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

	vim.keymap.set("n", "<leader>f", function()
		require("conform").format({ lsp_fallback = true })
	end, { desc = "Format file" })
end

return M
