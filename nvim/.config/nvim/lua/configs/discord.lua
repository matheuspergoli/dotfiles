return {
  editor = {
    tooltip = "btw",
    client = "neovim",
  },

  display = {
    flavor = "dark",
    theme = "default",
    swap_icons = false,
    swap_fields = false,
  },

  idle = {
    enabled = true,
    timeout = 300000,
    show_status = true,
    details = "idle",
    tooltip = "afk",
  },

  text = {
    viewing = function(opts)
      return string.format("viewing %s", opts.filename or "file")
    end,

    editing = function(opts)
      local modified = vim.bo.modified and " *" or ""
      return string.format("editing %s%s", opts.filename or "file", modified)
    end,

    file_browser = function(opts)
      return string.format("browsing %s", opts.workspace or "files")
    end,

    plugin_manager = function()
      return "managing plugins"
    end,

    lsp = function()
      return "configuring lsp"
    end,

    vcs = function()
      return "committing"
    end,

    workspace = function(opts)
      local workspace = opts.workspace or "workspace"
      if opts.git_branch and opts.git_branch ~= "" then
        return string.format("%s • %s", workspace, opts.git_branch)
      end
      return workspace
    end,

    debug = function()
      return "debugging"
    end,

    terminal = function()
      return "terminal"
    end,
  },
}
