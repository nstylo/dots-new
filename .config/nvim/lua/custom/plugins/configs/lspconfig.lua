local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = { "html", "cssls", "clangd", "pyright", "volar", "tsserver", "yamlls", "dockerls", "gopls" }

for _, lsp in ipairs(servers) do
   lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
   }
end

-- Open float diagnostics under cursor
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.cmd [[ do User LspAttachBuffers ]]

vim.diagnostic.config {
   virtual_text = false,
}
