return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- similary this is out of order cause it is used at the bottom ..
		-- vim.diagnostic.config({
		--   virtual_text = true,
		--   signs = true,
		--   underline = true,
		--   update_in_insert = false,
		--   severity_sort = true,
		-- })
		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					{ desc = "show refrences for the word under the cursor" }
				)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					{ desc = "shows the implementations of the word in the whole project" }
				)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "show the buffer diagnostic in the Telescope" }
				) -- show  diagnostics for file

				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ desc = "show the line diagnostic under the cursor" }
				) -- show diagnostics for line

				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to the preivious diagnostic" }) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to the next diagnostic" }) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- this is dpereacted the vim.fn.sign_define so for now it is out of order...
		--     local signs = { Error = "E", Warn = "W ", Hint = "H", Info = " "
		--     for type, icon in pairs(signs) do
		--       local hl = "DiagnosticSign" .. type
		--       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		--     end

		local signs = { Error = "E", Warn = "W", Hint = "H", Info = " " }
		vim.diagnostic.config({
			virtual_text = true,
			signs = {
				enable = true,
				text = {
					["ERROR"] = signs.Error,
					["WARN"] = signs.Warn,
					["HINT"] = signs.Hint,
					["INFO"] = signs.Info,
				},
				severity_sort = true,
			},
			underline = true,
			update_in_insert = false,
		})

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
								-- disable = "missing_fields",
								-- missing_parameters = false,
								disable = { "missing-parameters", "missing-fields" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
