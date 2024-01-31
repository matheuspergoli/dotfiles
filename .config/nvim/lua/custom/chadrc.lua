---@type ChadrcConfig
local M = {}

vim.o.relativenumber = true
vim.g.copilot_assume_mapped = true

M.ui = { theme = "tokyodark" }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
