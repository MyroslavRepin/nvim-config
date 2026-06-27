# Neovim Configuration

A modern Neovim setup with LSP support, fuzzy finding, file tree navigation, and syntax highlighting.
**Requirements:** nvim version >= 0.11

## 📦 Plugin Manager

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager with lazy loading

## 🎨 Theme & UI

- **[catppuccin](https://github.com/catppuccin/nvim)** - Soothing pastel theme
  - **Available flavours:** `mocha` (default), `macchiato`, `frappe`, `latte`
  - Change flavour in `lua/plugins/catppuccin.lua`
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Blazing fast statusline (dracula theme)
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Fast and customizable dashboard
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File icons
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Visual indent guides

## 🔍 Navigation & Search

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder for files and text
  - `<C-p>` - Find files
  - `<leader>fg` - Live grep (search text)
- **[telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim)** - Enhanced UI select with Telescope
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer
  - `<C-n>` - Toggle file tree
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding hints
  - Press `<Space>` and wait to see available keybindings

## 💻 LSP & Language Support

- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/linter installer
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Mason integration for LSP
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
  - **Installed Language Servers:**
    - `lua_ls` - Lua
    - `pyright` - Python
  - **Keybindings:**
    - `K` - Hover documentation
    - `gd` - Go to definition
    - `<leader>ca` - Code actions

## 🌳 Syntax Highlighting

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and code parsing
  - **Languages:** Lua, JavaScript

## ⚡ Productivity

- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Easy code commenting
  - `gcc` - Toggle comment on line
  - `gc` (visual mode) - Toggle comment on selection
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-close brackets and quotes
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with signs and hunks
  - `]c` / `[c` - Navigate git changes

## ⚙️ Settings

- **Leader key:** `Space`
- **Indentation:** 2 spaces
- **Tab expansion:** Enabled
- **Line numbers:** Enabled
- **Clipboard:** Synced with system clipboard
- **Search:** Smart case-insensitive search
- **Confirm on quit:** Ask to save unsaved changes
- **Diagnostics:** Inline messages with signs and underlines

## 📋 Dependencies

- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions
- **[nui.nvim](https://github.com/MunifTanjim/nui.nvim)** - UI component library

## 🚀 Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/MyroslavRepin/nvim-setup.git ~/.config/nvim
   ```

2. Start Neovim - plugins will install automatically:
   ```bash
   nvim
   ```

3. LSP servers will be installed via Mason on first launch.


