return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  keys = {
    { "<leader>m", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render/raw" },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- show raw markup on the line the cursor is on, so you can edit it;
    -- everything else stays rendered
    anti_conceal = { enabled = true },
    heading = {
      width = "block",
    },
    code = {
      width = "block",
      min_width = 60,
    },
  },
}
