vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.smartcase = true
vim.opt.ignorecase = false

local filetype_settings = {
  lua = { shiftwidth = 2, tabstop = 2, expandtab = true },
  go = { shiftwidth = 4, tabstop = 4, expandtab = false },
  rust = { shiftwidth = 4, tabstop = 4, expandtab = true },
  python = { shiftwidth = 4, tabstop = 4, expandtab = true },
  cpp = { shiftwidth = 4, tabstop = 4, expandtab = true },
  sql = { shiftwidth = 2, tabstop = 2, expandtab = true },
  bash = { shiftwidth = 2, tabstop = 2, expandtab = true },
  typescript = { shiftwidth = 2, tabstop = 2, expandtab = true },
  tsx = { shiftwidth = 2, tabstop = 2, expandtab = true },
  json = { shiftwidth = 2, tabstop = 2, expandtab = true },
  yaml = { shiftwidth = 2, tabstop = 2, expandtab = true },
  toml = { shiftwidth = 2, tabstop = 2, expandtab = true },
  markdown = { shiftwidth = 2, tabstop = 2, expandtab = true },
  markdown_inline = { shiftwidth = 2, tabstop = 2, expandtab = true },
  vim = { shiftwidth = 2, tabstop = 2, expandtab = true },
  vimdoc = { shiftwidth = 2, tabstop = 2, expandtab = true },
}
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local opts = filetype_settings[args.match]
    if opts then
      for k, v in pairs(opts) do
        vim.opt_local[k] = v
      end
    end
  end,
})

vim.cmd("colorscheme nordfox")
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
