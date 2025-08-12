local M = {}

function M.setup()
  require("nvim-tree").setup({
    -- update_focused_file = { enable = true },
    view = {
      width = 30,
      side = "left",
      -- preserve_window_proportions = true,
      number = true,
    },
    filters = {
      dotfiles = false,
      custom = { "target", "release" },       -- hide Rust build folders
    },
    git = {
      enable = true,
      ignore = true,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
        }
      }
    },
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        require("nvim-tree.api").tree.open()
      end
    end
  })

  -- keymap example if you want
  vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
end

return M
