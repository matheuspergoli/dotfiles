return {
  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.file_ignore_patterns = {
        "dist",
        "node_modules",
        "target",
        ".git",
        "build",
        "lib/",
        ".next",
        "ios",
        "android",
        ".expo",
        "public",
        ".*lock.*",
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      pkgs = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "prisma",
        "markdown",
        "markdown_inline",
        "rust",
        "go",
      },
      indent = {
        enable = true,
      },
    },
  },
}
