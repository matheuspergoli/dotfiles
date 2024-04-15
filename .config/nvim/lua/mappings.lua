require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR><Esc>", { desc = "Save and exit insert mode" })

map({ "v" }, "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move line down" })
map({ "v" }, "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move line up" })

-- Tmux navigation
map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Harpoon
map({ "n" }, "<leader>a", function()
  local harpoon = require "harpoon"
  harpoon:list():append()
end, { desc = "Add current file to harpoon" })
map({ "n" }, "<leader>h", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon menu" })
map({ "n" }, "<leader>1", function()
  local harpoon = require "harpoon"
  harpoon:list():select(1)
end, { desc = "Select harpoon item 1" })
map({ "n" }, "<leader>2", function()
  local harpoon = require "harpoon"
  harpoon:list():select(2)
end, { desc = "Select harpoon item 2" })
map({ "n" }, "<leader>3", function()
  local harpoon = require "harpoon"
  harpoon:list():select(3)
end, { desc = "Select harpoon item 3" })
map({ "n" }, "<leader>4", function()
  local harpoon = require "harpoon"
  harpoon:list():select(4)
end, { desc = "Select harpoon item 4" })
