vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- indentation
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4

--remove swp files
opt.swapfile = false

--add splits in nvim
opt.splitright = true
opt.splitbelow = true

-- Set cursor shape to block in Insert mode
opt.guicursor = "i:block"

--wrapping
-- opt.wrap = true
-- opt.textwidth = 80
-- opt.colorcolumn = "80"

--horizontal line at the cursor
opt.cursorline = true
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#DDC7A1" })
--add clipboard and make it possible to yank it
opt.clipboard:append("unnamedplus")

--searching
opt.ignorecase = true
opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

--256 bit color support
vim.opt.termguicolors = true

--background color
opt.background = "dark"

vim.opt.signcolumn = "yes"
