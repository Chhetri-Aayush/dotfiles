return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		-- Configuration options (optional)
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			show_start = false, -- Don't show the start of the scope (cleaner look)
		},
		exclude = {
			filetypes = { "help", "dashboard", "lazy" }, -- Disable for certain filetypes
		},
	},
}
