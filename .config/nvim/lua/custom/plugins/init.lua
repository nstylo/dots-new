return {
  ["nvim-treesitter/playground"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.configs.null-ls").setup()
    end,
  },
  ["tpope/vim-fugitive"] = {
    -- TODO: should probably support all commands
    cmd = { "Git", "G" },
  },
  ["iamcco/markdown-preview.nvim"] = {
    ft = { "markdown" },
    run = "cd app && yarn install",
  },
  ["lark-parser/vim-lark-syntax"] = {
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "lark" },
  },
  ["raimon49/requirements.txt.vim"] = {
    ft = { "requirements" },
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require "custom.plugins.configs.dap-ui"
    end,
    requires = {
      {
        "mfussenegger/nvim-dap",
      },
    },
  },
  ["mfussenegger/nvim-dap-python"] = {
    config = function()
      require "custom.plugins.configs.dap-python"
    end,
    requires = {
      "mfussenegger/nvim-dap",
    },
    ft = { "python", "htmldjango" },
  },
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.configs.dap"
    end,
  },
}
