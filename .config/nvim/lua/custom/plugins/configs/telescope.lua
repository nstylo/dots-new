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
  file_ignore_patterns = { "node_modules", "venv" },
  path_display = { "truncate" },
  dynamic_preview_title = true,
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

M.extensions_list = {
  "zoxide",
}

return M
