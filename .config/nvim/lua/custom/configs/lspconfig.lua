local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "tsserver", "tailwindcss", "eslint", "prismals", "html", "cssls" }

for _, lsp in ipairs(servers) do
	local config = {
		on_attach = on_attach,
		capabilities = capabilities,
		semanticTokens = true,
	}

	if lsp == "tailwindcss" then
		config.settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					},
				},
			},
		}
	end

	lspconfig[lsp].setup(config)
end
