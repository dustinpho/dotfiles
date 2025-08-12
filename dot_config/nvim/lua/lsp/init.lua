local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP servers
local servers = {
  "rust_analyzer",
  "pyright",
  "clangd",
  "lua_ls",
  "gopls",
  "biome",
}

for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server == "rust_analyzer" then
    opts.settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy", -- this enables running clippy for diagnostics
        },
        inlayHints = {
          bindingModeHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
          parameterHints = { enable = true },
          typeHints = { enable = true },
          reborrowHints = { enable = false },        -- annoying hints about implicit borrows
          lifetimeElisionHints = { enable = false }, -- annoying lifetime hints
        },
      },
    }
  end

  lspconfig[server].setup(opts)
end
