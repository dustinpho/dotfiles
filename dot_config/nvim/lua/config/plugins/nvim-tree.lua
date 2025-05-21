local M = {}

function M.setup()
  require("nvim-tree").setup({
    view = {
      width = 30,
      side = "left",
      preserve_window_proportions = true,
    },
    filters = {
      dotfiles = false,
      custom = { "target", "release" }, -- example to hide Rust build folders
    },
    git = {
      enable = true,
      ignore = true,
    },
  })

  -- keymap example if you want
  vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
end

return M
