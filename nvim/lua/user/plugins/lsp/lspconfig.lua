return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		mason.setup()
		mason_lspconfig.setup()

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

				keymap.set("n", "<leader>qf", function()
					vim.diagnostic.setqflist()
				end, { desc = "send all the error sin the quick fix list" })

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
		-- vim.lsp.enable("lua_ls")
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						-- globals = { "vim", "require" },
						globals = { "vim" },
						disable = { "missing-parameters", "missing-fields" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false, -- disable annoying prompts
					},
					completion = {
						callSnippet = "Replace",
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("pyright", {
			before_init = function(_, config)
				config.settings = {
					python = {
						pythonPath = "/home/ac/.cache/pypoetry/virtualenvs/telecommunication-1XwZR-Wc-py3.12 ",
					},
				}
			end,
		})
	end,
}
