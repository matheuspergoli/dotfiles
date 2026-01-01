return {
  view = {
    adaptive_size = true,
  },

  git = {
    enable = true,
    ignore = true,
  },

  filters = {
    dotfiles = false,
    git_ignored = false,
  },

  renderer = {
    -- none | simple | all
    hidden_display = "none",

    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },

      glyphs = {
        folder = {
          arrow_open = "",
          arrow_closed = "",
        },
      },
    },
  },

  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
}
