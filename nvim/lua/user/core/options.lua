vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number= true

--formatting
opt.autoindent = true
opt.smartindent = true

--search settings
opt.ignorecase = true 
opt.smartcase= true
opt.hlsearch =false 

--remove swp files
opt.swapfile=false

--themes and other colors
opt.termguicolors = true
opt.background = "dark"

opt.cursorline=true

--add clipboard and make it possible to yank it 
opt.clipboard:append("unnamedplus") 

--add splits in nvim
opt.splitright = true
opt.splitbelow = true

-- Set cursor shape to block in Insert mode
opt.guicursor = 'i:block'

-- set the format options to jql or anything except cro
-- vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter","BufRead","BufNewFile"}, {
--   pattern = '*',
--   command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o', -- removes cro  from the format options leaving rest the same 
-- })

-- THE BELOW CODE IS GIVEN BY MY FRINED WHICH USES CALLBACK INSTEAD OF COMMAND
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "BufRead", "BufNewFile"}, {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = "jql" --sets the format options to jql only 
    end,
})
