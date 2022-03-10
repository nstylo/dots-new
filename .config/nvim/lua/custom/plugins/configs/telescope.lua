local M = {}

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
