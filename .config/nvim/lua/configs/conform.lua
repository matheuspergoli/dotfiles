local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },

    json = { "prettierd" },
    yaml = { "prettierd" },

    css = { "prettierd" },
    html = { "prettierd" },

    rust = { "rustfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
