local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "yaml" } },

   -- Lua
   b.formatting.stylua.with { args = { "--indent-width", "3", "--indent-type", "spaces" } },

   -- Shell
   b.formatting.shfmt.with { args = { "-filename", "$FILENAME", "-i", "4" } },

   -- Python
   b.formatting.black,

   -- JS
   b.formatting.prettier.with { filetypes = { "javascript", "typescript", "vue" }},
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
