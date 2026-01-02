-- load defaults
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- base config for all lsp
local base_config = {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

-- Biome
vim.lsp.config.biome = {
  cmd = { "biome", "lsp-proxy" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
  root_markers = { "biome.json", "biome.jsonc" },
  default_config = base_config,
}
vim.lsp.enable "biome"

-- Lua Language Server
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  default_config = base_config,
}
vim.lsp.enable "lua_ls"

-- Emmet Language Server
vim.lsp.config.emmet_language_server = {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
  root_markers = { ".git" },
  default_config = base_config,
}
vim.lsp.enable "emmet_language_server"

-- JSON Language Server with schemas
vim.lsp.config.jsonls = {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  default_config = vim.tbl_deep_extend("force", base_config, {
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig*.json" },
            url = "https://json.schemastore.org/tsconfig.json",
          },
          {
            fileMatch = {
              ".prettierrc",
              ".prettierrc.json",
              "prettier.config.json",
            },
            url = "https://json.schemastore.org/prettierrc.json",
          },
          {
            fileMatch = { ".eslintrc", ".eslintrc.json" },
            url = "https://json.schemastore.org/eslintrc.json",
          },
          {
            fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
            url = "https://json.schemastore.org/babelrc.json",
          },
          {
            fileMatch = { "now.json", "vercel.json" },
            url = "https://json.schemastore.org/now.json",
          },
        },
      },
    },
  }),
}
vim.lsp.enable "jsonls"

-- Prisma Language Server
vim.lsp.config.prismals = {
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  root_markers = { "package.json", ".git" },
  default_config = base_config,
}
vim.lsp.enable "prismals"

-- Tailwind CSS Language Server
vim.lsp.config.tailwindcss = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts" },
  default_config = vim.tbl_deep_extend("force", base_config, {
    settings = {
      tailwindCSS = {
        emmetCompletions = true,
        experimental = {
          classRegex = {
            { "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]?([^\"'`]+)[\"'`]?" },
            { "cn\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "Classes\\s*=\\s*computed\\(\\(\\)\\s*=>\\s*([\\s\\S]+?)\\)", "'([^']+)'" },
          },
        },
      },
    },
  }),
}
vim.lsp.enable "tailwindcss"

-- Prettierd
vim.lsp.config.prettierd = {
  cmd = { "prettierd" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
    "css",
    "scss",
    "html",
    "yaml",
    "markdown",
  },
  root_markers = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.mjs",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    "prettier.config.js",
    "prettier.config.cjs",
    "prettier.config.mjs",
    "package.json",
  },
  default_config = base_config,
}
vim.lsp.enable "prettierd"

-- VTSLS
vim.lsp.config.vtsls = {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  default_config = vim.tbl_deep_extend("force", base_config, {
    settings = {
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
      },
      javascript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
      },
    },
  }),
}
vim.lsp.enable "vtsls"
