return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "lua", "javascript", "python", "markdown", "markdown_inline",
      })

      vim.api.nvim_create_autocmd("FileType", {
        -- markdown highlighter must start manually on the main branch,
        -- otherwise render-markdown.nvim has nothing to render (issue #607)
        pattern = { "lua", "javascript", "python", "markdown" },
        callback = function()
          -- parser may not be built yet (async install) — don't crash file opening
          local ok = pcall(vim.treesitter.start)
          if ok then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
