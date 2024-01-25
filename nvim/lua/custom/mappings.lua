local M = {}

M.tmux = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.harpoon = {
	n = {
		["<leader>a"] = {
			function()
				local harpoon = require("harpoon")
				harpoon:list():append()
			end,
		},
		["<leader>h"] = {
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
		},
		["<leader>1"] = {
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(1)
			end,
		},
		["<leader>2"] = {
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(2)
			end,
		},
		["<leader>3"] = {
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
		},
		["<leader>4"] = {
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
		},
	},
}

M.general = {
	v = {
		["<A-j>"] = { ":m '>+1<CR>gv=gv", "move line down" },
		["<A-k>"] = { ":m '<-2<CR>gv=gv", "move line up" },
	},
	i = {
		["<C-s>"] = { "<cmd> w <CR><Esc>", "save and exit insert mode" },
	},
}

return M
