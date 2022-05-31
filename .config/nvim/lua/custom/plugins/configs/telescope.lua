local M = {}

local previewers = require('telescope.previewers')
local previewers_utils = require('telescope.previewers.utils')

local max_size = 100000
local truncate_large_files = function(filepath, bufnr, opts)
   opts = opts or {}

   filepath = vim.fn.expand(filepath)
   vim.loop.fs_stat(filepath, function(_, stat)
      if not stat then return end
      if stat.size > max_size then
         local cmd = { "head", "-c", max_size, filepath }
         previewers_utils.job_maker(cmd, bufnr, opts)
      else
         previewers.buffer_previewer_maker(filepath, bufnr, opts)
      end
   end)
end

M.defaults = {
   vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "-g",
      "!Music",
      "-g",
      "!Bulk",
      "-g",
      "!node_modules",
      "-g",
      "!.git",
   },
   buffer_previewer_maker = truncate_large_files,
}

M.pickers = {
   find_files = {
      find_command = {
         "rg",
         "--color=never",
         "--files",
         "--hidden",
         "--smart-case",
         "-g",
         "!Music",
         "-g",
         "!Bulk",
         "-g",
         "!node_modules",
         "-g",
         "!.git",
      },
   },
}

M.extensions = {
   fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
   },
}

return M
