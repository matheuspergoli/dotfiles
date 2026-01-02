-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  cmp = {
    style = "default",
  },

  telescope = { style = "bordered" },
}

M.base46 = {
  theme = "tokyodark",
}

M.nvdash = {
  load_on_startup = false,
}

return M
