local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"prisma",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- as pinga de lua
		"lua-language-server",
		"stylua",

		-- as pinga de web
		"css-lsp",
		"html-lsp",
		"eslint-lsp",
		"prettierd",
		"tailwindcss-language-server",
		"typescript-language-server",

		-- zap
		"prisma-language-server",
	},
}

M.nvimtree = {
	git = {
		enable = true,
		ignore = false,
	},

	view = {
		adaptive_size = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
