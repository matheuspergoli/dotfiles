return {
  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "editorconfig/editorconfig-vim",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
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
        "package%-lock.json",
        "pnpm%-lock.yaml",
        "ios",
        "android",
        ".expo",
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
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",

        -- LSPs
        "gopls", -- gopls
        "css-lsp", -- cssls
        "html-lsp", -- html
        "eslint-lsp", -- eslint
        "lua-language-server", -- lua_ls
        "rust-analyzer", -- rust_analyzer
        "prisma-language-server", -- prismals
        "typescript-language-server", -- tsserver
        "tailwindcss-language-server", -- tailwindcss
        "emmet-language-server", -- emmet_language_server
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
