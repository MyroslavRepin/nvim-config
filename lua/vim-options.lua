vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Show line numbers
vim.o.number = true

-- Persistent undo: undo history survives restart
vim.o.undofile = true

-- Keep 8 lines visible above/below cursor
vim.o.scrolloff = 8

-- Always show sign column so gutter doesn't jitter when diagnostics appear
vim.o.signcolumn = "yes"

-- Sync clipboard with OS
vim.schedule(function() 
  vim.o.clipboard = 'unnamedplus' 
end)

-- Ask to save unsaved changes instead of failing
vim.o.confirm = true

-- Smart case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Folding by indent (collapse python funcs/blocks). Start fully open.
-- foldmethod/foldlevel are window-local, so apply per-window via autocmd.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.wo.foldmethod = "indent"
    vim.wo.foldlevel = 99
  end,
})
vim.o.foldlevelstart = 99

-- Inline messages config
vim.diagnostic.config({
  -- virtual_text disabled: tiny-inline-diagnostic.nvim renders inline diagnostics
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})

-- Cheatsheet popup: opens SHPARGALKA.md in a centered float (q / Esc to close)
_G.open_cheatsheet = function()
  local path = vim.fn.stdpath("config") .. "/SHPARGALKA.md"
  local buf = vim.fn.bufadd(path)
  vim.fn.bufload(buf)
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].modifiable = false

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.85)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
    title = " 🥷 Cheatsheet — q/Esc закрыть ",
    title_pos = "center",
  })
  vim.wo[win].wrap = true
  vim.wo[win].conceallevel = 2
  vim.wo[win].cursorline = true
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, nowait = true })
end

vim.keymap.set("n", "<leader>?", _G.open_cheatsheet, { desc = "Cheatsheet" })

-- Copy whole buffer to system clipboard
vim.keymap.set("n", "<leader>y", '<cmd>%y+<CR>', { desc = "Copy whole buffer to clipboard" })

-- Window / split management
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Resize with Ctrl+arrows (may not pass through in some terminals)
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- Resize fallback (always works, terminal-independent): leader + arrows
vim.keymap.set("n", "<leader><Up>", "<cmd>resize +2<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<leader><Down>", "<cmd>resize -2<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<leader><Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<leader><Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- New file: prompt relative path, create dirs, open it
vim.keymap.set("n", "<leader>nf", function()
  local path = vim.fn.input("New file: ", "", "file")
  if path == "" then return end
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
  vim.cmd("edit " .. vim.fn.fnameescape(path))
  vim.cmd("write")
end, { desc = "New file" })

-- New folder: prompt path, mkdir -p
vim.keymap.set("n", "<leader>nd", function()
  local path = vim.fn.input("New folder: ", "", "dir")
  if path == "" then return end
  vim.fn.mkdir(path, "p")
  print("created " .. path)
end, { desc = "New folder" })
