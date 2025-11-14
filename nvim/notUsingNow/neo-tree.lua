return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", 
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({
      sources = { "filesystem", "git_status" }, -- Set up the sources you want to use
      window = {
        width = 35, 
        mappings = {
          ["<cr>"] = "open",           -- Open the selected file
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {

            added     = "✚",  
            deleted   = "✖", 
            modified  = "",
            renamed   = "󰁕",
            untracked = "U", 
            ignored   = "◌",  
            unstaged  = "󰄱", 
            staged    = "S", 
            conflict  = "", 
          }
        }
      },
filtered_items = {
        visible = true, 
        hide_dotfiles = false, 
        hide_gitignored = false, 
        always_show = {
          ".gitignore",
	".git",
        },
      },
    })  

    -- Key mappings for Neo-tree
    local keymap = vim.keymap
    keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Open NeoTree buffers" })
    keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
  end,
}
