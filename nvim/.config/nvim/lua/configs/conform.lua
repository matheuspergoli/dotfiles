return {
  notify_on_error = false,

  default_format_opts = {
    async = true,
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "biome-check", "prettierd", stop_after_first = true },
    typescript = { "biome-check", "prettierd", stop_after_first = true },
    javascriptreact = { "biome-check", "prettierd", stop_after_first = true },
    typescriptreact = { "biome-check", "prettierd", stop_after_first = true },

    json = { "biome-check", "prettierd", stop_after_first = true },
    jsonc = { "biome-check", "prettierd", stop_after_first = true },

    css = { "biome-check", "prettierd", stop_after_first = true },
    scss = { "biome-check", "prettierd", stop_after_first = true },
    html = { "biome-check", "prettierd", stop_after_first = true },

    yaml = { "prettierd", stop_after_first = true },
    markdown = { "prettierd", stop_after_first = true },
  },

  formatters = {
    ["biome-check"] = {
      condition = function(_, ctx)
        return vim.fs.find({ "biome.json", "biome.jsonc" }, {
          path = ctx.filename,
          upward = true,
          stop = vim.uv.os_homedir(),
        })[1] ~= nil
      end,
    },
    prettierd = {
      condition = function(_, ctx)
        return vim.fs.find({
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
        }, {
          path = ctx.filename,
          upward = true,
          stop = vim.uv.os_homedir(),
        })[1] ~= nil
      end,
    },
  },
}
