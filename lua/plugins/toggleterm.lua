return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      direction = "horizontal",
      open_mapping = [[<leader>tt]],
    })
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
  end,
}
