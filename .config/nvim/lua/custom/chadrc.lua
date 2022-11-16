local my_plugins = require "custom.plugins"

local M = {}

-- Changing theme:
M.ui = {
   theme = "gruvbox",
}

-- make sure you maintain the structure of `core/default_config.lua` here,
M.plugins = my_plugins

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
