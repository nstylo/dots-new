local telescope_config = require "custom.plugins.configs.telescope"
local treesitter_config = require "custom.plugins.configs.treesitter"
local nvim_tree_config = require "custom.plugins.configs.nvimtree"
local nvim_cmp_config = require "custom.plugins.configs.cmp"
local my_plugins = require "custom.plugins"

local M = {}

-- Changing theme:
M.ui = {
   theme = "gruvbox",
}

-- make sure you maintain the structure of `core/default_config.lua` here,
M.plugins = {
   user = my_plugins,
   override = {
      ["nvim-treesitter/nvim-treesitter"] = treesitter_config,
      ["nvim-telescope/telescope.nvim"] = telescope_config,
      ["kyazdani42/nvim-tree.lua"] = nvim_tree_config,
      ["hrsh7th/nvim-cmp"] = nvim_cmp_config,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.configs.lspconfig",
      },
   },
}

M.mappings = {
   terminal = {
      esc_hide_termmode = {},
   },
   general = {
      n = {
         ["<Up>"] = { "<cmd> :res +5<CR>" },
         ["<Down>"] = { "<cmd> :res -5<CR>" },
         ["<Right>"] = { "<cmd> :vertical res +5<CR>" },
         ["<Left>"] = { "<cmd> :vertical res -5<CR>" },
      }
   },
}

return M
