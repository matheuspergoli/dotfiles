return {
  auto_close = false,
  auto_refresh = true,
  auto_preview = true,
  focus = false,
  follow = true,
  restore = true,
  indent_guides = true,
  multiline = true,
  warn_no_results = true,

  win = {
    type = "split",
    position = "bottom",
    size = 10,
  },

  preview = {
    type = "main",
    scratch = true,
  },

  modes = {
    symbols = {
      desc = "document symbols",
      mode = "lsp_document_symbols",
      focus = false,
      win = {
        position = "right",
        size = 40,
      },
    },
  },
}
