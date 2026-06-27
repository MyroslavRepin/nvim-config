return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", text_align = "center" },
        },
      },
    })

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
  end,
}
