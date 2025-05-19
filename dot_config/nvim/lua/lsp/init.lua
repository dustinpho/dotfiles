local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local on_attach = require("lsp.on_attach")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "rust_analyzer",
    "pyright",
    "clangd",
  },
})

-- Explicitly setup each LSP server
local servers = {
  "rust_analyzer",
  "pyright",
  "clangd",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
