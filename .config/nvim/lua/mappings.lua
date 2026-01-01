require "nvchad.mappings"

local map = vim.keymap.set

-- Centered navigation
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- Quick commands
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save in insert/visual" })

-- Move lines
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- TMUX navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window up" })

-- Better paste/indenting
map("x", "p", '"_dP', { desc = "Paste without yanking" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- vtsls specific
map("n", "<leader>cR", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.removeUnused" },
      diagnostics = {},
    },
  }
end, { desc = "Remove Unused Imports" })
map("n", "<leader>cA", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.addMissingImports" },
      diagnostics = {},
    },
  }
end, { desc = "Add Missing Imports" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map(
  "n",
  "<leader>xl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "LSP Definitions/References (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
