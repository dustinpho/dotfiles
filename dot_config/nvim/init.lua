vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true
vim.opt.mouse = ""

require("config.options")
require("config.plugins")
require("config.keymaps")
require("config.cmp")
require("config.treesitter")

require("lsp")
require("completion")
