local M = {}

M.ensure_installed = {
  "lua",
  "python",
  "javascript",
  "typescript",
  "html",
  "css",
  "comment",
  "bash",
  "yaml",
  "json",
  "markdown",
  "haskell",
  "json",
  "c",
  "cpp",
  "dockerfile",
  "go",
  "graphql",
  "vue",
  "query", -- treesitter query
  "sql",
}

M.indent = {
  enable = true,
  -- TEMP: for some reason the treesitter indentation is buggy
  disable = { "python" },
}

return M
