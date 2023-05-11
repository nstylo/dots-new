local null_ls = require "null-ls"
local helpers = require "null-ls.helpers"
local b = null_ls.builtins

local sources = {

  -- Markup
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "yaml" } },

  -- JS
  b.formatting.prettier.with { filetypes = { "javascript", "typescript", "vue", "javascriptreact", "typescriptreact" } },

  -- Lua
  b.formatting.stylua.with { filetypes = { "lua" } },

  -- Shell
  b.formatting.shfmt.with { args = { "-filename", "$FILENAME", "-i", "4" } },

  -- Python
  b.formatting.black,
  b.formatting.isort,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,

  -- QML
  -- b.diagnostics.qmllint.with { filetypes = { "qml", "qmljs" } },
}

local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr }
          end,
        })
      end
    end,
  }
end

-- Custom qmllint (errorfmt wasn't correct in builtin)
local qmllint = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "qml", "qmljs" },
  -- null_ls.generator creates an async source
  -- that spawns the command with the given arguments and options
  generator = null_ls.generator {
    name = "qmllint",
    command = "qmllint",
    args = { "$FILENAME" },
    to_stdin = false,
    from_stderr = true,
    to_temp_file = true,
    -- choose an output format (raw, json, or line)
    format = "raw",
    -- use helpers to parse the output from string matchers,
    -- or parse it manually with a function
    on_output = helpers.diagnostics.from_errorformat("%f:%l : %m", "qmllint"),
  },
}

null_ls.register(qmllint)

return M
