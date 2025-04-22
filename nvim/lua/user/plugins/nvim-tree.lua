return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		vim.cmd([[
      highlight NvimTreeGitUnstaged guifg=#d79921
      highlight NvimTreeGitStaged guifg=#d65d0e
      highlight NvimTreeGitRenamed guifg=#d65d0e
      highlight NvimTreeGitUntracked guifg=#d65d0e
      highlight NvimTreeGitDeleted guifg=#d65d0e
      highlight NvimTreeGitIgnored guifg=#d65d0e
    ]])
		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 30,
				-- relativenumber = true, -- Uncomment if needed
			},
			renderer = {
				-- highlight_git = "icon",
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "after",
					glyphs = {
						folder = {
							arrow_closed = "", -- Arrow when folder is closed
							arrow_open = "", -- Arrow when folder is open
						},
						git = {
							deleted = "✖",
							renamed = "➜",
							untracked = "U", -- "U",
							ignored = "◌",
							unstaged = "✗",
							staged = "✓",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
		})

		-- Set keymaps
		local keymap = vim.keymap -- For conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
