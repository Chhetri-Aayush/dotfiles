local function has_config_file(bufnr, filename)
	local root = vim.fs.root(bufnr, { ".git", "package.json" })
	if not root then
		return false
	end
	for _, name in ipairs(filename) do
		if vim.uv.fs_stat(root .. "/" .. name) then
			return true
		end
	end

	return false
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = function(bufnr)
					if has_config_file(bufnr, { "biome.json" }) then
						return { "biome" }
					else
						return { "prettier" }
					end
				end,

				typescript = function(bufnr)
					if has_config_file(bufnr, { "biome.json" }) then
						return { "biome" }
					else
						return { "prettier" }
					end
				end,
				javascriptreact = function(bufnr)
					if has_config_file(bufnr, { "biome.json" }) then
						return { "biome" }
					else
						return { "prettier" }
					end
				end,
				typescriptreact = function(bufnr)
					if has_config_file(bufnr, { "biome.json" }) then
						return { "biome" }
					else
						return { "prettier" }
					end
				end,
				-- typescript = { "prettier" },
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				h = { "clang_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
