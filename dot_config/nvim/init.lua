vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true
vim.opt.mouse = ""

require("config.plugins")
require("config.options")
require("lsp")
