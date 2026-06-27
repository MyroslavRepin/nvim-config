return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        lua = { "stylua" },
      },
      -- format on save
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })

    -- manual format: <leader>f
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end, { desc = "Format file/selection" })
  end,
}
