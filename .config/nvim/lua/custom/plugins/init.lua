return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cmd = "Telescope",
    config = function ()
      require("telescope").load_extension("fzf")
    end
  },
  {
    "williamboman/nvim-lsp-installer",
    -- TODO: we might want to lazy load differently
    cmd = {
      "LspInstall",
      "LspInstallInfo",
      "LspUninstall",
      "LspUninstallAll",
      "LspInstallLog",
      "LspPrintInstalled"
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.configs.null-ls").setup()
    end
  }
}
