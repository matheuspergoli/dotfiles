local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "biome-check" },
    typescript = { "biome-check" },
    javascriptreact = { "biome-check" },
    typescriptreact = { "biome-check" },

    json = { "biome-check" },
    yaml = { "biome-check" },

    css = { "biome-check" },
    html = { "biome-check" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
