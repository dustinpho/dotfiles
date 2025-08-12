local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Package manager
  { "williamboman/mason.nvim",          config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- Tool installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "rust-analyzer",
        "clangd",
        "lua_ls",
        "gopls",
        "sqlfluff",
      },
    },
  },

  -- colorscheme
  { "EdenEast/nightfox.nvim", priority = 1000 },

  -- automatic session management
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = { suppressed_dirs = { '~/', '/' } }
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",           -- or your theme name like "tokyonight", "gruvbox"
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1,               -- relative path from cwd
            }
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- simpler buffer explorer
  { "jlanzarotta/bufexplorer" },

  -- detect key map conflicts and show available actions when typing
  {
    "folke/which-key.nvim",
    event = "VeryLazy",     -- lazy-load after startup
    config = function()
      require("which-key").setup({})
    end,
  },

  -- git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- git blame
  { "f-person/git-blame.nvim" },

  -- pane navigation
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require("config.plugins.tmux-navigation").setup()
    end,
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",     -- Required for latest v3+
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "┊",
          highlight = "IblIndent",
        },
        scope = {
          enabled = false,           -- disable scope lines if you want it more subtle
        },
        exclude = {
          filetypes = { "help", "dashboard", "lazy", "NvimTree" },
          buftypes = { "terminal", "nofile" },
        },
      })
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4252", nocombine = true })
    end,
  },

  -- Surround editing (add/change/delete quotes, brackets, etc.)
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config.plugins.treesitter").setup()
    end,
  },

  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",       -- optional
    },
    config = function()
      require("config.plugins.telescope").setup()
    end,
  },

  -- Tree file directory
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },     -- optional
    config = function()
      require("config.plugins.nvim-tree").setup()
    end,
  },

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- LSP UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          hover = {
            enabled = true,             -- enables Noice hover window
          },
          signature = {
            enabled = true,             -- Noice signature help
          },
          message = {
            enabled = true,             -- LSP messages like rename and progress
          },
        },
        presets = {
          lsp_doc_border = true,           -- bordered docs like Lspsaga
        },
      })

      vim.notify = require("notify")       -- Use noice-enhanced notify
    end,
  },

  -- better code action previews
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    config = function()
      require("actions-preview").setup({
        -- compact dropdown theme instead of full-screen list
        telescope = require("telescope.themes").get_dropdown({}),
      })
    end,
  },

  -- structural search and replace
  -- {
  --     "cshuaimin/ssr.nvim",
  --     opts = {},
  --     keys = {
  --         { "<leader>ssr", function() require("ssr").open() end, desc = "Structural Search and Replace" },
  --     },
  -- },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        proto = { "buf" },
        python = { "black" },
        sql = { "sqlfluff" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
      },
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.plugins.cmp").setup()
    end,
  },
})
