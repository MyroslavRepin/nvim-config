return {
  "saghen/blink.cmp",
  -- prebuilt fuzzy-matcher binary; pin to a release tag
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets", -- ready-made snippets
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab", -- <Tab> accept/snippet-jump, <S-Tab> back, <C-y> accept, <C-e> cancel, <C-Space> menu, <C-n>/<C-p> nav
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true }, -- show param hints while typing calls
  },
  opts_extend = { "sources.default" },
}
