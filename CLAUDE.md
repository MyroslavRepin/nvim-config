# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal Neovim configuration (lives at `~/.config/nvim`). Requires nvim >= 0.11 (uses the new `vim.lsp.config` / `vim.lsp.enable` API). Plugin manager is lazy.nvim, auto-bootstrapped on first launch.

## Architecture

Load order (`init.lua`):
1. Bootstraps lazy.nvim into `stdpath("data")/lazy`.
2. `require("vim-options")` — all editor options + global keymaps NOT tied to a plugin.
3. `require("lazy").setup("plugins")` — lazy.nvim scans **every file in `lua/plugins/`** and loads each as a plugin spec.

Key convention: each file in `lua/plugins/*.lua` returns a lazy.nvim spec (single table or list of tables). Adding a plugin = new file in that dir returning a spec; no central registry edit needed. `lua/plugins.lua` is a stub returning `{}` and is unused — real specs live in the `lua/plugins/` directory.

Non-plugin config (options, leader, diagnostics, custom keymaps like `<leader>?` cheatsheet, `<leader>nf`/`<leader>nd` file/folder creators) all in `lua/vim-options.lua`.

## LSP + formatting pipeline

Three-part chain across files:
- `lua/plugins/lsp-config.lua` — mason installs servers (`lua_ls`, `pyright`, `ruff`); `nvim-lspconfig` enables them via `vim.lsp.enable`. blink.cmp supplies completion capabilities to all servers. LSP keymaps (`K`, `gd`, `gr`, `<leader>rn`, `<leader>ca`) registered here.
- `lua/plugins/blink.lua` — completion engine.
- `lua/plugins/conform.lua` — format-on-save (500ms timeout, lsp fallback) + manual `<leader>f`. Python → `ruff_organize_imports` + `ruff_format`; Lua → `stylua`.

Division of labor for Python: pyright owns types/hover, ruff owns lint + organize-imports + format. Don't duplicate responsibilities between them.

## Lua style

Stylua formats Lua files (2-space indent, matches `expandtab`/`shiftwidth=2`). `.luarc.json` declares `vim` as a global for the Lua LS. Indentation everywhere is 2 spaces.

## Reference

- `SHPARGALKA.md` — keybinding cheatsheet (Russian), shown in-editor via `<leader>?` float.
- `README.md` — plugin list + keybindings, user-facing.
- `lazy-lock.json` — pinned plugin versions (lazy.nvim lockfile); commit changes after `:Lazy update`.

## Testing changes

No test suite. Verify by launching nvim: `nvim` (config auto-loads). Useful checks: `:Lazy` (plugin status/sync), `:Mason` (LSP servers), `:ConformInfo` (formatter status), `:checkhealth`.
