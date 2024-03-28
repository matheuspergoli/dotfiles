local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		-- BufWritePre
		event = { "BufReadPre", "BufNewFile", "BufWritePre" },
		config = function()
			require("custom.configs.conform")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
}
return plugins
