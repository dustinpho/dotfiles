local M = {}

function M.setup()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip",  priority = 750 },
      { name = "buffer",   priority = 500 },
      { name = "path",     priority = 250 },
    },
    sorting = {
      comparators = {
        function(entry1, entry2)
          local kind1 = entry1:get_kind()
          local kind2 = entry2:get_kind()
          local field_kinds = {
            [5] = true, -- Field
            [6] = true, -- Variable
            [7] = true, -- Property
          }

          if field_kinds[kind1] and not field_kinds[kind2] then
            return true
          elseif not field_kinds[kind1] and field_kinds[kind2] then
            return false
          end
        end,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  })

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
