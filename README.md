# Neovim Configuration

A modern Neovim setup with LSP, autocompletion, fuzzy finding, file tree, formatting, git integration, a buffer bar, and a Snacks dashboard.

**Requirements:** nvim >= 0.11

## Keymaps

Leader key is `Space`.

### General (`lua/vim-options.lua`)

| Key | Action |
|-----|--------|
| `<leader>?` | Open cheatsheet float (`SHPARGALKA.md`) |
| `<leader>nf` | New file (prompt path, create dirs, open) |
| `<leader>nd` | New folder (prompt path, `mkdir -p`) |

### Navigation & Search

| Key | Action | Plugin |
|-----|--------|--------|
| `<C-p>` | Find files | telescope |
| `<leader>fg` | Live grep (search text) | telescope |
| `<C-n>` | Reveal file tree (left) | neo-tree |
| `<Space>` (wait) | Show keybinding hints | which-key |

### Buffers (`lua/plugins/bufferline.lua`)

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>bp` | Pick buffer by label |
| `<leader>bd` | Close current buffer |

### LSP (`lua/plugins/lsp-config.lua`)

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action (n + v) |

### Formatting (`lua/plugins/conform.lua`)

| Key | Action |
|-----|--------|
| `<leader>f` | Format file/selection (n + v) |

Format also runs on save (500ms timeout, LSP fallback).

### Editing & Tools

| Key | Action | Plugin |
|-----|--------|--------|
| `gcc` | Toggle comment line | Comment.nvim |
| `gc` (visual) | Toggle comment selection | Comment.nvim |
| `<leader>m` | Toggle markdown render/raw | render-markdown |
| `<leader>tt` | Toggle terminal | toggleterm |
| `<Esc>` (terminal) | Terminal → normal mode | toggleterm |

### Completion — blink.cmp (`super-tab` preset)

| Key | Action |
|-----|--------|
| `<Tab>` | Accept / snippet jump |
| `<S-Tab>` | Jump back |
| `<C-y>` | Accept |
| `<C-e>` | Cancel |
| `<C-Space>` | Open menu |
| `<C-n>` / `<C-p>` | Navigate items |

## Plugins

**Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)

**Theme & UI**
- [catppuccin](https://github.com/catppuccin/nvim) — theme (`mocha` default; `macchiato`/`frappe`/`latte` in `lua/plugins/catppuccin.lua`)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — statusline
- [snacks.nvim](https://github.com/folke/snacks.nvim) — dashboard (recent files, projects, git status)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) — indent guides
- nvim-web-devicons — file icons

**Navigation & Search**
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + telescope-ui-select
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — file explorer
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — buffer bar at top (LSP diagnostics, thin separators)
- [which-key.nvim](https://github.com/folke/which-key.nvim) — keybinding hints

**LSP, Completion & Formatting**
- [mason.nvim](https://github.com/williamboman/mason.nvim) + mason-lspconfig — installs `lua_ls`, `pyright`, `ruff`
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — LSP setup
- [blink.cmp](https://github.com/saghen/blink.cmp) — completion engine
- [conform.nvim](https://github.com/stevearc/conform.nvim) — format on save (Python: `ruff`; Lua: `stylua`)

**Syntax & Markdown**
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) — inline markdown render
- [glow.nvim](https://github.com/ellisonleao/glow.nvim) — markdown preview (`:Glow`)

**Productivity & Git**
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — git signs in gutter
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) — floating/split terminal
- [vim-wakatime](https://github.com/wakatime/vim-wakatime) — time tracking

**Dependencies:** plenary.nvim, nui.nvim

## Settings

- Leader: `Space`
- Indentation: 2 spaces, expandtab
- Line numbers, persistent undo, `scrolloff=8`, always-on signcolumn
- System clipboard sync (`unnamedplus`)
- Smart case-insensitive search
- Confirm on quit, inline diagnostics (virtual text + signs + underline)

## Installation

```bash
git clone https://github.com/MyroslavRepin/nvim-setup.git ~/.config/nvim
nvim
```

Plugins install on first launch; Mason installs LSP servers automatically.

## Useful commands

`:Lazy` (plugins) · `:Mason` (LSP servers) · `:ConformInfo` (formatters) · `:Glow` (markdown preview) · `:checkhealth`
