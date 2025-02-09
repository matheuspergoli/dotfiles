local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },

    json = { "biome" },
    yaml = { "biome" },

    css = { "biome" },
    html = { "biome" },

    rust = { "rustfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
