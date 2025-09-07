return {
	-- Mason core
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	-- Mason + LSP bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "clangd", "pyright" },
			}

			local lspconfig = require("lspconfig")

			-- C / C++
			lspconfig.clangd.setup {}

			-- Python
			lspconfig.pyright.setup {}
		end,
	},
}

