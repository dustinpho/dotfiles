local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local on_attach = require("lsp.on_attach")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

-- LSP servers
local servers = {
  "rust_analyzer",
  "pyright",
  "clangd",
  "lua_ls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
