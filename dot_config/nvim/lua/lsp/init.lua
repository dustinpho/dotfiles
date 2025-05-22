local lspconfig = require("lspconfig")
local lspsaga = require("lsp.lspsaga")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP servers
local servers = {
  "rust_analyzer",
  "pyright",
  "clangd",
  "lua_ls",
  "gopls",
}

for _, server in ipairs(servers) do
  local opts = {
    on_attach = lspsaga.on_attach,
    capabilities = capabilities,
  }

  if server == "rust_analyzer" then
    opts.settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy", -- this enables running clippy for diagnostics
        },
      },
    }
  end

  lspconfig[server].setup(opts)
end
