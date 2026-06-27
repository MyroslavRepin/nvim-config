return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<leader>f", group = "find / format" },
      { "<leader>fg", desc = "Find Text (grep)" },
      { "<leader>f", desc = "Format file" },
      { "<leader>c", group = "code" },
      { "<leader>ca", desc = "Code Action" },
      { "<leader>?", desc = "Cheatsheet" },
    })
  end
}
