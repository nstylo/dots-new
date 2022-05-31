local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "clangd", "pyright", "vuels", "tsserver", "yamlls", "dockerls" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end

   -- Open float diagnostics under cursor
   vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

   vim.cmd [[ do User LspAttachBuffers ]]

   vim.diagnostic.config {
      virtual_text = false,
   }
end

return M
