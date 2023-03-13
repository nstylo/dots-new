return {
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = function()
      return require "custom.plugins.configs.treesitter"
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = function()
      return require "custom.plugins.configs.telescope"
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      return require "custom.plugins.configs.cmp"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        "css-lsp",
        "dockerfile-language-server",
        "go-debug-adapter",
        "gofumpt",
        "goimports",
        "gopls",
        "html-lsp",
        "lua-language-server",
        "pyright",
        "python-lsp-server",
        "rust-analyzer",
        "rustfmt",
        "shfmt",
        "stylua",
        "typescript-language-server",
        "vue-language-server",
        "yaml-language-server",
        "clangd",
        "black",
        "isort",
        "prettier",
        "prettierd",
      },
    },
  },
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
    -- TODO: this is temporary until the shebang detection is not buggy anymore
    commit = "f3f13b9fdcb09a0903169c18014d413cbbb46c7b",
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["jvgrootveld/telescope-zoxide"] = {
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  ["vyperlang/vim-vyper"] = {
    ft = { "vyper" },
  },
  ["gpanders/editorconfig.nvim"] = {},
}
