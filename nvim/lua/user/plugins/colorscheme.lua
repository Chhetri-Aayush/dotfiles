return {
	-- gruvdark
	{
		"darianmorat/gruvdark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvdark")
		end,
	},
	-- base gruvbox
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			-- this dim_inactive adn the transparent_mode is just so that it won't throw errors like it is ..you can remove it
	-- 			dim_inactive = false,
	-- 			transparent_mode = false,
	-- 			overrides = {
	-- 				SignColumn = { bg = "#282828" },
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	-- rose-pine
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	-- grubbox transparent
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			overrides = {
	-- 				Normal = { bg = "NONE" }, -- Try to make background transparent
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 		-- Also try setting highlight groups
	-- 		-- this will also turn the text trasnparetn
	-- 		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },
}
